﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="form_usuarios.aspx.cs" Inherits="ingreso_usuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

    </style>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/validaciones.js"></script>
    <link rel="stylesheet" href="file_css/style_form_usuarios.css"/>
    <link rel="icon" type="image/png" href="file_img/caja-invenire-cuero-ico.ico" />
</head>
<body >

    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3" colspan="2">
                        <h2> REGISTRO DE USUARIOS</h2>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="Number" onkeypress="return blocklet(event);" placeholder="Documento Usuario" onpaste="return false" oncut="return false" oncopy="return false" ></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox2" runat="server" onkeypress="return blocknum(event);" placeholder="Nombre Usuario" onpaste="return false" oncut="return false" oncopy="return false"  ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <br />
                        <asp:TextBox ID="TextBox3" runat="server" onkeypress="return blocknum(event);" placeholder="Apellidos Usuario" onpaste="return false" oncut="return false" oncopy="return false"  ></asp:TextBox>
                    </td>
                    <td class="auto-style2 rol">
                        <asp:Label ID="Label1" runat="server" Text="Rol del Usuario" ></asp:Label>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" DataTextField="nom_rol" DataValueField="cod_rol">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" SelectCommand="SELECT * FROM [tbl_rol]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2 Estado">
                        <asp:Label ID="Label2" runat="server" Text="Estado"></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList1" runat="server" >
                            <asp:ListItem>Activo</asp:ListItem>
                            <asp:ListItem>Inactivo</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style2">
                        <br />
                        <asp:TextBox ID="TextBox6" runat="server" TextMode="Email" placeholder="Email" onpaste="return false" oncut="return false" oncopy="return false" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox5" runat="server" TextMode="Password" placeholder="Repetir Contraseña" onpaste="return false" oncut="return false" oncopy="return false" ></asp:TextBox>
                        <br />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" placeholder="Contraseña" onpaste="return false" oncut="return false" oncopy="return false" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2 Genero">
                        <asp:Label ID="Label3" runat="server" Text="Genero"></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList2" runat="server" >
                            <asp:ListItem>Hombre</asp:ListItem>
                            <asp:ListItem>Mujer</asp:ListItem>
                            <asp:ListItem> Prefiero no decirlo</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox7" runat="server" TextMode="Number" placeholder="Telefono" onpaste="return false" oncut="return false" oncopy="return false" onkeypress="return blocklet(event);"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="Guardar" OnClick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="2">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Cerrar Sesion</asp:LinkButton>
                    </td>
                </tr>
                </table>
        </div>
        <br />
        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="Buscar" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="doc_usu" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="1199px" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="doc_usu" HeaderText="doc_usu" ReadOnly="True" SortExpression="doc_usu" />
                <asp:BoundField DataField="nom_usu" HeaderText="nom_usu" SortExpression="nom_usu" />
                <asp:BoundField DataField="ape_usu" HeaderText="ape_usu" SortExpression="ape_usu" />
                <asp:TemplateField HeaderText="cod_rol" SortExpression="cod_rol">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource2" DataTextField="nom_rol" DataValueField="cod_rol" SelectedValue='<%# Bind("cod_rol") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource2" DataTextField="nom_rol" DataValueField="cod_rol" SelectedValue='<%# Bind("cod_rol") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="estado" SortExpression="estado">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("estado") %>'>
                            <asp:ListItem>Activo</asp:ListItem>
                            <asp:ListItem>Inactivo</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("estado") %>'>
                            <asp:ListItem>Activo</asp:ListItem>
                            <asp:ListItem>Inactivo</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="genero" HeaderText="genero" SortExpression="genero" />
                <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" DeleteCommand="DELETE FROM [tbl_usuario] WHERE [doc_usu] = @doc_usu" InsertCommand="INSERT INTO [tbl_usuario] ([doc_usu], [nom_usu], [ape_usu], [cod_rol], [estado], [email], [genero], [telefono]) VALUES (@doc_usu, @nom_usu, @ape_usu, @cod_rol, @estado, @email, @genero, @telefono)" SelectCommand="SELECT [doc_usu], [nom_usu], [ape_usu], [cod_rol], [estado], [email], [genero], [telefono] FROM [tbl_usuario] WHERE ([doc_usu] = @doc_usu)" UpdateCommand="UPDATE [tbl_usuario] SET [nom_usu] = @nom_usu, [ape_usu] = @ape_usu, [cod_rol] = @cod_rol, [estado] = @estado, [email] = @email, [genero] = @genero, [telefono] = @telefono WHERE [doc_usu] = @doc_usu">
            <DeleteParameters>
                <asp:Parameter Name="doc_usu" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="doc_usu" Type="String" />
                <asp:Parameter Name="nom_usu" Type="String" />
                <asp:Parameter Name="ape_usu" Type="String" />
                <asp:Parameter Name="cod_rol" Type="Int32" />
                <asp:Parameter Name="estado" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="genero" Type="String" />
                <asp:Parameter Name="telefono" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox8" Name="doc_usu" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="nom_usu" Type="String" />
                <asp:Parameter Name="ape_usu" Type="String" />
                <asp:Parameter Name="cod_rol" Type="Int32" />
                <asp:Parameter Name="estado" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="genero" Type="String" />
                <asp:Parameter Name="telefono" Type="String" />
                <asp:Parameter Name="doc_usu" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
    </form>
</body>
</html>
