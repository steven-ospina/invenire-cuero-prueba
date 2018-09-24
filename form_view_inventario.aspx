<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_view_inventario.aspx.cs" Inherits="form_view_inventario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="cod_prod" DataSourceID="SqlDataSource1" Width="100%">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="cod_prod,desc_prod" DataNavigateUrlFormatString="detail.aspx?id={0}&amp;c={1}" DataTextField="nom_prod" HeaderText="Insumos" />
            <asp:BoundField DataField="nom_prod" HeaderText="nom_prod" SortExpression="nom_prod" />
            <asp:BoundField DataField="cant_prod" HeaderText="cant_prod" SortExpression="cant_prod" />
            <asp:BoundField DataField="desc_prod" HeaderText="desc_prod" SortExpression="desc_prod" />
            <asp:BoundField DataField="fecha_caducidad" HeaderText="fecha_caducidad" SortExpression="fecha_caducidad" />
            <asp:BoundField DataField="fecha_ing" HeaderText="fecha_ing" SortExpression="fecha_ing" />
            <asp:BoundField DataField="ubicacion" HeaderText="ubicacion" SortExpression="ubicacion" />
        </Columns>
    </asp:GridView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT cod_prod, nom_prod, cant_prod, desc_prod, fecha_caducidad, fecha_ing, ubicacion FROM tbl_productos"></asp:SqlDataSource>

</asp:Content>

