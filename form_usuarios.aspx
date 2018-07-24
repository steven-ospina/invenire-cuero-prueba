<%@ Page Language="C#" AutoEventWireup="true" CodeFile="form_usuarios.aspx.cs" Inherits="ingreso_usuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

    </style>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/solo_numeros.js"></script>
    <link rel="stylesheet" href="file_css/style_form_usuarios.css"/>
    <link rel="icon" type="image/png" href="file_img/caja-invenire-cuero-ico.ico" />
</head>
<body >

    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <h2> REGISTRO DE USUARIOS</h2>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="Number" onkeypress="return numbersonly(event);" placeholder="Documento Usuario"  ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox2" runat="server" onkeypress="return soloLetras(event);" placeholder="Nombre Usuario"  ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox3" runat="server" onkeypress="return soloLetras(event);" placeholder="Apellidos Usuario"  ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label1" runat="server" Text="Rol del Usuario" ></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" DataTextField="nom_rol" DataValueField="cod_rol">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" SelectCommand="SELECT * FROM [tbl_rol]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" Text="Estado"></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList1" runat="server" >
                            <asp:ListItem>Activo</asp:ListItem>
                            <asp:ListItem>Innativo</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" placeholder="Contraseña"  ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox5" runat="server" TextMode="Password" placeholder="Repetir Contraseña"  ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox6" runat="server" TextMode="Email" placeholder="Email"  ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" Text="Genero"></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList2" runat="server" >
                            <asp:ListItem>Hombre</asp:ListItem>
                            <asp:ListItem>Mujer</asp:ListItem>
                            <asp:ListItem> Prefiero no decirlo</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox7" runat="server" TextMode="Number" placeholder="Telefono"  ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Button ID="Button1" runat="server" Text="Guardar" OnClick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="doc_usu" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="1199px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="doc_usu" HeaderText="Documento Usuario" ReadOnly="True" SortExpression="doc_usu" />
                <asp:BoundField DataField="nom_usu" HeaderText="Nombre" SortExpression="nom_usu" />
                <asp:BoundField DataField="ape_usu" HeaderText="Apellidos" SortExpression="ape_usu" />
                <asp:TemplateField HeaderText="Rol Usuario" SortExpression="cod_rol">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="nom_rol" DataValueField="cod_rol" SelectedValue='<%# Bind("cod_rol") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" SelectCommand="SELECT * FROM [tbl_rol]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="nom_rol" DataValueField="cod_rol" SelectedValue='<%# Bind("cod_rol") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" SelectCommand="SELECT * FROM [tbl_rol]"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="estado" HeaderText="Estado" SortExpression="estado" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:BoundField DataField="genero" HeaderText="Genero" SortExpression="genero" />
                <asp:BoundField DataField="telefono" HeaderText="Telefono" SortExpression="telefono" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" DeleteCommand="DELETE FROM [tbl_usuario] WHERE [doc_usu] = @doc_usu" InsertCommand="INSERT INTO [tbl_usuario] ([doc_usu], [nom_usu], [ape_usu], [cod_rol], [estado], [contrasena], [email], [genero], [telefono]) VALUES (@doc_usu, @nom_usu, @ape_usu, @cod_rol, @estado, @contrasena, @email, @genero, @telefono)" SelectCommand="SELECT * FROM [tbl_usuario] WHERE ([doc_usu] = @doc_usu)" UpdateCommand="UPDATE [tbl_usuario] SET [nom_usu] = @nom_usu, [ape_usu] = @ape_usu, [cod_rol] = @cod_rol, [estado] = @estado, [contrasena] = @contrasena, [email] = @email, [genero] = @genero, [telefono] = @telefono WHERE [doc_usu] = @doc_usu">
            <DeleteParameters>
                <asp:Parameter Name="doc_usu" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="doc_usu" Type="String" />
                <asp:Parameter Name="nom_usu" Type="String" />
                <asp:Parameter Name="ape_usu" Type="String" />
                <asp:Parameter Name="cod_rol" Type="Int32" />
                <asp:Parameter Name="estado" Type="String" />
                <asp:Parameter Name="contrasena" Type="String" />
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
                <asp:Parameter Name="contrasena" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="genero" Type="String" />
                <asp:Parameter Name="telefono" Type="String" />
                <asp:Parameter Name="doc_usu" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
    </form>
</body>
</html>
