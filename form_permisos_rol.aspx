<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_permisos_rol.aspx.cs" Inherits="form_permisos_rol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <title>Permiso Rol</title>
    <style type="text/css">
        .auto-style1 {
            width: 39%;
            height: 106px;
        }
        .auto-style2 {
            width: 455px;
        }
        .auto-style3 {
            width: 397px;
        }
        .auto-style4 {
            width: 397px;
            height: 24px;
        }
        .auto-style5 {
            width: 455px;
            height: 24px;
        }
    </style>
    <link rel="icon" type="image/png" href="file_img/caja-invenire-cuero-ico.ico" />
    <script src="file_js/validaciones.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label1" runat="server" Text="Nombre del Permiso"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="nom_per" DataValueField="cod_per">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT * FROM [tbl_permisos]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label2" runat="server" Text="Rol del Usuario"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="nom_rol" DataValueField="cod_rol" Width="86px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT * FROM [tbl_rol]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" Text="Estado"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="DropDownList3" runat="server">
                            <asp:ListItem>Activo</asp:ListItem>
                            <asp:ListItem Value="Inactivo">Inactivo</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Guardar" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="cod_per,cod_rol" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="467px" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="cod_per" HeaderText="Codigo del Permiso" ReadOnly="True" SortExpression="cod_per" />
                <asp:TemplateField HeaderText="Rol del Usuario" SortExpression="cod_rol">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="nom_rol" DataValueField="cod_rol" SelectedValue='<%# Bind("cod_rol") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" DeleteCommand="DELETE FROM [tbl_per_rol] WHERE [cod_per] = @cod_per AND [cod_rol] = @cod_rol" InsertCommand="INSERT INTO [tbl_per_rol] ([cod_per], [cod_rol], [estado]) VALUES (@cod_per, @cod_rol, @estado)" SelectCommand="SELECT * FROM [tbl_per_rol]" UpdateCommand="UPDATE [tbl_per_rol] SET [estado] = @estado WHERE [cod_per] = @cod_per AND [cod_rol] = @cod_rol">
                            <DeleteParameters>
                                <asp:Parameter Name="cod_per" Type="Int32" />
                                <asp:Parameter Name="cod_rol" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="cod_per" Type="Int32" />
                                <asp:Parameter Name="cod_rol" Type="Int32" />
                                <asp:Parameter Name="estado" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="estado" Type="String" />
                                <asp:Parameter Name="cod_per" Type="Int32" />
                                <asp:Parameter Name="cod_rol" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="nom_rol" DataValueField="cod_rol" SelectedValue='<%# Bind("cod_rol") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" DeleteCommand="DELETE FROM [tbl_per_rol] WHERE [cod_per] = @cod_per AND [cod_rol] = @cod_rol" InsertCommand="INSERT INTO [tbl_per_rol] ([cod_per], [cod_rol], [estado]) VALUES (@cod_per, @cod_rol, @estado)" SelectCommand="SELECT * FROM [tbl_per_rol]" UpdateCommand="UPDATE [tbl_per_rol] SET [estado] = @estado WHERE [cod_per] = @cod_per AND [cod_rol] = @cod_rol">
                            <DeleteParameters>
                                <asp:Parameter Name="cod_per" Type="Int32" />
                                <asp:Parameter Name="cod_rol" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="cod_per" Type="Int32" />
                                <asp:Parameter Name="cod_rol" Type="Int32" />
                                <asp:Parameter Name="estado" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="estado" Type="String" />
                                <asp:Parameter Name="cod_per" Type="Int32" />
                                <asp:Parameter Name="cod_rol" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Estado" SortExpression="estado">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList5" runat="server" SelectedValue='<%# Bind("estado") %>'>
                            <asp:ListItem>Activo</asp:ListItem>
                            <asp:ListItem>Inactivo</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" SelectedValue='<%# Bind("estado") %>'>
                            <asp:ListItem>Activo</asp:ListItem>
                            <asp:ListItem>Inactivo</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" DeleteCommand="DELETE FROM [tbl_per_rol] WHERE [cod_per] = @cod_per AND [cod_rol] = @cod_rol" InsertCommand="INSERT INTO [tbl_per_rol] ([cod_per], [cod_rol], [estado]) VALUES (@cod_per, @cod_rol, @estado)" SelectCommand="SELECT * FROM [tbl_per_rol]" UpdateCommand="UPDATE [tbl_per_rol] SET [estado] = @estado WHERE [cod_per] = @cod_per AND [cod_rol] = @cod_rol">
            <DeleteParameters>
                <asp:Parameter Name="cod_per" Type="Int32" />
                <asp:Parameter Name="cod_rol" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="cod_per" Type="Int32" />
                <asp:Parameter Name="cod_rol" Type="Int32" />
                <asp:Parameter Name="estado" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="estado" Type="String" />
                <asp:Parameter Name="cod_per" Type="Int32" />
                <asp:Parameter Name="cod_rol" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>

