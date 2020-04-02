using {Namespace}.Core;
using {Namespace}.Data.Repositories;
using VirtoCommerce.Platform.Core.Modularity;
using VirtoCommerce.Platform.Core.Security;
using VirtoCommerce.Platform.Core.Settings;
using System.Linq;
using Microsoft.AspNetCore.Builder;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace {Namespace}.Web
{
    public class Module : IModule
    {
        public ManifestModuleInfo ModuleInfo { get; set; }

        public void Initialize(IServiceCollection serviceCollection)
        {
            // database initialization
            var configuration = serviceCollection.BuildServiceProvider().GetRequiredService<IConfiguration>();
            var connectionString = configuration.GetConnectionString("VirtoCommerce.{ModuleId}.Web") ?? configuration.GetConnectionString("VirtoCommerce");
            serviceCollection.AddDbContext<{ModuleId}DbContext>(options => options.UseSqlServer(connectionString));
        }

        public void PostInitialize(IApplicationBuilder appBuilder)
        {
            // register settings
            var settingsRegistrar = appBuilder.ApplicationServices.GetRequiredService<ISettingsRegistrar>();
            settingsRegistrar.RegisterSettings(ModuleConstants.Settings.AllSettings, ModuleInfo.Id);

            // register permissions
            var permissionsProvider = appBuilder.ApplicationServices.GetRequiredService<IPermissionsRegistrar>();
            permissionsProvider.RegisterPermissions(ModuleConstants.Security.Permissions.AllPermissions.Select(x =>
                new Permission()
                {
                    GroupName = "{ModuleId}",
                    ModuleId = ModuleInfo.Id,
                    Name = x
                }).ToArray());

        }

        public void Uninstall()
        {
            // do nothing in here
        }

    }

}
