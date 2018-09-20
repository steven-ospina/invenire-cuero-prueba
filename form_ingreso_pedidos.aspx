<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_ingreso_pedidos.aspx.cs" Inherits="form_ingreso_pedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <title>Ingreso Pedidos</title>
        <link rel="icon" type="image/png" href="file_img/caja-invenire-cuero-ico.ico" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar Pedido" Width="114px" style="height: 26px" />
    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="cod_ped" HeaderText="Nro." />
            <asp:TemplateField HeaderText="Fecha ">
                <ItemTemplate>
                    <asp:TextBox ID="tbFecha" runat="server" Enabled="False" Text='<%# DataBinder.Eval(Container, "DataItem.fecha") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Usuario">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlUsuario" runat="server" DataSourceID="SqlDataSource1" DataTextField="ape_usu" DataValueField="doc_usu" SelectedValue='<%# DataBinder.Eval(Container, "DataItem.doc_usu") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT [doc_usu], [ape_usu] FROM [tbl_usuario] WHERE ([cod_rol] = @cod_rol)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label2" DefaultValue="" Name="cod_rol" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Estado">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlEstado" runat="server" SelectedValue='<%# DataBinder.Eval(Container, "DataItem.estado") %>'>
                            <asp:ListItem>Cancelado</asp:ListItem>
                            <asp:ListItem>Pendiente</asp:ListItem>
                            <asp:ListItem>Entregado</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Insumo">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlIsumos" runat="server" DataSourceID="SqlDataSource2" DataTextField="nom_prod" DataValueField="cod_prod" SelectedValue='<%# DataBinder.Eval(Container, "DataItem.cod_prod") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT [cod_prod], [nom_prod] FROM [tbl_productos]"></asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cantidad ">
                <ItemTemplate>
                    <asp:TextBox ID="tbCantidad" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.cant_prod") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
                        <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Confirmar" />
    <asp:Button ID="Button2" runat="server" Text="Guardar Pedidos" OnClick="Button2_Click" Visible="False" />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" ForeColor="#006600"></asp:Label>
</asp:Content>

