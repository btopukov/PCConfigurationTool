using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PCConfigurationTool.Infrastructure.Models;

namespace PCConfigurationTool.Infrastructure.Repositories.Interfaces
{
    public interface IPCConfigurationRepository : IGenericDataRepository<PCConfiguration>
    {
    }
}
