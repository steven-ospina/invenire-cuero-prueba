<%@ Page Language="C#" AutoEventWireup="true" CodeFile="form_detalle_pedidos.aspx.cs" Inherits="form_detalle_pedidos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<link rel="icon" type="image/png" href="imagenes/caja-invenire-cuero-ico.ico" />
<script src="js/solo_numeros.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 37%;
            height: 85px;
        }
        .auto-style2 {
            width: 179px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="Codigo Del Pedido"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="cod_ped" DataValueField="cod_ped">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" SelectCommand="SELECT [cod_ped] FROM [tbl_pedidos]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Codigo Del producto"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="cod_prod" DataValueField="cod_prod">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" SelectCommand="SELECT [cod_prod] FROM [tbl_productos]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="Cantidad Pedido"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Guardar" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_det_ped" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="613px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="cod_ped" HeaderText="Codigo del Pedido" SortExpression="cod_ped" />
                <asp:BoundField DataField="cod_prod" HeaderText="Codigo del Producto" SortExpression="cod_prod" />
                <asp:BoundField DataField="cant_ped" HeaderText="Cantidad del Pedido" SortExpression="cant_ped" />
                <asp:BoundField DataField="id_det_ped" HeaderText="ID Detalle del Pedido" InsertVisible="False" ReadOnly="True" SortExpression="id_det_ped" />
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" DeleteCommand="DELETE FROM [tbl_detalle_pedidos] WHERE [id_det_ped] = @id_det_ped" InsertCommand="INSERT INTO [tbl_detalle_pedidos] ([cod_ped], [cod_prod], [cant_ped]) VALUES (@cod_ped, @cod_prod, @cant_ped)" SelectCommand="SELECT * FROM [tbl_detalle_pedidos]" UpdateCommand="UPDATE [tbl_detalle_pedidos] SET [cod_ped] = @cod_ped, [cod_prod] = @cod_prod, [cant_ped] = @cant_ped WHERE [id_det_ped] = @id_det_ped">
            <DeleteParameters>
                <asp:Parameter Name="id_det_ped" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="cod_ped" Type="Int32" />
                <asp:Parameter Name="cod_prod" Type="String" />
                <asp:Parameter Name="cant_ped" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="cod_ped" Type="Int32" />
                <asp:Parameter Name="cod_prod" Type="String" />
                <asp:Parameter Name="cant_ped" Type="Int32" />
                <asp:Parameter Name="id_det_ped" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
