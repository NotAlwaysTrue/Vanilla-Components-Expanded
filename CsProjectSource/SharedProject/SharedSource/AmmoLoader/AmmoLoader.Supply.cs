using System.Text.Json;
using Barotrauma.Items.Components;

namespace VCE.AmmoLoading;

/// <summary>One shared Condition budget. Costs are Condition consumed per projectile.</summary>
public sealed record AmmoSupplyDefinition(string PoolId, IReadOnlyDictionary<string, double> Costs);

public sealed partial class AmmoLoader
{
    /// <summary>
    /// Optional, authority-only adapter. Return null for ordinary intake items.
    /// The callback must only describe supplies; VCE owns consumption and synchronization.
    /// </summary>
    public Func<Item, AmmoSupplyDefinition?>? SupplyResolver { get; set; }

    private sealed record SupplyPool(string Id, string Prefab, double Amount, double Capacity, Dictionary<string, double> Costs);
    private sealed record SupplySource(Item Item, string PoolId);
    private sealed record SupplyQuote(Dictionary<string, int> Stock, Dictionary<string, double> Pools, bool CanLoad);
    private SupplyPool[] supplies = [];
    private SupplySource[] supplySources = [];
    private bool supplyError;
    private string observedSupply = "[]";

    private bool RefreshSupplies()
    {
        var pools = new Dictionary<string, SupplyPool>(StringComparer.OrdinalIgnoreCase);
        var sources = new List<SupplySource>();
        bool failed = false;
        try
        {
            if (SupplyResolver != null && inputContainer?.Inventory != null)
            {
                foreach (var source in inputContainer.Inventory.AllItems.OrderBy(i => i.ID))
                {
                    if (source.Removed || source.IsInRemoveQueue) { continue; }
                    var definition = SupplyResolver(source);
                    if (definition == null) { continue; }
                    if (string.IsNullOrWhiteSpace(definition.PoolId) || definition.Costs == null ||
                        definition.Costs.Count == 0 || !float.IsFinite(source.Condition) || source.Condition < 0 ||
                        !float.IsFinite(source.MaxCondition) || source.MaxCondition <= 0)
                    { throw new ArgumentException("Invalid supply definition or source Condition."); }
                    var costs = new Dictionary<string, double>(StringComparer.OrdinalIgnoreCase);
                    foreach (var p in definition.Costs.OrderBy(p => p.Key, StringComparer.OrdinalIgnoreCase))
                    {
                        if (string.IsNullOrWhiteSpace(p.Key) || !IsProjectile(p.Key) || !double.IsFinite(p.Value) || p.Value <= 0 ||
                            !costs.TryAdd(p.Key.ToLowerInvariant(), p.Value))
                        { throw new ArgumentException("Supply costs must identify unique projectiles with finite positive costs."); }
                    }
                    string id = definition.PoolId.ToLowerInvariant();
                    if (pools.TryGetValue(id, out var pool))
                    {
                        if (pool.Costs.Count != costs.Count || pool.Costs.Any(p => !costs.TryGetValue(p.Key, out double cost) || cost != p.Value))
                        { throw new ArgumentException("Sources in the same supply pool must have identical costs."); }
                        pools[id] = pool with { Amount = pool.Amount + source.Condition, Capacity = pool.Capacity + source.MaxCondition };
                    }
                    else
                    {
                        // shortcut: one pool per projectile; add alternative-pool allocation when a mod needs it.
                        if (pools.Values.Any(p => p.Costs.Keys.Any(costs.ContainsKey)))
                        { throw new ArgumentException("Each projectile must belong to only one supply pool."); }
                        pools.Add(id, new(id, source.Prefab.Identifier.Value, source.Condition, source.MaxCondition, costs));
                    }
                    sources.Add(new(source, id));
                }
            }
        }
        catch (Exception e)
        {
            failed = true;
            if (!supplyError) { VanillaComponentsExpanded.VCEPlugin.DebugConsole.AddWarning($"AmmoLoader supply disabled: {e.Message}"); }
            pools.Clear();
        }
        var next = pools.Values.OrderBy(p => p.Id, StringComparer.Ordinal).ToArray();
        string state = JsonSerializer.Serialize(next);
        bool changed = state != observedSupply || failed != supplyError;
        supplies = next;
        supplySources = sources.ToArray();
        observedSupply = state;
        supplyError = failed;
        return changed;
    }

