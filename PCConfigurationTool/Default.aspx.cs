using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using PCConfigurationTool.Infrastructure;
using PCConfigurationTool.Infrastructure.Models;
using PCConfigurationTool.Infrastructure.Repositories.Implementation;
using PCConfigurationTool.ServiceBLL;

public partial class _Default : Page
{
    IBusinessLayer businessLayer = new BuinessLayer();
    IList<Component> components = new List<Component>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        components = businessLayer.GetAllComponents();
        PopulateComponentsDropDownList(components);
        Session["PCConfigurationComponents"] = new List<Component>();
        lblError.Visible = false;
    }

    protected void PopulateComponentsDropDownList(IList<Component> components)
    {
        ddlComponents.Items.Clear();
        ddlComponents.DataSource = components;
        ddlComponents.DataBind();
        ddlComponents.Items.Insert(0, new ListItem(string.Empty, "0"));
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool isThereSelectedItem = gvConfiguration.Rows.Count > 0;

        if (!isThereSelectedItem)
        {
            lblTotalAmount.Visible = false;
            lblError.Visible = true;
            lblError.Text = "Please select at least one component!";
        }
        else
        {
            PCConfiguration pCConfiguration = new PCConfiguration();
            IBusinessLayer businessLayer = new BuinessLayer();
            decimal totalAmount = 0;
            foreach (GridViewRow row in gvConfiguration.Rows)
            {
                var id = int.Parse(row.Cells[0].Text);
                pCConfiguration.PCComponentConfigurations.Add(new PCComponentConfiguration { ComponentId = id, PCConfigurationId = pCConfiguration.Id });
                totalAmount += decimal.Parse(row.Cells[2].Text);
            }
            pCConfiguration.TotalAmount = totalAmount; // TODO fix this
            businessLayer.AddPCConfiguration(pCConfiguration);

            lblTotalAmount.Visible = false;
            ddlComponents.SelectedIndex = 0;
            gvConfiguration.DataSource = new List<Component>();
            gvConfiguration.DataBind();
            lblError.Visible = true;
            lblError.Text = "Configuration saved!";
        }
    }

    protected void ddlComponents_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<Component> selectedComponents = (List<Component>)Session["PCConfigurationComponents"];
        lblError.Visible = false;
        var a = ddlComponents.SelectedValue;
        int id = int.Parse(ddlComponents.SelectedValue);
        Component component = businessLayer.GetComponentById(id);
        selectedComponents.Add(component);
        SetTotalAmount(selectedComponents);
        Session["PCConfigurationComponents"] = selectedComponents;
        gvConfiguration.DataSource = (List<Component>)Session["PCConfigurationComponents"];
        gvConfiguration.DataBind();
        lblError.Visible = false;
    }

    protected void gvConfiguration_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        List<Component> selectedComponents = (List<Component>)Session["PCConfigurationComponents"];

        selectedComponents.RemoveAt(e.RowIndex);
        Session["PCConfigurationComponents"] = selectedComponents;

        if (selectedComponents.Count == 0)
        {
            lblTotalAmount.Visible = false;
            ddlComponents.SelectedIndex = 0;
        }
        else
        {
            SetTotalAmount(selectedComponents);
        }
        gvConfiguration.DataSource = (List<Component>)Session["PCConfigurationComponents"];
        gvConfiguration.DataBind();
    }

    private void SetTotalAmount(List<Component> components)
    {
        string totalAmountMessage = $"Total Amount: {components.Sum(x => x.Amount).ToString()} $";
        lblTotalAmount.Visible = true;
        lblTotalAmount.Text = totalAmountMessage;
    }
}