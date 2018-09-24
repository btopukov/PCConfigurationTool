<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row no-side-padding padding-top-20">
            <div class="col-md-9 no-side-padding">
                <div class="col-md-2 no-side-padding">
                    <asp:Label ID="lblDDLComponents" runat="server" Text="Select components:" class="align-label"></asp:Label>
                </div>
                <div class="col-md-9 no-side-padding">
                    <asp:DropDownList ID="ddlComponents" AutoPostBack="true" CssClass="form-control"
                        Width="200px" DataValueField="Id" DataTextField="Name" runat="server" OnSelectedIndexChanged="ddlComponents_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>
        </div>
    <div class="row padding-top-20">
        <div class="col-md-12 no-side-padding">
            <%--add dataTables to beautify grid design--%>
            <asp:GridView ID="gvConfiguration" DataKeyNames="Id" RowStyle-Wrap="true" AutoGenerateColumns="False" Height="100%" runat="server" Width="67%"
                OnRowDeleting="gvConfiguration_OnRowDeleting">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" />
                    <asp:ButtonField Text="Delete" CommandName="Delete" runat="server" ItemStyle-HorizontalAlign="Center" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <div class="row padding-top-20">
        <div class="col-md-8 no-side-padding">
            <asp:Label ID="lblTotalAmount" ForeColor="red" runat="server" Text="" Font-Bold="true" Font-Size="Large" Visible="false" CssClass="pull-right"></asp:Label>
        </div>
    </div>
    <div class="row padding-top-20">
        <div class="col-md-12 no-side-padding">
            <asp:Button ID="btnSave" class="btn btn-primary pull-left" runat="server" Text="Save" OnClick="btnSave_Click" />
        </div>
    </div>
    <div class="row">
        <asp:Label ID="lblError" Visible="false" ForeColor="red" runat="server" Text=""></asp:Label>
    </div>
    </div>
</asp:Content>
