using System;
using System.Reflection;
using System.Runtime.InteropServices;

[assembly: AssemblyCompany("{CompanyName}")]
[assembly: AssemblyProduct("{ModuleTitle}")]
[assembly: AssemblyCopyright("{Copyright}")]

[assembly: AssemblyFileVersion("1.0.0.0")]
[assembly: AssemblyVersion("1.0.0.0")]

#if DEBUG
[assembly: AssemblyConfiguration("Debug")]
#else
[assembly: AssemblyConfiguration("Release")]
#endif

[assembly: ComVisible(false)]
[assembly: CLSCompliant(true)]
