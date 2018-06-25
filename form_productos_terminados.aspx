<%@ Page Language="C#" AutoEventWireup="true" CodeFile="form_productos_terminados.aspx.cs" Inherits="form_productos_terminados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
 <link rel="icon" type="image/png" href="imagenes/caja-invenire-cuero-ico.ico" />
 <script src="js/solo_numeros.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 39%;
            height: 82px;
        }
        .auto-style2 {
            width: 184px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="Fecha"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Documento Usuario"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" onkeypress="return numbersonly(event);"></asp:TextBox>
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_prod" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="441px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id_prod" HeaderText="id_prod" InsertVisible="False" ReadOnly="True" SortExpression="id_prod" />
                <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" />
                <asp:BoundField DataField="doc_usu" HeaderText="Documento del Usuario" SortExpression="doc_usu" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" DeleteCommand="DELETE FROM [tbl_productos_terminados] WHERE [id_prod] = @id_prod" InsertCommand="INSERT INTO [tbl_productos_terminados] ([fecha], [doc_usu]) VALUES (@fecha, @doc_usu)" SelectCommand="SELECT * FROM [tbl_productos_terminados]" UpdateCommand="UPDATE [tbl_productos_terminados] SET [fecha] = @fecha, [doc_usu] = @doc_usu WHERE [id_prod] = @id_prod">
            <DeleteParameters>
                <asp:Parameter Name="id_prod" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="fecha" Type="String" />
                <asp:Parameter Name="doc_usu" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="fecha" Type="String" />
                <asp:Parameter Name="doc_usu" Type="String" />
                <asp:Parameter Name="id_prod" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