    private SupplyQuote QuoteSupply(IReadOnlyDictionary<string, int> demand)
    {
        var stock = new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase);
        var costs = new Dictionary<string, double>(StringComparer.OrdinalIgnoreCase);
        bool available = true;
        foreach (var p in demand)
        {
            int stored = Math.Min(Stock[p.Key], p.Value);
            if (stored > 0) { stock.Add(p.Key, stored); }
            int missing = p.Value - stored;
            if (missing <= 0) { continue; }
            var pool = supplies.FirstOrDefault(s => s.Costs.ContainsKey(p.Key));
            if (pool == null) { available = false; continue; }
            costs[pool.Id] = costs.GetValueOrDefault(pool.Id) + pool.Costs[p.Key] * missing;
        }
        available &= supplies.All(p => double.IsFinite(costs.GetValueOrDefault(p.Id)) && costs.GetValueOrDefault(p.Id) <= p.Amount);
        return new(stock, costs, available);
    }

    private Dictionary<string, int> SuppliedAmmo(SupplyQuote quote)
    {
        var result = new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase);
        foreach (var pool in supplies)
        {
            double remaining = Math.Max(0, pool.Amount - quote.Pools.GetValueOrDefault(pool.Id));
            foreach (var p in pool.Costs)
            { result.Add(p.Key, (int)Math.Min(int.MaxValue, Math.Floor(remaining / p.Value))); }
        }
        return result;
    }

    private bool TryPrepareSupplyDebit(SupplyQuote quote, out List<(Item Item, float Before, float After)> debits)
    {
        debits = [];
        if (!quote.CanLoad) { return false; }
        return TryPrepareSupplyChanges(quote.Pools, credit: false, out debits);
    }

    private int WithdrawalAmount(string id) => UseSupplyStorage ? AvailableAmount(id) : Stock[id];

    private int AvailableAmount(string id)
    {
        var pool = supplies.FirstOrDefault(p => p.Costs.ContainsKey(id));
        return (int)Math.Min(int.MaxValue, (double)Stock[id] + (pool == null ? 0 : Math.Floor(pool.Amount / pool.Costs[id])));
    }

    private bool TryPrepareReturn(IReadOnlyDictionary<string, int> rounds, out Dictionary<string, int> stored,
        out List<(Item Item, float Before, float After)> credits)
    {
        stored = new(rounds, StringComparer.OrdinalIgnoreCase);
        credits = [];
        if (UseSupplyStorage)
        {
            var amounts = new Dictionary<string, double>();
            foreach (var p in rounds.OrderBy(p => p.Key, StringComparer.Ordinal))
            {
                var pool = supplies.FirstOrDefault(s => s.Costs.ContainsKey(p.Key));
                if (pool == null) { continue; }
                double free = Math.Max(0, pool.Capacity - pool.Amount - amounts.GetValueOrDefault(pool.Id));
                int count = (int)Math.Min(p.Value, Math.Floor(free / pool.Costs[p.Key]));
                if (count <= 0) { continue; }
                amounts[pool.Id] = amounts.GetValueOrDefault(pool.Id) + count * pool.Costs[p.Key];
                if (count == p.Value) { stored.Remove(p.Key); }
                else { stored[p.Key] -= count; }
            }
            // Keep unrepresentable credits as concrete rounds instead of losing them to float precision.
            if (!TryPrepareSupplyChanges(amounts, credit: true, out credits))
            {
                stored = new(rounds, StringComparer.OrdinalIgnoreCase);
                credits = [];
            }
        }
        return stored.Count == 0 || Stock.CanAdd(stored);
    }

    private bool TryPrepareSupplyChanges(IReadOnlyDictionary<string, double> amounts, bool credit,
        out List<(Item Item, float Before, float After)> changes)
    {
        changes = [];
        foreach (var p in amounts)
        {
            double remaining = p.Value;
            foreach (var source in supplySources.Where(s => s.PoolId == p.Key))
            {
                var item = source.Item;
                if (item.Removed || item.IsInRemoveQueue || inputContainer?.Inventory.AllItems.Contains(item) != true) { return false; }
                double amount = Math.Min(remaining, credit ? item.MaxCondition - item.Condition : item.Condition);
                if (amount <= 0) { continue; }
                float after = (float)(item.Condition + (credit ? amount : -amount));
                if (credit ? after <= item.Condition : after >= item.Condition) { return false; }
                changes.Add((item, item.Condition, after));
                remaining -= amount;
                if (remaining <= 0) { break; }
            }
            if (remaining > 0) { return false; }
        }
        return true;
    }

    private bool TryApplySupplyChanges(List<(Item Item, float Before, float After)> changes)
    {
        if (changes.Any(c => c.Item.Removed || c.Item.IsInRemoveQueue || c.Item.Condition != c.Before ||
            inputContainer?.Inventory.AllItems.Contains(c.Item) != true)) { return false; }
        int applied = 0;
        try
        {
            foreach (var change in changes)
            {
                applied++;
                // A depleted source can remove itself; defer effects until the whole transfer commits.
                change.Item.SetCondition(change.After, isNetworkEvent: false, executeEffects: false);
                if (change.Item.Condition != change.After) { throw new InvalidOperationException("Supply Condition rejected the transfer."); }
            }
        }
        catch (Exception e)
        {
            foreach (var change in changes.Take(applied))
            {
                try { change.Item.SetCondition(change.Before, isNetworkEvent: false, executeEffects: false); }
                catch (Exception restoreError)
                { VanillaComponentsExpanded.VCEPlugin.DebugConsole.AddWarning($"AmmoLoader supply restore failed: {restoreError.Message}"); }
            }
            VanillaComponentsExpanded.VCEPlugin.DebugConsole.AddWarning($"AmmoLoader supply transfer rolled back: {e.Message}");
            return false;
        }
        return true;
    }

    private bool TryCommitSupplyDebit(SupplyQuote quote, List<(Item Item, float Before, float After)> debits)
    {
        if (quote.Stock.Count > 0 && !Stock.CanTake(quote.Stock) || !TryApplySupplyChanges(debits)) { return false; }
        if (quote.Stock.Count > 0) { Stock.TryTake(quote.Stock); }
        // Refillable supply storage must retain empty containers for later returns.
        if (UseSupplyStorage) { return true; }
        foreach (var debit in debits.Where(d => d.After == 0))
        {
            try
            {
#if CLIENT
                foreach (var component in debit.Item.GetComponents<ItemComponent>())
                {
                    component.PlaySound(ActionType.OnBroken);
                    component.StopSounds(ActionType.OnActive);
                }
#endif
                debit.Item.ApplyStatusEffects(ActionType.OnBroken, 1);
            }
            catch (Exception e)
            { VanillaComponentsExpanded.VCEPlugin.DebugConsole.AddWarning($"AmmoLoader committed supply exhaustion effect failed: {e.Message}"); }
        }
        return true;
    }

    private static bool ValidSupplies(SupplyPool[] pools)
    {
        var poolIds = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
        var ammoIds = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
        return pools.All(p => p != null && !string.IsNullOrWhiteSpace(p.Id) && poolIds.Add(p.Id) &&
            !string.IsNullOrWhiteSpace(p.Prefab) && double.IsFinite(p.Amount) && p.Amount >= 0 &&
            double.IsFinite(p.Capacity) && p.Capacity > 0 && p.Costs is { Count: > 0 } &&
            p.Costs.All(c => !string.IsNullOrWhiteSpace(c.Key) && ammoIds.Add(c.Key) &&
                double.IsFinite(c.Value) && c.Value > 0));
    }
}
