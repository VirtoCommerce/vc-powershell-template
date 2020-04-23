using System.Collections.Generic;
using VirtoCommerce.Platform.Core.Settings;

namespace {Namespace}.Core
{
    public static class ModuleConstants
    {
        public static class Security
        {
            public static class Permissions
            {
                public const string Access = "{JsModuleId}:access";
                public const string Create = "{JsModuleId}:create";
                public const string Read = "{JsModuleId}:read";
                public const string Update = "{JsModuleId}:update";
                public const string Delete = "{JsModuleId}:delete";

                public static string[] AllPermissions { get; } = { Read, Create, Access, Update, Delete };
            }
        }

        public static class Settings
        {
            public static class General
            {
                public static SettingDescriptor {ModuleId}Enabled { get; } = new SettingDescriptor
                {
                    Name = "{ModuleId}.{ModuleId}Enabled",
                    GroupName = "{ModuleId}|General",
                    ValueType = SettingValueType.Boolean,
                    DefaultValue = false
                };

                public static SettingDescriptor {ModuleId}Password { get; } = new SettingDescriptor
                {
                    Name = "{ModuleId}.{ModuleId}Password",
                    GroupName = "{ModuleId}|Advanced",
                    ValueType = SettingValueType.SecureString,
                    DefaultValue = "qwerty"
                };

                public static IEnumerable<SettingDescriptor> AllSettings
                {
                    get
                    {
                        yield return {ModuleId}Enabled;
                        yield return {ModuleId}Password;
                    }
                }
            }

            public static IEnumerable<SettingDescriptor> AllSettings
            {
                get
                {
                    return General.AllSettings;
                }
            }
        }
    }
}
