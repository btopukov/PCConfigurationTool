using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PCConfigurationTool.Infrastructure.Models;
using PCConfigurationTool.Infrastructure.Repositories.Interfaces;

namespace PCConfigurationTool.Infrastructure.Repositories.Implementation
{
    public class PCConfigurationRepository : RepositoryBase<PCConfiguration>, IPCConfigurationRepository
    {
    }
}
