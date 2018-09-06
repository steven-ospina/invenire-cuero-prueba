<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_eliminar_permiso_rol.aspx.cs" Inherits="form_eliminar_permiso_rol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style1 {
        text-align: center;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Button ID="Button1" runat="server" Text="Eliminar Modulos" OnClick="Button1_Click" />
    <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
    <br />
        <br />
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="cod_rol,modulo_id" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="cod_rol" HeaderText="cod_rol" SortExpression="cod_rol" ReadOnly="True" />
        <asp:BoundField DataField="modulo_id" HeaderText="modulo_id" ReadOnly="True" SortExpression="modulo_id" />
        <asp:BoundField DataField="nom_rol" HeaderText="nom_rol" SortExpression="nom_rol" />
        <asp:BoundField DataField="modulo_nom" HeaderText="modulo_nom" SortExpression="modulo_nom" />
        <asp:BoundField DataField="seleccionado" HeaderText="seleccionado" SortExpression="seleccionado" />
        <asp:TemplateField HeaderText="Eliminar">
            <ItemTemplate>
                <asp:CheckBox ID="CheckBox1" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT tbl_per_rol.cod_rol, tbl_per_rol.modulo_id, tbl_rol.nom_rol, tbl_modulo.modulo_nom, tbl_per_rol.seleccionado FROM tbl_modulo INNER JOIN tbl_per_rol ON tbl_modulo.modulo_id = tbl_per_rol.modulo_id INNER JOIN tbl_rol ON tbl_per_rol.cod_rol = tbl_rol.cod_rol"></asp:SqlDataSource>
</asp:Content>

