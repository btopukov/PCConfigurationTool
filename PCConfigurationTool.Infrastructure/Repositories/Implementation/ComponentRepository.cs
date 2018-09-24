using System;
using System.Collections.Generic;
using System.Linq;
using PCConfigurationTool.Infrastructure.Models;
using PCConfigurationTool.Infrastructure.Repositories.Implementation;
using PCConfigurationTool.Infrastructure.Repositories.Interfaces;

namespace PCConfigurationTool.Infrastructure.Repositories
{
    public class ComponentRepository : RepositoryBase<Component>, IComponentRepository
    {
    }
}
