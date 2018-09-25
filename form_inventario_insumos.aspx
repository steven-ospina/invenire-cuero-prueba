<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_inventario_insumos.aspx.cs" Inherits="form_inventario_insumos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="file_css/style_view_insumos.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  
    <h1>inventario</h1>
    <asp:ListView ID="ListView1" runat="server">
        <ItemTemplate>
            <div class="list">
                <table  border="1" class="a">
                    <tr><td><b>codigo:</b><span><%#Eval("cod_prod") %></td></tr>
                    <tr><td><asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("cod_prod", "manejador_img_insumos.ashx?cod_prod={0}") %>' Width="120px" Height="120px" /></td></tr>
                    <tr><td><b>Nombre del insumo:</b><h2><%#Eval("nom_prod") %></h2></td></tr>
                    <tr><td><b>Cantida-Diponible:</b><span><%#Eval("cant_prod") %></span></td></tr>
                    <tr><td><b>Descripcion:</b><p><%#Eval("desc_prod") %></p></td></tr>
                    <tr><td><b>Facha-de-ingreso:</b><span><%#Eval("fecha_ing") %></span></td></tr>
                    <tr><td><b>Facha-de-caducidad:</b><span><%#Eval("fecha_caducidad") %></span></td></tr>
                    <tr><td><b>Ubicacion:</b><span><%#Eval("ubicacion") %></span></td></tr>
                </table>
            </div>
            <br />  
        </ItemTemplate>
    </asp:ListView>
</asp:Content>

