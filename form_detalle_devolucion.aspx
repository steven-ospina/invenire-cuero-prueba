<%@ Page Language="C#" AutoEventWireup="true" CodeFile="form_detalle_devolucion.aspx.cs" Inherits="form_detalle_devolucion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<link rel="icon" type="image/png" href="file_img/caja-invenire-cuero-ico.ico" />
<script src="js/solo_numeros.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 45%;
            height: 111px;
        }
        .auto-style2 {
            width: 213px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="id Devolucion"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="id_devol" DataValueField="id_devol">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" SelectCommand="SELECT [id_devol] FROM [tbl_devolucion]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="id Detalle Pedido"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="id_det_ped" DataValueField="id_det_ped">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" SelectCommand="SELECT [id_det_ped] FROM [tbl_detalle_pedidos]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="Codigo del  Producto"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="nom_prod" DataValueField="cod_prod">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" SelectCommand="SELECT [cod_prod], [nom_prod] FROM [tbl_productos]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label4" runat="server" Text="Cantidad del Pedido a Devolver"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_devol,id_det_ped" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="619px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id_devol" HeaderText="id_devol" ReadOnly="True" SortExpression="id_devol" />
                <asp:BoundField DataField="id_det_ped" HeaderText="id_det_ped" ReadOnly="True" SortExpression="id_det_ped" />
                <asp:BoundField DataField="cod_prod" HeaderText="cod_prod" SortExpression="cod_prod" />
                <asp:BoundField DataField="cant_prod" HeaderText="cant_prod" SortExpression="cant_prod" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" DeleteCommand="DELETE FROM [tbl_detalle_devolucion] WHERE [id_devol] = @id_devol AND [id_det_ped] = @id_det_ped" InsertCommand="INSERT INTO [tbl_detalle_devolucion] ([id_devol], [id_det_ped], [cod_prod], [cant_prod]) VALUES (@id_devol, @id_det_ped, @cod_prod, @cant_prod)" SelectCommand="SELECT * FROM [tbl_detalle_devolucion]" UpdateCommand="UPDATE [tbl_detalle_devolucion] SET [cod_prod] = @cod_prod, [cant_prod] = @cant_prod WHERE [id_devol] = @id_devol AND [id_det_ped] = @id_det_ped">
            <DeleteParameters>
                <asp:Parameter Name="id_devol" Type="Int32" />
                <asp:Parameter Name="id_det_ped" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id_devol" Type="Int32" />
                <asp:Parameter Name="id_det_ped" Type="Int32" />
                <asp:Parameter Name="cod_prod" Type="String" />
                <asp:Parameter Name="cant_prod" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="cod_prod" Type="String" />
                <asp:Parameter Name="cant_prod" Type="Int32" />
                <asp:Parameter Name="id_devol" Type="Int32" />
                <asp:Parameter Name="id_det_ped" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
