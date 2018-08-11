<%@ Page Language="C#" AutoEventWireup="true" CodeFile="form_detalle_productos.aspx.cs" Inherits="form_detalle_productos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
  <link rel="icon" type="image/png" href="file_img/caja-invenire-cuero-ico.ico" />
 <script src="js/solo_numeros.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 51%;
            height: 86px;
        }
        .auto-style2 {
            width: 244px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="id Producto"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="id_prod" DataValueField="id_prod">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" SelectCommand="SELECT [id_prod] FROM [tbl_productos_terminados]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Descripcion"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Height="69px" TextMode="MultiLine" Width="176px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="Nombre del Producto"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="nom_prod" DataValueField="nom_prod">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" SelectCommand="SELECT [nom_prod] FROM [tbl_productos_terminados]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Guardar" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id_det_pro" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="id_det_pro" HeaderText="id_det_pro" InsertVisible="False" ReadOnly="True" SortExpression="id_det_pro" />
                <asp:BoundField DataField="id_prod" HeaderText="id_prod" SortExpression="id_prod" />
                <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                <asp:BoundField DataField="nom_prod" HeaderText="nom_prod" SortExpression="nom_prod" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" DeleteCommand="DELETE FROM [tbl_detalle_productos] WHERE [id_det_pro] = @id_det_pro" InsertCommand="INSERT INTO [tbl_detalle_productos] ([id_prod], [descripcion], [nom_prod]) VALUES (@id_prod, @descripcion, @nom_prod)" SelectCommand="SELECT * FROM [tbl_detalle_productos]" UpdateCommand="UPDATE [tbl_detalle_productos] SET [id_prod] = @id_prod, [descripcion] = @descripcion, [nom_prod] = @nom_prod WHERE [id_det_pro] = @id_det_pro">
            <DeleteParameters>
                <asp:Parameter Name="id_det_pro" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id_prod" Type="Int32" />
                <asp:Parameter Name="descripcion" Type="String" />
                <asp:Parameter Name="nom_prod" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_prod" Type="Int32" />
                <asp:Parameter Name="descripcion" Type="String" />
                <asp:Parameter Name="nom_prod" Type="String" />
                <asp:Parameter Name="id_det_pro" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
