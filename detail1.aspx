<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="detail1.aspx.cs" Inherits="detail1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Detalle Productos Terminados</h1>
        <asp:Button ID="Button1" runat="server" Text="Volver" OnClick="Button1_Click" Width="30%" />
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="100%" AutoGenerateRows="False" DataKeyNames="id_prod" DataSourceID="SqlDataSource1">
        <Fields>
            <asp:BoundField DataField="id_prod" HeaderText="ID-Producto" InsertVisible="False" ReadOnly="True" SortExpression="id_prod" />
            <asp:BoundField DataField="fecha" HeaderText="Fecha-de-Ingreso" SortExpression="fecha" />
            <asp:BoundField DataField="doc_usu" HeaderText="Documeto" SortExpression="doc_usu" />
            <asp:BoundField DataField="nom_producto" HeaderText="Nombre-Producto" SortExpression="nom_producto" />
            <asp:BoundField DataField="cant_prod_term" HeaderText="Cantida-del-Producto" SortExpression="cant_prod_term" />
            <asp:BoundField DataField="hora" HeaderText="Hora" SortExpression="hora" />
            <asp:BoundField DataField="descripcion" HeaderText="Descripcion" SortExpression="descripcion" />
            <asp:BoundField DataField="ubicacion" HeaderText="Ubicacion" SortExpression="ubicacion" />
        </Fields>
        <HeaderStyle HorizontalAlign="Left" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT tbl_productos_terminados.id_prod, tbl_productos_terminados.fecha, tbl_productos_terminados.doc_usu, tbl_productos_terminados.nom_producto, tbl_productos_terminados.cant_prod_term, tbl_productos_terminados.estado, tbl_detalle_productos.hora, tbl_detalle_productos.descripcion, tbl_detalle_productos.ubicacion FROM tbl_productos_terminados INNER JOIN tbl_detalle_productos ON tbl_productos_terminados.id_prod = tbl_detalle_productos.id_prod WHERE (tbl_productos_terminados.id_prod = @id_prod)">
        <SelectParameters>
            <asp:QueryStringParameter Name="id_prod" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

