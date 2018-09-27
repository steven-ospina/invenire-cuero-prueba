<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_ingreso_pedidos.aspx.cs" Inherits="form_ingreso_pedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <title>Ingreso Pedidos</title>
        <link rel="icon" type="image/png" href="file_img/caja-invenire-cuero-ico.ico" />
        <style type="text/css">
            .auto-style1 {
                width: 100%;
            }
            .auto-style4 {
                width: 156px;
            }
            .auto-style7 {
                margin-left: 0;
            }
            .auto-style8 {
                width: 143px;
            }
            .auto-style9 {
                margin-left: 27;
                margin-right: 12;
            }
            .auto-style10 {
                width: 145px;
            }
            .auto-style11 {
                width: 263px;
            }
            .auto-style12 {
                width: 263px;
                height: 22px;
            }
            .auto-style13 {
                height: 22px;
            }
            .auto-style14 {
                width: 143px;
                height: 22px;
            }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Ficha Para El Consumo De Materiales De Calzado Y Marrroquineria</h2>
    <br />  
    <table class="auto-style1">
        <tr>
            <td class="auto-style11">
                <asp:Label ID="Label4" runat="server" Text="Docente Encargado"></asp:Label>
            </td>
            <td colspan="2">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="Expr1" DataValueField="doc_usu">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT tbl_rol.cod_rol, tbl_rol.nom_rol + ' ' + tbl_usuario.nom_usu + ' ' + tbl_usuario.ape_usu AS Expr1, tbl_usuario.doc_usu FROM tbl_rol INNER JOIN tbl_usuario ON tbl_rol.cod_rol = tbl_usuario.cod_rol WHERE (tbl_rol.cod_rol = 4)"></asp:SqlDataSource>
            </td>
            <td class="auto-style8">
                <asp:Label ID="Label8" runat="server" Text="Curso/ Tecnico"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Costo Por Par/Producto"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style12">
                <asp:Label ID="Label5" runat="server" Text="Nombre Producto"></asp:Label>
            </td>
            <td colspan="2" class="auto-style13">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style9"></asp:TextBox>
            </td>
            <td class="auto-style14">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style13">
                <asp:TextBox ID="TextBox4" runat="server" CssClass="auto-style7" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">
                <asp:Label ID="Label6" runat="server" Text="Fecha De Elaboracion Del Producto"></asp:Label>
            </td>
            <td class="auto-style10">
                <asp:TextBox ID="TextBox5" runat="server" Enabled="False" EnableTheming="False"></asp:TextBox>
            </td>
            <td class="auto-style4">
                <asp:Label ID="Label11" runat="server" Text=" Numero De Cedula"></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:Label ID="Label12" runat="server" Text="Numero Ficha"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label10" runat="server" Text="Cantidad A Producir"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">
                <asp:Label ID="Label7" runat="server" Text="Fecha De Entrega del Producto "></asp:Label>
            </td>
            <td class="auto-style10">
                <asp:TextBox ID="TextBox6" runat="server" TextMode="Date"></asp:TextBox>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBox7" runat="server" EnableTheming="False"></asp:TextBox>
            </td>
            <td class="auto-style8">
                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar Pedido" Width="114px" style="height: 26px" />
    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:TemplateField HeaderText="cod_pedido">
                <ItemTemplate>
                    <asp:TextBox ID="tbConsecutivo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.cod_ped") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Materia E Insumos.">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlInsumo" runat="server" DataSourceID="SqlDataSource4" DataTextField="nom_prod" DataValueField="cod_prod" SelectedValue='<%# DataBinder.Eval(Container, "DataItem.cod_prod") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT [cod_prod], [nom_prod] FROM [tbl_productos]"></asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mediddas"></asp:TemplateField>
            <asp:TemplateField HeaderText="Color o Referencia">
                <ItemTemplate>
                    <asp:TextBox ID="tbColorOreferencia" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.color_referencia") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText=" Consumo por Producto">
                <ItemTemplate>
                    <asp:TextBox ID="tbConsumoXproducto" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.consumo_x_producto") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Valor Unidad de Consumo">
                <ItemTemplate>
                    <asp:TextBox ID="tbValorUnidadConsumo" runat="server" Enabled="False" Text='<%# DataBinder.Eval(Container, "DataItem.valor_uni_consumo") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Valor del Producto Final">
                <ItemTemplate>
                    <asp:TextBox ID="tbValorProductoFinal" runat="server" Enabled="False" Text='<%# DataBinder.Eval(Container, "DataItem.valor_prod_final") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Valor de la Produccion">
                <ItemTemplate>
                    <asp:TextBox ID="tbValorProduccion" runat="server" Enabled="False" Text='<%# DataBinder.Eval(Container, "DataItem.valor_producion") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />

        </Columns>
    </asp:GridView>
    <br />
    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Observaciones" />
    <br />
    <asp:TextBox ID="TextBox10" runat="server" TextMode="MultiLine" Visible="False" Width="100%"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Confirmar" Visible="False" />
    <asp:Button ID="Button2" runat="server" Text="Guardar Pedidos" OnClick="Button2_Click" Visible="False" />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" ForeColor="#006600"></asp:Label>
</asp:Content>

