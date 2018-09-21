<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_inventario_insumosaspx.aspx.cs" Inherits="form_inventario_insumosaspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  
    <h1>inventario</h1>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">

    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT tbl_img_productos.imagen, tbl_productos.* FROM tbl_img_productos INNER JOIN tbl_productos ON tbl_img_productos.cod_prod = tbl_productos.cod_prod"></asp:SqlDataSource>
</asp:Content>

