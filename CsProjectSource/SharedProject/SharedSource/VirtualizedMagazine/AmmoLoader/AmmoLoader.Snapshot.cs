using System.Buffers.Binary;
using System.IO.Compression;
using System.Text;
using System.Text.Json;

namespace VCE_VirtualizedMagazine;

/// <summary>
/// Encoding of the periodic stock/supply snapshot. A machine holding hundreds of ammo types produces a JSON payload of
/// tens of kilobytes; splitting that into 128-character pages and re-serialising it for every queued page event was the
/// main cost of keeping a large stock in sync. The page size is shared with the client reader.
/// </summary>
public sealed partial class AmmoLoader
{
    private const int SnapshotPageSize = 128;
    private const int MaxSnapshotPages = 16384;
    private const int MaxSnapshotBytes = SnapshotPageSize * MaxSnapshotPages;
    private sealed record Snapshot(uint Revision, Dictionary<string, int> Stock, SupplyPool[]? Supplies = null,
        bool SupplyError = false, int TargetSlot = 0);

    /// <summary>
    /// Serialises the current state. Large payloads are Brotli-compressed and Base64-encoded behind a '~' prefix:
    /// the repeated key/field names dominate a stock snapshot, so compression removes most of the bytes. Compression
    /// is skipped when the result would not be smaller.
    /// </summary>
    private string EncodeSnapshot()
    {
        var snapshot = new Snapshot(revision, new Dictionary<string, int>(Stock.Counts), supplies, supplyError, TargetSlot);
        byte[] json = JsonSerializer.SerializeToUtf8Bytes(snapshot);
        if (json.Length is > SnapshotPageSize and <= MaxSnapshotBytes)
        {
            // Use a fast quality setting and only compress if Base64 still reduces the payload.
            var buffer = new byte[json.Length * 3 / 4];
            if (BrotliEncoder.TryCompress(json, buffer.AsSpan(sizeof(int)), out int written, quality: 1, window: 16) &&
                1 + 4 * ((written + sizeof(int) + 2) / 3) < json.Length)
            {
                BinaryPrimitives.WriteInt32LittleEndian(buffer, json.Length);
                return "~" + Convert.ToBase64String(buffer, 0, written + sizeof(int));
            }
        }
        return Encoding.UTF8.GetString(json);
    }

    /// <summary>Reverses <see cref="EncodeSnapshot" />. Returns null for a corrupt or unknown-format payload.</summary>
    private static Snapshot? DecodeSnapshot(string data)
    {
        try
        {
            if (!data.StartsWith('~')) { return JsonSerializer.Deserialize<Snapshot>(data); }
            byte[] compressed = Convert.FromBase64String(data[1..]);
            if (compressed.Length <= sizeof(int)) { return null; }
            int length = BinaryPrimitives.ReadInt32LittleEndian(compressed);
            if (length is < 1 or > MaxSnapshotBytes) { return null; }
            var json = new byte[length];
            return BrotliDecoder.TryDecompress(compressed.AsSpan(sizeof(int)), json, out int written) && written == length
                ? JsonSerializer.Deserialize<Snapshot>(json)
                : null;
        }
        catch (Exception e) when (e is FormatException or JsonException) { return null; }
    }
}
