<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_modulos_por_rol.aspx.cs" Inherits="form_modulos_por_rol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="nom_rol" DataValueField="cod_rol"></asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT * FROM [tbl_rol]"></asp:SqlDataSource>
<br />
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="modulo_id" DataSourceID="SqlDataSource2">
    <Columns>
        <asp:BoundField DataField="modulo_id" HeaderText="modulo_id" InsertVisible="False" ReadOnly="True" SortExpression="modulo_id" />
        <asp:BoundField DataField="modulo_nom" HeaderText="modulo_nom" SortExpression="modulo_nom" />
        <asp:TemplateField HeaderText="Concedido">
            <ItemTemplate>
                <asp:CheckBox ID="CheckBox1" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT * FROM [tbl_modulo]"></asp:SqlDataSource>
<br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Guardar Configuracion" />
<asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
<br />
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
    <Columns>
        <asp:BoundField DataField="nom_rol" HeaderText="nom_rol" SortExpression="nom_rol" />
        <asp:BoundField DataField="modulo_nom" HeaderText="modulo_nom" SortExpression="modulo_nom" />
        <asp:BoundField DataField="seleccionado" HeaderText="seleccionado" SortExpression="seleccionado" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT tbl_rol.nom_rol, tbl_modulo.modulo_nom, tbl_per_rol.seleccionado FROM tbl_per_rol INNER JOIN tbl_modulo ON tbl_per_rol.modulo_id = tbl_modulo.modulo_id INNER JOIN tbl_rol ON tbl_per_rol.cod_rol = tbl_rol.cod_rol"></asp:SqlDataSource>
</asp:Content>

