<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_permisos.aspx.cs" Inherits="form_permisos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Permisos</title>
    <style type="text/css">
        .auto-style1 {
            width: 43%;
            height: 103px;
        }
        .auto-style2 {
            width: 218px;
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
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Nombre del Permiso"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label3" runat="server" ForeColor="Red" Visible="False"></asp:Label>
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="cod_per" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="401px" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="cod_per" HeaderText="Codigo del Permiso" ReadOnly="True" SortExpression="cod_per" />
                <asp:BoundField DataField="nom_per" HeaderText="Nombre del Permiso" SortExpression="nom_per" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" DeleteCommand="DELETE FROM [tbl_permisos] WHERE [cod_per] = @cod_per" InsertCommand="INSERT INTO [tbl_permisos] ([cod_per], [nom_per]) VALUES (@cod_per, @nom_per)" SelectCommand="SELECT * FROM [tbl_permisos]" UpdateCommand="UPDATE [tbl_permisos] SET [nom_per] = @nom_per WHERE [cod_per] = @cod_per">
            <DeleteParameters>
                <asp:Parameter Name="cod_per" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="cod_per" Type="Int32" />
                <asp:Parameter Name="nom_per" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nom_per" Type="String" />
                <asp:Parameter Name="cod_per" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>

