using EntityFrameworkCore.Triggers;
using Microsoft.EntityFrameworkCore;

namespace {Namespace}.Data.Repositories
{
    public class {ModuleId}DbContext : DbContextWithTriggers
    {
        public {ModuleId}DbContext(DbContextOptions<{ModuleId}DbContext> options)
          : base(options)
        {
        }

        protected {ModuleId}DbContext(DbContextOptions options)
            : base(options)
        {
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //        modelBuilder.Entity<{ModuleId}Entity>().ToTable("MyModule").HasKey(x => x.Id);
            //        modelBuilder.Entity<{ModuleId}Entity>().Property(x => x.Id).HasMaxLength(128);
            //        base.OnModelCreating(modelBuilder);
        }
    }
}

