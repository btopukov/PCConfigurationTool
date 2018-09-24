namespace PCConfigurationTool.Infrastructure.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class PCConfigurationToolModel : DbContext
    {
        public PCConfigurationToolModel()
            : base("name=PCConfigurationToolModel")
        {
        }

        public virtual DbSet<Component> Components { get; set; }
        public virtual DbSet<PCConfiguration> PCConfigurations { get; set; }
        public virtual DbSet<PCComponentConfiguration> PCConponentConfigurations { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Component>()
                .HasMany(e => e.PCComponentConfigurations)
                .WithRequired(e => e.Component)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PCConfiguration>()
                .HasMany(e => e.PCComponentConfigurations)
                .WithRequired(e => e.PCConfiguration)
                .HasForeignKey(e => e.PCConfigurationId)
                .WillCascadeOnDelete(false);
        }
    }
}
