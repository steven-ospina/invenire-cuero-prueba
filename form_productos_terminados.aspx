<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_productos_terminados.aspx.cs" Inherits="form_productos_terminados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <title>Ingreso Productos Terminados</title>
    <style type="text/css">
        .auto-style1 {
            width: 53%;
            height: 82px;
        }
        .auto-style2 {
            width: 184px;
        }
        .auto-style3 {
            margin-left: 34;
        }
        </style>
     <link rel="icon" type="image/png" href="file_img/caja-invenire-cuero-ico.ico" />
     <script src="file_js/validaciones.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="Fecha"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="Date" CssClass="auto-style3" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text=" Usuario"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Expr1" DataValueField="doc_usu">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT doc_usu, nom_usu + ' ' + ape_usu AS Expr1, cod_rol FROM tbl_usuario WHERE (cod_rol = 4)"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="Nombre Producto"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Guardar Articulo" style="height: 26px" />
                    </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" ForeColor="#33CC33"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="Button1" runat="server" Text="Añadir Detalle Articulo" OnClick="Button1_Click" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="603px">
                <Columns>
                    <asp:BoundField DataField="id_det_pro" HeaderText="Nro." />
                    <asp:TemplateField HeaderText="Nombre Producto">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlproducto" runat="server" DataSourceID="SqlDataSource2" DataTextField="nom_producto" DataValueField="id_prod" SelectedValue='<%# DataBinder.Eval(Container, "DataItem.id_prod") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT [id_prod], [nom_producto] FROM [tbl_productos_terminados]"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Descripcion">
                        <ItemTemplate>
                            <asp:TextBox ID="descripcion" runat="server" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container, "DataItem.descripcion") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ubicacion">
                        <ItemTemplate>
                            <asp:TextBox ID="ubicacion" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ubicacion") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="Button3" runat="server" Text="Confirmar Detalle" OnClick="Button2_Click" />
            <asp:Label ID="Label4" runat="server" ForeColor="#CC0000"></asp:Label>
        </div>
        
</asp:Content>

