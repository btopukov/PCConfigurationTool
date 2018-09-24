namespace PCConfigurationTool.Infrastructure.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PCConfiguration")]
    public partial class PCConfiguration
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PCConfiguration()
        {
            PCComponentConfigurations = new HashSet<PCComponentConfiguration>();
        }

        public int Id { get; set; }

        public decimal TotalAmount { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PCComponentConfiguration> PCComponentConfigurations { get; set; }
    }
}
