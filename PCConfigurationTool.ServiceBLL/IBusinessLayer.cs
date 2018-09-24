using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PCConfigurationTool.Infrastructure;
using PCConfigurationTool.Infrastructure.Models;

namespace PCConfigurationTool.ServiceBLL
{
    public interface IBusinessLayer
    {
        IList<Component> GetAllComponents();
        Component GetComponentById(int id);
        void AddComponent(params Component[] Components);
        void UpdateComponent(params Component[] Components);
        void RemoveComponent(params Component[] Components);

        PCConfiguration GetPCConfigurationsById(int id);
        void AddPCConfiguration(PCConfiguration PCConfiguration);
        void UpdateEmploee(PCConfiguration PCConfiguration);
        void RemovePCConfiguration(PCConfiguration PCConfiguration);
    }
}
