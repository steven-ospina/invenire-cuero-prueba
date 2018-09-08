<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_img_insumos.aspx.cs" Inherits="form_img_insumos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <h2>Ingreso Imagen Insumos</h2>
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label2" runat="server" Text="Nombre Producto"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="nom_prod" DataValueField="cod_prod">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT [cod_prod], [nom_prod] FROM [tbl_productos]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label3" runat="server" Text="Cargar Imagen"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Guardar Foto" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="cod_prod" HeaderText="Nombre Producto" />
            <asp:TemplateField HeaderText="Imagen">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("cod_prod", "manejador_img_insumos.ashx?cod_prod={0}") %>' Width="120px" Height="120px"  />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

