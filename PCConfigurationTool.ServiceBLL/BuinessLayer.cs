using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PCConfigurationTool.Infrastructure;
using PCConfigurationTool.Infrastructure.Models;
using PCConfigurationTool.Infrastructure.Repositories;
using PCConfigurationTool.Infrastructure.Repositories.Implementation;
using PCConfigurationTool.Infrastructure.Repositories.Interfaces;

namespace PCConfigurationTool.ServiceBLL
{
    public class BuinessLayer : IBusinessLayer
    {
        private readonly IComponentRepository _componentRepository;
        private readonly IPCConfigurationRepository _PCConfigurationRepository;

        public BuinessLayer()
        {
            _componentRepository = new ComponentRepository();
            _PCConfigurationRepository = new PCConfigurationRepository();
        }

        public BuinessLayer(IComponentRepository deptRepository,
            IPCConfigurationRepository PCConfigurationRepository)
        {
            _componentRepository = deptRepository;
            _PCConfigurationRepository = PCConfigurationRepository;
        }

        public IList<Component> GetAllComponents()
        {
            return _componentRepository.GetAll();
        }

        public Component GetComponentById(int id)
        {
            return _componentRepository.GetById(x => x.Id == id);
        }

        public void AddComponent(params Component[] Components)
        {
            _componentRepository.Add(Components);
        }

        public void UpdateComponent(params Component[] Components)
        {
            _componentRepository.Update(Components);
        }

        public void RemoveComponent(params Component[] Components)
        {
            _componentRepository.Remove(Components);
        }

        public PCConfiguration GetPCConfigurationsById(int id)
        {
            return _PCConfigurationRepository.GetById(e => e.Id == id);
        }

        public void AddPCConfiguration(PCConfiguration PCConfiguration)
        {
            _PCConfigurationRepository.Add(PCConfiguration);
        }

        public void UpdateEmploee(PCConfiguration PCConfiguration)
        {
            _PCConfigurationRepository.Update(PCConfiguration);
        }

        public void RemovePCConfiguration(PCConfiguration PCConfiguration)
        {
            _PCConfigurationRepository.Remove(PCConfiguration);
        }
    }
}
