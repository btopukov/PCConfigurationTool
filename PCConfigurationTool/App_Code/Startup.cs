using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PCConfigurationTool.Startup))]
namespace PCConfigurationTool
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
