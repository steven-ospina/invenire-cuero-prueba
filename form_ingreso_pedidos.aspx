<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_ingreso_pedidos.aspx.cs" Inherits="form_ingreso_pedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <title>Ingreso Pedidos</title>
    <style type="text/css">
        .auto-style1 {
            width: 53%;
            height: 115px;
            margin-bottom: 0px;
        }
        .auto-style3 {
            width: 185px;
            height: 18px;
        }
        .auto-style4 {
            height: 18px;
        }
        .auto-style5 {
            width: 185px;
            height: 22px;
        }
        .auto-style6 {
            height: 22px;
        }
        .auto-style7 {
            width: 185px;
            height: 21px;
        }
        .auto-style8 {
            height: 21px;
        }
        .auto-style9 {
            width: 185px;
            height: 27px;
        }
        .auto-style10 {
            height: 27px;
        }
        .auto-style11 {
            width: 185px;
            height: 12px;
        }
        .auto-style12 {
            height: 12px;
        }
        .auto-style13 {
            margin-right: 2px;
        }
    </style>
        <link rel="icon" type="image/png" href="file_img/caja-invenire-cuero-ico.ico" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="Label1" runat="server" Text="Codigo Del Producto"></asp:Label>
                    </td>
                    <td class="auto-style6">
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="nom_prod" DataValueField="cod_prod">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT [nom_prod], [cod_prod] FROM [tbl_productos]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" Text="Fecha"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox2" runat="server" Width="128px" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="Label3" runat="server" Text="Documento  Del Usuario"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="nom_usu" DataValueField="doc_usu">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT [doc_usu], [nom_usu] FROM [tbl_usuario]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="Label4" runat="server" Text="Estado"></asp:Label>
                    </td>
                    <td class="auto-style10">
                        <asp:DropDownList ID="DropDownList1" runat="server" Width="136px" Height="16px">
                            <asp:ListItem>Cancelado</asp:ListItem>
                            <asp:ListItem>Pendiente</asp:ListItem>
                            <asp:ListItem>Entregado</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11"></td>
                    <td class="auto-style12">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Guardar" Width="114px" style="height: 26px" />
                    </td>
                </tr>
            </table>
           <br />
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="cod_ped" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" CssClass="auto-style13" Width="498px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="cod_ped" HeaderText="cod_ped" InsertVisible="False" ReadOnly="True" SortExpression="cod_ped" />
                <asp:TemplateField HeaderText="cod_prod" SortExpression="cod_prod">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" DataTextField="nom_prod" DataValueField="cod_prod" SelectedValue='<%# Bind("cod_prod") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("cod_prod") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="fecha" SortExpression="fecha">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("fecha") %>' TextMode="Date"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("fecha") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="doc_usu" SortExpression="doc_usu">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource3" DataTextField="nom_usu" DataValueField="doc_usu" SelectedValue='<%# Bind("doc_usu") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("doc_usu") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="estado" SortExpression="estado">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList6" runat="server" SelectedValue='<%# Bind("estado") %>'>
                            <asp:ListItem>Cancelado</asp:ListItem>
                            <asp:ListItem>Pendiente</asp:ListItem>
                            <asp:ListItem>Entregado</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("estado") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" DeleteCommand="DELETE FROM [tbl_pedidos] WHERE [cod_ped] = @cod_ped" InsertCommand="INSERT INTO [tbl_pedidos] ([cod_prod], [fecha], [doc_usu], [estado]) VALUES (@cod_prod, @fecha, @doc_usu, @estado)" SelectCommand="SELECT * FROM [tbl_pedidos]" UpdateCommand="UPDATE [tbl_pedidos] SET [cod_prod] = @cod_prod, [fecha] = @fecha, [doc_usu] = @doc_usu, [estado] = @estado WHERE [cod_ped] = @cod_ped">
            <DeleteParameters>
                <asp:Parameter Name="cod_ped" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="cod_prod" Type="String" />
                <asp:Parameter Name="fecha" Type="String" />
                <asp:Parameter Name="doc_usu" Type="String" />
                <asp:Parameter Name="estado" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="cod_prod" Type="String" />
                <asp:Parameter Name="fecha" Type="String" />
                <asp:Parameter Name="doc_usu" Type="String" />
                <asp:Parameter Name="estado" Type="String" />
                <asp:Parameter Name="cod_ped" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>

