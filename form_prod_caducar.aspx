<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_prod_caducar.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Productos a Caducar</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>PRODCUTOS A CADUCAR<asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
        </h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="cod_prod" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="cod_prod" HeaderText="cod_prod" ReadOnly="True" SortExpression="cod_prod" />
                <asp:BoundField DataField="nom_prod" HeaderText="nom_prod" SortExpression="nom_prod" />
                <asp:BoundField DataField="cant_prod" HeaderText="cant_prod" SortExpression="cant_prod" />
                <asp:BoundField DataField="desc_prod" HeaderText="desc_prod" SortExpression="desc_prod" />
                <asp:BoundField DataField="fecha_ing" HeaderText="fecha_ing" SortExpression="fecha_ing" />
                <asp:BoundField DataField="fecha_caducidad" HeaderText="fecha_caducidad" SortExpression="fecha_caducidad" />
                <asp:BoundField DataField="ubicacion" HeaderText="ubicacion" SortExpression="ubicacion" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT * FROM [tbl_productos] WHERE ([fecha_caducidad] = @fecha_caducidad)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" Name="fecha_caducidad" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    <br />
</asp:Content>

