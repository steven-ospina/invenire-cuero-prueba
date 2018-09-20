<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_devolucion.aspx.cs" Inherits="form_devolucion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Ingreso Devolucion Insumos</title>
    <link rel="icon" type="image/png" href="file_img/caja-invenire-cuero-ico.ico" />
    <script src="file_js/validaciones.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div>
                        <asp:Button ID="Button1" runat="server" Text="Agregar Devolucion" OnClick="Button1_Click" />
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="id_devol" HeaderText="Nro." />
                    <asp:TemplateField HeaderText="Fecha Devolucion">
                        <ItemTemplate>
                            <asp:TextBox ID="tbFechaDevolucion" runat="server" Enabled="False" Text='<%# DataBinder.Eval(Container, "DataItem.fec_devol") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Usuario">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlUsuario" runat="server" DataSourceID="SqlDataSource1" DataTextField="ape_usu" DataValueField="doc_usu" SelectedValue='<%# DataBinder.Eval(Container, "DataItem.doc_usu") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT [doc_usu], [ape_usu], [cod_rol] FROM [tbl_usuario] WHERE ([cod_rol] = @cod_rol)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label1" DefaultValue="4" Name="cod_rol" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Codgio Pedido">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlCodigoPedido" runat="server" DataSourceID="SqlDataSource2" DataTextField="cod_ped" DataValueField="cod_ped" SelectedValue='<%# DataBinder.Eval(Container, "DataItem.cod_ped") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT [cod_ped] FROM [tbl_pedidos]"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Insumo">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlInsumo" runat="server" DataSourceID="SqlDataSource3" DataTextField="nom_prod" DataValueField="cod_prod" SelectedValue='<%# DataBinder.Eval(Container, "DataItem.cod_prod") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT tbl_pedidos.cod_prod, tbl_productos.nom_prod FROM tbl_pedidos INNER JOIN tbl_productos ON tbl_pedidos.cod_prod = tbl_productos.cod_prod"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cantida a Devolver">
                        <ItemTemplate>
                            <asp:TextBox ID="tbCantidaDevolver" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.cant_prod") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                        <br />
                        <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Confirmar Devolucion" />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Guardar todas las Devoluciones" Visible="False" />
            <br />
            <asp:Label ID="Label2" runat="server" ForeColor="#00CC00"></asp:Label>
                        <br />
                        <br />
            <h2>Guia Tabla Pedidos</h2>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="cod_ped" HeaderText="Codigo Pedido" InsertVisible="False" ReadOnly="True" SortExpression="cod_ped" />
            <asp:BoundField DataField="nom_prod" HeaderText="Insumo" SortExpression="nom_prod" />
            <asp:BoundField DataField="desc_prod" HeaderText="Descripcion" SortExpression="desc_prod" />
            <asp:BoundField DataField="nom_rol" HeaderText="cargo" SortExpression="nom_rol" />
            <asp:BoundField DataField="Expr1" HeaderText="Usuario" ReadOnly="True" SortExpression="Expr1" />
            <asp:BoundField DataField="doc_usu" HeaderText="Documento" SortExpression="doc_usu" />
            <asp:BoundField DataField="cant_prod" HeaderText="Cantidad del Insumo" SortExpression="cant_prod" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT tbl_pedidos.cod_ped, tbl_productos.nom_prod, tbl_productos.desc_prod, tbl_rol.nom_rol, tbl_usuario.nom_usu + ' ' + tbl_usuario.ape_usu AS Expr1, tbl_usuario.doc_usu, tbl_productos.cant_prod FROM tbl_productos INNER JOIN tbl_pedidos ON tbl_productos.cod_prod = tbl_pedidos.cod_prod INNER JOIN tbl_usuario ON tbl_pedidos.doc_usu = tbl_usuario.doc_usu INNER JOIN tbl_rol ON tbl_usuario.cod_rol = tbl_rol.cod_rol"></asp:SqlDataSource>
        </div>
        </asp:Content>

