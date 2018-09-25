<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_view_productos_terminados.aspx.cs" Inherits="form_view_productos_terminados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Inventario Productos Terminados</h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_det_pro,id_prod" DataSourceID="SqlDataSource1" Width="100%" AllowPaging="True">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="id_prod" DataNavigateUrlFormatString="detail1.aspx?id={0}" DataTextField="nom_producto" HeaderText="Productos Terminados" />
            <asp:BoundField DataField="doc_usu" HeaderText="Documento Instructor" SortExpression="doc_usu" />
            <asp:BoundField DataField="ubicacion" HeaderText="Ubicacion" SortExpression="ubicacion" />
        </Columns>
        <RowStyle HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT tbl_detalle_productos.id_det_pro, tbl_productos_terminados.id_prod, tbl_detalle_productos.descripcion, tbl_detalle_productos.ubicacion, tbl_detalle_productos.hora, tbl_productos_terminados.fecha, tbl_productos_terminados.doc_usu, tbl_productos_terminados.nom_producto, tbl_productos_terminados.cant_prod_term FROM tbl_productos_terminados INNER JOIN tbl_detalle_productos ON tbl_productos_terminados.id_prod = tbl_detalle_productos.id_prod"></asp:SqlDataSource>
</asp:Content>

