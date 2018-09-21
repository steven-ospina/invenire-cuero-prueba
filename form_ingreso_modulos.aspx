<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_ingreso_modulos.aspx.cs" Inherits="form_ingreso_modulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 48%;
            height: 51px;
        }
        .auto-style2 {
            height: 21px;
        }
        .auto-style3 {
            height: 21px;
            width: 151px;
        }
        .auto-style4 {
            width: 151px;
        }
    </style>
        <script src="file_js/validaciones.js"></script>
    <link rel="icon" type="image/png" href="file_img/caja-invenire-cuero-ico.ico" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="auto-style1">
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label1" runat="server" Text="Modulo"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td>
                <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Guardar Modulo" />
                <br />
                <asp:Label ID="Label3" runat="server" ForeColor="#006600"></asp:Label>
            </td>
        </tr>
    </table>

    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="modulo_id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="modulo_id" HeaderText="modulo_id" InsertVisible="False" ReadOnly="True" SortExpression="modulo_id" />
            <asp:BoundField DataField="modulo_nom" HeaderText="modulo_nom" SortExpression="modulo_nom" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" DeleteCommand="DELETE FROM [tbl_modulo] WHERE [modulo_id] = @modulo_id" InsertCommand="INSERT INTO [tbl_modulo] ([modulo_nom]) VALUES (@modulo_nom)" SelectCommand="SELECT * FROM [tbl_modulo]" UpdateCommand="UPDATE [tbl_modulo] SET [modulo_nom] = @modulo_nom WHERE [modulo_id] = @modulo_id">
        <DeleteParameters>
            <asp:Parameter Name="modulo_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="modulo_nom" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="modulo_nom" Type="String" />
            <asp:Parameter Name="modulo_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

