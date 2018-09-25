<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_ingreso_productos.aspx.cs" Inherits="form_ingreso_productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <title>Ingreso Productos</title>
    <link rel="stylesheet" href="file_css/style_tbl_productos.css" />
    <style type="text/css">
        .auto-style8 {
            width: 51%;
            height: 302px;
            border: 1px solid black;
            background: silver;
            margin: 0 auto;
        }
        .auto-style11 {
            margin-bottom: 8px;
            width: 322px;
        }
        .auto-style12 {
            margin-bottom: 8px;
            width: 116px;
        }
        .auto-style13 {
            width: 304px;
        }
        .auto-style14 {
            margin-bottom: 8px;
            width: 200px;
        }
    </style>
        <script src="file_js/validaciones.js"></script>
        <link rel="icon" type="image/png" href="file_img/caja-invenire-cuero-ico.ico" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div>
            <h1 class="titulo">INGRESO DE INSUMOS</h1>
            <table class="auto-style8">
                <tr>
                    <td class="auto-style13">
                        <asp:TextBox ID="TextBox2" runat="server" placeholder="Nombre Del Insumo"  onpaste="return false" oncut="return false" oncopy="return false"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label7" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                    <td class="auto-style11">
                        &nbsp;</td>
                    <td class="auto-style14">
                        <asp:Label ID="Label5" runat="server" Text="Fecha De Ingreso"></asp:Label>
                    </td>
                    <td class="auto-style12">
                        <asp:TextBox ID="TextBox5" runat="server" TextMode="Date" placeholder="Fecha De Ingreso" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">
                        <asp:TextBox ID="TextBox3" runat="server" onpaste="return false" oncut="return false" oncopy="return false" placeholder="Cantidad Del Insumo"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label8" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                    <td class="auto-style11">
                        <asp:TextBox ID="TextBox7" runat="server" placeholder="Ubicacion"  onpaste="return false" oncut="return false" oncopy="return false"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label9" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                    <td class="auto-style14">
                        <asp:Label ID="Label6" runat="server" Text="Fecha De Caducidad"></asp:Label>
                    </td>
                    <td class="auto-style12">
                        <asp:TextBox ID="TextBox6" runat="server" TextMode="Date" placeholder="Fecha De Caducidad"  onpaste="return false" oncut="return false" oncopy="return false"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label10" runat="server" BorderColor="Black" ForeColor="#CC0000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:TextBox ID="TextBox4" runat="server" Height="39px" TextMode="MultiLine" Width="661px" placeholder="Descripcion Del Insumo"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label11" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">
                        <asp:Label ID="Label12" runat="server" ForeColor="#006600"></asp:Label>
                    </td>
                    <td class="auto-style3" colspan="2">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Guardar" />
                    </td>
                    <td class="auto-style12">
                        <asp:Label ID="Label13" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                </tr>
                </table>
        </div>
        </asp:Content>

