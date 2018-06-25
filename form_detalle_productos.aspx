﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="form_detalle_productos.aspx.cs" Inherits="form_detalle_productos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
  <link rel="icon" type="image/png" href="imagenes/caja-invenire-cuero-ico.ico" />
 <script src="js/solo_numeros.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 51%;
            height: 86px;
        }
        .auto-style2 {
            width: 244px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="id Producto"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Descripcion"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Guardar" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>