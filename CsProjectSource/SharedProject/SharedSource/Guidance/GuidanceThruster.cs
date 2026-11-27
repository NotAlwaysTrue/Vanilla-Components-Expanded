using Barotrauma.Items.Components;

namespace VCE_Guidance;

public sealed class GuidanceThruster : ItemComponent
{
    private readonly float thrust, consumption, minimum;
    public GuidanceThruster(Item item, ContentXElement element) : base(item, element)
    {
        thrust = element.GetAttributeFloat("maxthrust", 20);
        consumption = element.GetAttributeFloat("fuelconsumption", 1);
        minimum = Math.Clamp(element.GetAttributeFloat("minthrottle", 0), 0, 1);
    }

    // Called only by an in-flight projectile on the simulation authority.
    internal void Burn(Vector2 forward, float throttle, float dt)
    {
        if (item.Condition <= 0 || throttle <= 0) return;
        throttle = Math.Clamp(throttle, minimum, 1);
        float cost = consumption * throttle * dt;
        float available = cost > item.Condition ? item.Condition / cost : 1;
        item.body.ApplyForce(forward * (thrust * throttle * available));
        if (cost > 0) item.Condition -= cost * available;
    }
}
