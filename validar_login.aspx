<%@ Page Language="C#" AutoEventWireup="true" CodeFile="validar_login.aspx.cs" Inherits="validar_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 28%;
            height: 155px;
        }
        .auto-style2 {
            width: 114px;
        }
    </style>
     <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/solo_numeros.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="Documento"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" onkeypress="return numbersonly(event);" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Contraseña"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ingresar" Width="116px" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
