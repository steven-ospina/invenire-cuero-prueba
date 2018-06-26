<%@ Page Language="C#" AutoEventWireup="true" CodeFile="form_devolucion.aspx.cs" Inherits="form_devolucion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<link rel="icon" type="image/png" href="imagenes/caja-invenire-cuero-ico.ico" />
<script src="js/solo_numeros.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 52%;
            height: 98px;
        }
        .auto-style2 {
            width: 242px;
        }
        .auto-style3 {
            width: 242px;
            height: 26px;
        }
        .auto-style4 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" Text="Fecha de Devolucion"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="Documento Usuario"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_devol" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="432px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id_devol" HeaderText="ID Devolucion" InsertVisible="False" ReadOnly="True" SortExpression="id_devol" />
                <asp:BoundField DataField="fec_devol" HeaderText="Fecha de Devolucion" SortExpression="fec_devol" />
                <asp:BoundField DataField="doc_usu" HeaderText="Documento Usuario" SortExpression="doc_usu" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" DeleteCommand="DELETE FROM [tbl_devolucion] WHERE [id_devol] = @id_devol" InsertCommand="INSERT INTO [tbl_devolucion] ([fec_devol], [doc_usu]) VALUES (@fec_devol, @doc_usu)" SelectCommand="SELECT * FROM [tbl_devolucion]" UpdateCommand="UPDATE [tbl_devolucion] SET [fec_devol] = @fec_devol, [doc_usu] = @doc_usu WHERE [id_devol] = @id_devol">
            <DeleteParameters>
                <asp:Parameter Name="id_devol" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="fec_devol" Type="String" />
                <asp:Parameter Name="doc_usu" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="fec_devol" Type="String" />
                <asp:Parameter Name="doc_usu" Type="String" />
                <asp:Parameter Name="id_devol" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
