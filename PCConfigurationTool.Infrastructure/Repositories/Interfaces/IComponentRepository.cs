using System;
using System.Collections.Generic;
using System.Text;
using PCConfigurationTool.Infrastructure.Models;

namespace PCConfigurationTool.Infrastructure.Repositories.Interfaces
{
    public interface IComponentRepository : IGenericDataRepository<Component>
    {
        //IList<Component> GetAll();
    }
}
