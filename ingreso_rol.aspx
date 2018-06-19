<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ingreso_rol.aspx.cs" Inherits="ingreso_rol" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 34%;
            height: 90px;
        }
    </style>
        <link rel="icon" type="image/png" href="imagenes/caja-invenire-cuero-ico.ico" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Codigo Rol"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Nombre Rol"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Guardar" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="cod_rol" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="cod_rol" HeaderText="Codigo Rol" ReadOnly="True" SortExpression="cod_rol" />
                <asp:BoundField DataField="nom_rol" HeaderText="Nombre de Rol" SortExpression="nom_rol" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" DeleteCommand="DELETE FROM [tbl_rol] WHERE [cod_rol] = @cod_rol" InsertCommand="INSERT INTO [tbl_rol] ([cod_rol], [nom_rol]) VALUES (@cod_rol, @nom_rol)" SelectCommand="SELECT * FROM [tbl_rol]" UpdateCommand="UPDATE [tbl_rol] SET [nom_rol] = @nom_rol WHERE [cod_rol] = @cod_rol">
            <DeleteParameters>
                <asp:Parameter Name="cod_rol" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="cod_rol" Type="Int32" />
                <asp:Parameter Name="nom_rol" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nom_rol" Type="String" />
                <asp:Parameter Name="cod_rol" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
