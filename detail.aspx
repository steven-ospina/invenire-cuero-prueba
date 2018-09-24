<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Volver" Width="40%" />
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="100%" AutoGenerateRows="False" DataKeyNames="cod_prod" DataSourceID="SqlDataSource1">
        <Fields>
            <asp:BoundField DataField="cod_prod" InsertVisible="False" ReadOnly="True" SortExpression="cod_prod" HeaderText="cod_prod" />
            <asp:BoundField DataField="nom_prod" HeaderText="nom_prod" SortExpression="nom_prod" />
            <asp:BoundField DataField="cant_prod" HeaderText="cant_prod" SortExpression="cant_prod" />
            <asp:BoundField DataField="desc_prod" HeaderText="desc_prod" SortExpression="desc_prod" />
            <asp:BoundField DataField="fecha_ing" HeaderText="fecha_ing" SortExpression="fecha_ing" />
            <asp:BoundField DataField="fecha_caducidad" HeaderText="fecha_caducidad" SortExpression="fecha_caducidad" />
            <asp:BoundField DataField="ubicacion" HeaderText="ubicacion" SortExpression="ubicacion" />
            <asp:TemplateField HeaderText="Imagen">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("cod_prod", "manejador_img_insumos.ashx?cod_prod={0}") %>' Width="120px" Height="120px"  />
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT * FROM [tbl_productos] WHERE ([cod_prod] = @cod_prod)">
        <SelectParameters>
            <asp:QueryStringParameter Name="cod_prod" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

