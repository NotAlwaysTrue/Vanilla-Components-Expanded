// Only the game boundary is stubbed; tests compile the actual loader and server command handler.
global using Barotrauma;
global using Barotrauma.Items.Components;
global using Barotrauma.Networking;
using System.Xml.Linq;

namespace Barotrauma
{
    public readonly record struct Identifier(string Value) { public static Identifier Empty => new(""); }
    public static class Identifiers { public static Identifier ToIdentifier(this string id) => new(id); }
    public enum IsPropertySaveable { No, Yes }
    public sealed class SerializeAttribute : Attribute
    {
        public SerializeAttribute(object value, IsPropertySaveable saveable, bool alwaysUseInstanceValues = false) { }
    }
    public sealed class ContentXElement(XElement element)
    {
        public XElement Element = element;
        public XName Name => Element.Name;
        public IEnumerable<ContentXElement> Elements() => Element.Elements().Select(e => new ContentXElement(e));
    }
    public sealed class IdRemap { }
    public sealed class Camera { }
    public static class Timing { public static double TotalTime; }
    public sealed class NetworkMember { public bool IsClient; }
    public static class GameMain { public static object? Server = new(); public static NetworkMember? NetworkMember; }
    public sealed class Prefabs
    {
        public readonly List<ItemPrefab> Values = [];
        public bool TryGet(Identifier id, out ItemPrefab prefab)
        {
            prefab = Values.FirstOrDefault(p => p.Identifier == id)!;
            return prefab != null;
        }
        public ItemPrefab? Find(Predicate<ItemPrefab> predicate) => Values.Find(predicate);
    }
    public sealed class ItemPrefab(string id, uint number, params string[] tags)
    {
        public static readonly Prefabs Prefabs = new();
        public Identifier Identifier = new(id);
        public uint UintIdentifier = number;
        public HashSet<Identifier> Tags = tags.Select(t => t.ToIdentifier()).ToHashSet();
        public ContentXElement ConfigElement = new(XElement.Parse("<Item><Projectile /></Item>"));
        public static ItemPrefab FindByIdentifier(Identifier id) => Prefabs.Values.Single(p => p.Identifier == id);
    }
    public sealed class Item(ushort id, ItemPrefab prefab)
    {
        public ushort ID = id;
        public ItemPrefab Prefab = prefab;
        public float Condition = 100;
        public bool Removed, IsInRemoveQueue;
        public readonly List<ItemComponent> Components = [];
        public readonly List<Item> ContainedItems = [];
        public readonly List<ItemComponent.IEventData> Events = [];
        public readonly List<ItemComponent.IEventData> Requests = [];
        public T? GetComponent<T>() => Components.OfType<T>().FirstOrDefault();
        public IEnumerable<T> GetComponents<T>() => Components.OfType<T>();
        public bool CanClientAccess(Client client) => client.Allowed;
        public void CreateServerEvent(ItemComponent component, ItemComponent.IEventData data) => Events.Add(data);
        public void CreateClientEvent(ItemComponent component, ItemComponent.IEventData data) => Requests.Add(data);
    }
    public sealed class ItemInventory(int capacity)
    {
        public int Capacity = capacity;
        public readonly List<Item> AllItems = [];
        public Item? GetItemAt(int slot) => AllItems.ElementAtOrDefault(slot);
    }
    public sealed class Spawner
    {
        public bool Removed;
        public void AddItemToRemoveQueue(Item item) => item.IsInRemoveQueue = true;
    }
    public static class Entity { public static Spawner Spawner = new(); }
}

