namespace PCConfigurationTool.Infrastructure.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PCComponentConfiguration")]
    public partial class PCComponentConfiguration
    {
        public int Id { get; set; }

        public int ComponentId { get; set; }

        public int PCConfigurationId { get; set; }

        public virtual Component Component { get; set; }

        public virtual PCConfiguration PCConfiguration { get; set; }
    }
}
