<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_view_inventario.aspx.cs" Inherits="form_view_inventario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Inventario Insumos</h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="cod_prod" DataSourceID="SqlDataSource1" Width="100%" AllowPaging="True">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="cod_prod,desc_prod" DataNavigateUrlFormatString="detail.aspx?id={0}&amp;c={1}" DataTextField="nom_prod" HeaderText="Insumos" />
            <asp:BoundField DataField="cant_prod" HeaderText="Cantida Disponible" SortExpression="cant_prod" />
            <asp:BoundField DataField="fecha_ing" HeaderText="Fecha-de-Ingreso" SortExpression="fecha_ing" />
            <asp:BoundField DataField="ubicacion" HeaderText="Ubicacion" SortExpression="ubicacion" />
        </Columns>
        <RowStyle HorizontalAlign="Center" />
    </asp:GridView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT [cod_prod], [nom_prod], [cant_prod], [desc_prod], [fecha_caducidad], [fecha_ing], [ubicacion], [hora] FROM [tbl_productos]"></asp:SqlDataSource>

</asp:Content>

