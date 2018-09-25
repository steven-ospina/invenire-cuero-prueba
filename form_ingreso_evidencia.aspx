<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_ingreso_evidencia.aspx.cs" Inherits="form_ingreso_evidencia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 59%;
            height: 133px;
        }
        .auto-style2 {
            width: 250px;
        }
        .auto-style3 {
            width: 250px;
            height: 21px;
        }
        .auto-style4 {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="auto-style1">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label1" runat="server" Text="Usuario"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Expr1" DataValueField="doc_usu">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT tbl_usuario.nom_usu + ' ' + tbl_usuario.ape_usu AS Expr1, tbl_productos_terminados.doc_usu FROM tbl_usuario INNER JOIN tbl_productos_terminados ON tbl_usuario.doc_usu = tbl_productos_terminados.doc_usu"></asp:SqlDataSource>
                <asp:Label ID="Label5" runat="server" ForeColor="#CC0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label2" runat="server" Text="Fecha"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBox1" runat="server" Enabled="False"></asp:TextBox>
                <br />
                <asp:Label ID="Label6" runat="server" ForeColor="#CC0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label3" runat="server" Text="Productos Terminados"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="nom_producto" DataValueField="id_det_pro">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT tbl_detalle_productos.id_det_pro, tbl_productos_terminados.nom_producto FROM tbl_productos_terminados INNER JOIN tbl_detalle_productos ON tbl_productos_terminados.id_prod = tbl_detalle_productos.id_prod"></asp:SqlDataSource>
                <asp:Label ID="Label7" runat="server" ForeColor="#CC0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label4" runat="server" Text="Imagen Pasisalvo"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <br />
                <asp:Label ID="Label8" runat="server" ForeColor="#CC0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Guardar Evidencia" />
            </td>
            <td>
                <asp:Label ID="Label9" runat="server" ForeColor="#006600"></asp:Label>
            </td>
        </tr>
    </table>
    <br />  
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="cod_evidencia" HeaderText="Codigo Evidencias" />
            <asp:BoundField DataField="doc_usu" HeaderText="Documento" />
            <asp:BoundField DataField="fecha_sistema" HeaderText="Fecha" />
            <asp:BoundField DataField="id_det_pro" HeaderText=" ID Detalle Prodcutos Terminados" />
            <asp:TemplateField HeaderText="Imagen">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("cod_evidencia", "manejador_tbl_evidencia.ashx?cod_evidencia={0}") %>' Width="120px" Height="120px"  />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="hora" HeaderText="Hora" />
        </Columns>
    </asp:GridView>
</asp:Content>

