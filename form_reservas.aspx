<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_reservas.aspx.cs" Inherits="form_reservas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Ingreso Reserva</title>
    <link rel="icon" type="image/png" href="file_img/caja-invenire-cuero-ico.ico" />
    <script src="file_js/validaciones.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar Reserva" />
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:TemplateField HeaderText="Fecha de la Reserva">
                <ItemTemplate>
                    <asp:TextBox ID="tbFechaReserva" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.fecha_res") %>' TextMode="Date"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Documento">
                <ItemTemplate>
                    <asp:TextBox ID="tbUsuario" runat="server" Enabled="False" Text='<%# DataBinder.Eval(Container, "DataItem.doc_usu") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Insumo">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlInsumo" runat="server" DataSourceID="SqlDataSource1" DataTextField="nom_prod" DataValueField="cod_prod" SelectedValue='<%# DataBinder.Eval(Container, "DataItem.cod_prod") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT [cod_prod], [nom_prod] FROM [tbl_productos]"></asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cantidad">
                <ItemTemplate>
                    <asp:TextBox ID="tbCantidadReserva" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.cant_prod") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <br />
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Confirmar Reservas" Visible="False" />
    <asp:Button ID="Button3" runat="server" Text="Enviar Reservas" Visible="False" OnClick="Button3_Click" />

    <br />
    <asp:Label ID="Label2" runat="server" ForeColor="#009933"></asp:Label>

</asp:Content>