namespace Barotrauma.Items.Components
{
    public class ItemComponent
    {
        public ItemComponent(Item item, ContentXElement element) { Item = item; }
        public Item Item;
        public bool IsActive;
        public interface IEventData { }
        public virtual void OnItemLoaded() { }
        public virtual void Update(float dt, Camera cam) { }
        public virtual XElement Save(XElement parent) { var saved = new XElement("AmmoLoader"); parent.Add(saved); return saved; }
        public virtual void Load(ContentXElement element, bool usePrefabValues, IdRemap remap, bool swap) { }
        public virtual IEventData ServerGetEventData() => null!;
        public virtual bool ValidateEventData(NetEntityEvent.IData data) => true;
        protected bool TryExtractEventData<T>(NetEntityEvent.IData data, out T value)
        {
            value = data is NetEntityEvent.Wrapper w && w.Value is T t ? t : default!;
            return value != null;
        }
        protected T ExtractEventData<T>(NetEntityEvent.IData data) => ((NetEntityEvent.Wrapper)data).Value is T t ? t : throw new Exception();
    }
    public sealed class ItemContainer(Item item, int capacity) : ItemComponent(item, new(new XElement("ItemContainer")))
    {
        public readonly ItemInventory Inventory = new(capacity);
    }
}

namespace Barotrauma.Networking
{
    public interface IClientSerializable { }
    public interface IServerSerializable { }
    public sealed class Client { public bool Allowed = true; }
    public static class NetEntityEvent
    {
        public interface IData { }
        public sealed record Wrapper(ItemComponent.IEventData Value) : IData;
    }
    public interface IWriteMessage
    {
        void WriteByte(byte n); void WriteUInt32(uint n); void WriteUInt16(ushort n);
        void WriteInt32(int n); void WriteString(string text);
    }
    public interface IReadMessage
    {
        byte ReadByte(); uint ReadUInt32(); ushort ReadUInt16(); int ReadInt32(); string ReadString();
    }
    public sealed class Message : IWriteMessage, IReadMessage
    {
        private readonly MemoryStream stream = new();
        private readonly BinaryWriter writer;
        private readonly BinaryReader reader;
        public Message() { writer = new(stream); reader = new(stream); }
        public int Length => (int)stream.Length;
        public Message Rewind() { stream.Position = 0; return this; }
        public void WriteByte(byte n) => writer.Write(n);
        public void WriteUInt32(uint n) => writer.Write(n);
        public void WriteUInt16(ushort n) => writer.Write(n);
        public void WriteInt32(int n) => writer.Write(n);
        public void WriteString(string text) => writer.Write(text);
        public byte ReadByte() => reader.ReadByte();
        public uint ReadUInt32() => reader.ReadUInt32();
        public ushort ReadUInt16() => reader.ReadUInt16();
        public int ReadInt32() => reader.ReadInt32();
        public string ReadString() => reader.ReadString();
    }
}

namespace VCE_VirtualizedMagazine
{
    public sealed partial class VirtualizedMagazine(Item item) : ItemComponent(item, new(new XElement("VirtualizedMagazine")))
    {
        public readonly Stack<Identifier> LoadedAmmoIdentifiers = new();
        public readonly HashSet<Identifier> AllowedAmmoTags = ["compatible".ToIdentifier()];
        public int MaxSize = 30;
        public int LoadedCount => LoadedAmmoIdentifiers.Count;
        public bool ThrowOnRefresh;
        public Identifier[] LoadedAmmoIdentifiersArray
        {
            get => LoadedAmmoIdentifiers.Reverse().ToArray();
            set { LoadedAmmoIdentifiers.Clear(); foreach (var id in value) { LoadedAmmoIdentifiers.Push(id); } UpdateAmmoData(); }
        }
        public static bool PrefabHasTag(ItemPrefab prefab, IEnumerable<Identifier> tags) => tags.Any(prefab.Tags.Contains);
        public void LoadAmmoArray(ref List<Identifier> list)
        {
            foreach (var id in list) { LoadedAmmoIdentifiers.Push(id); }
            list.Clear();
            UpdateAmmoData();
        }
        public void UnLoadAmmoArray(out List<Identifier> list)
        {
            list = LoadedAmmoIdentifiers.ToList();
            LoadedAmmoIdentifiers.Clear();
            UpdateAmmoData();
        }
        public void UpdateAmmoData()
        {
            Item.Condition = LoadedCount;
            SyncAmmoState();
            if (ThrowOnRefresh) { throw new InvalidOperationException("Injected external projectile failure"); }
        }
        partial void SyncAmmoState();
    }
}

namespace VanillaComponentsExpanded
{
    public static class VCEPlugin
    {
        public static readonly Log DebugConsole = new();
        public sealed class Log { public void AddWarning(string message) { } }
    }
}
