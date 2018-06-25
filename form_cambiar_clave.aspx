<%@ Page Language="C#" AutoEventWireup="true" CodeFile="form_cambiar_clave.aspx.cs" Inherits="form_cambiar_clave" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 34%;
            height: 69px;
        }
        .auto-style2 {
            width: 336px;
        }
        .auto-style3 {
            width: 575px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label1" runat="server" Text="Ingrese el Correo Electronico"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Enviar" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
