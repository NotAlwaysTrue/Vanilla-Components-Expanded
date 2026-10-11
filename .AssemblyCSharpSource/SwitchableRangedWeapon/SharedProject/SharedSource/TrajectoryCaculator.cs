using Barotrauma.Items.Components;

namespace SRW
{
    public partial class TrajectoryCalculator : ItemComponent
    {
        public TrajectoryCalculator(Item item, ContentXElement element) : base(item, element)
        {
            InitProjSpecific(element);
        }
        partial void InitProjSpecific(ContentXElement Element);

    }
}