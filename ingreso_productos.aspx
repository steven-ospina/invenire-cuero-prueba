﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ingreso_productos.aspx.cs" Inherits="ingreso_productos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="css/style_tbl_productos.css" />
    <style type="text/css">
        .auto-style4 {
            margin-left: 0px;
            margin-top: 19px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="titulo">INGRESO DE PRODUCTOS</h1>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="Codigo Del producto"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Nombre Del Producto"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="Cantidad Del Producto"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label4" runat="server" Text="Descripcion Del Producto"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label5" runat="server" Text="Fecha De Ingreso"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="16px" ImageUrl="~/imagenes/calendario.ico" OnClick="ImageButton1_Click" Width="16px" />
                        <asp:Calendar ID="Calendar1" runat="server" Height="138px" OnSelectionChanged="Calendar1_SelectionChanged" Width="184px"></asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label6" runat="server" Text="Fecha De Caducidad"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        <asp:ImageButton ID="ImageButton2" runat="server" Height="16px" ImageUrl="~/imagenes/calendario.ico" OnClick="ImageButton2_Click" Width="16px" />
                        <asp:Calendar ID="Calendar2" runat="server" OnSelectionChanged="Calendar2_SelectionChanged"></asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label7" runat="server" Text="Ubicacion"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
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
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="cod_prod" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" CssClass="auto-style4">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="cod_prod" HeaderText="Codigo Producto" ReadOnly="True" SortExpression="cod_prod" />
                <asp:BoundField DataField="nom_prod" HeaderText="Nombre Producto" SortExpression="nom_prod" />
                <asp:BoundField DataField="cant_prod" HeaderText="Cantidad del Producto" SortExpression="cant_prod" />
                <asp:BoundField DataField="desc_prod" HeaderText="Descripcion del producto" SortExpression="desc_prod" />
                <asp:BoundField DataField="fecha_ing" HeaderText="Fecha de Ingreso" SortExpression="fecha_ing" />
                <asp:BoundField DataField="fecha_caducidad" HeaderText="Fecha de Caducidad" SortExpression="fecha_caducidad" />
                <asp:BoundField DataField="ubicacion" HeaderText="Ubicacion" SortExpression="ubicacion" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_pruebaConnectionString %>" DeleteCommand="DELETE FROM [tbl_productos] WHERE [cod_prod] = @cod_prod" InsertCommand="INSERT INTO [tbl_productos] ([cod_prod], [nom_prod], [cant_prod], [desc_prod], [fecha_ing], [fecha_caducidad], [ubicacion]) VALUES (@cod_prod, @nom_prod, @cant_prod, @desc_prod, @fecha_ing, @fecha_caducidad, @ubicacion)" SelectCommand="SELECT * FROM [tbl_productos]" UpdateCommand="UPDATE [tbl_productos] SET [nom_prod] = @nom_prod, [cant_prod] = @cant_prod, [desc_prod] = @desc_prod, [fecha_ing] = @fecha_ing, [fecha_caducidad] = @fecha_caducidad, [ubicacion] = @ubicacion WHERE [cod_prod] = @cod_prod">
            <DeleteParameters>
                <asp:Parameter Name="cod_prod" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="cod_prod" Type="Int32" />
                <asp:Parameter Name="nom_prod" Type="String" />
                <asp:Parameter Name="cant_prod" Type="Int32" />
                <asp:Parameter Name="desc_prod" Type="String" />
                <asp:Parameter Name="fecha_ing" Type="String" />
                <asp:Parameter Name="fecha_caducidad" Type="String" />
                <asp:Parameter Name="ubicacion" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nom_prod" Type="String" />
                <asp:Parameter Name="cant_prod" Type="Int32" />
                <asp:Parameter Name="desc_prod" Type="String" />
                <asp:Parameter Name="fecha_ing" Type="String" />
                <asp:Parameter Name="fecha_caducidad" Type="String" />
                <asp:Parameter Name="ubicacion" Type="String" />
                <asp:Parameter Name="cod_prod" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
