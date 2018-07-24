<%@ Page Language="C#" AutoEventWireup="true" CodeFile="validar_login.aspx.cs" Inherits="validar_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        /*.auto-style1 {
            width: 28%;
            height: 155px;
        }
        .auto-style2 {
            width: 114px;
        }*/
    </style>
    <link rel="stylesheet" href="file_css/style_validar_login.css"/>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/validaciones.js"></script>
    <script src="js/"></script>
    <link rel="icon" type="image/png" href="file_img/caja-invenire-cuero-ico.ico" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>
                        <img src="file_img/caja-invenire-cuero.png" alt="" width="10" class="imagen_login"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" onkeypress="return blocklet(event);" placeholder="Documento" onpaste="return false" oncut="return false" oncopy="return false" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" placeholder="Contraseña" onpaste="return false" oncut="return false" oncopy="return false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ingresar" Width="276px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Olvide Mi Contraseña</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
