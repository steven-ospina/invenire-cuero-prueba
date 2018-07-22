<%@ Page Language="C#" AutoEventWireup="true" CodeFile="form_reserva.aspx.cs" Inherits="form_reserva" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <link rel="icon" type="image/png" href="file_img/caja-invenire-cuero-ico.ico" />
 <script src="js/solo_numeros.js"></script>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 43%;
            height: 101px;
        }
        .auto-style2 {
            width: 188px;
        }
        .auto-style3 {
            width: 288px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Fecha de la Reserva"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="Documento Usuario"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox3" runat="server" onkeypress="return numbersonly(event);"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Guardar" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="cod_res" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="456px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="cod_res" HeaderText="Codigo de Reserva" InsertVisible="False" ReadOnly="True" SortExpression="cod_res" />
                <asp:BoundField DataField="fecha_res" HeaderText="Fecha de la Reserva" SortExpression="fecha_res" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" DeleteCommand="DELETE FROM [tbl_reserva] WHERE [cod_res] = @cod_res" InsertCommand="INSERT INTO [tbl_reserva] ([fecha_res], [doc_usu]) VALUES (@fecha_res, @doc_usu)" SelectCommand="SELECT * FROM [tbl_reserva]" UpdateCommand="UPDATE [tbl_reserva] SET [fecha_res] = @fecha_res, [doc_usu] = @doc_usu WHERE [cod_res] = @cod_res">
            <DeleteParameters>
                <asp:Parameter Name="cod_res" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="fecha_res" Type="String" />
                <asp:Parameter Name="doc_usu" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="fecha_res" Type="String" />
                <asp:Parameter Name="doc_usu" Type="String" />
                <asp:Parameter Name="cod_res" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
