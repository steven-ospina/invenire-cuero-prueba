<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_img_productos_terminados.aspx.cs" Inherits="form_img_productos_terminados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 81%;
            height: 66px;
        }
        .auto-style2 {
            width: 199px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Ingreso Imagen Producto Terminados</h2>
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label2" runat="server" Text="Nombre Producto"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="nom_producto" DataValueField="id_det_pro">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT tbl_detalle_productos.id_det_pro, tbl_productos_terminados.nom_producto FROM tbl_productos_terminados INNER JOIN tbl_detalle_productos ON tbl_productos_terminados.id_prod = tbl_detalle_productos.id_prod"></asp:SqlDataSource>
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
            <asp:BoundField DataField="id_det_prod" HeaderText="Nombre Producto" />
            <asp:TemplateField HeaderText="Imagen">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("id_det_prod", "manejador_tbl_prod_term.ashx?id_det_prod={0}") %>' Width="120px" Height="120px"  />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

