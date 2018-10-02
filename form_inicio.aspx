<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_inicio.aspx.cs" Inherits="form_inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Inicio</title>

    <script>
        function nobackbutton() {
            window.location.hash = "no-back-button";
            window.location.hash = "Again-no-Back-Button";//google chorme
            window.onhashchange = function () { window.location.has = "no-back-button"; }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <h1>HOLA USUARIO BIENVENIDO AL SISTEMA DE INVENTARIO INVENIRE CUERO</h1>
    <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="cod_res" DataSourceID="SqlDataSource2" Caption='<table border="1" width="100%" cellspacing="0" bgcolor="yellow"><tr><td><h2>Reservas Pendientes</h2></td></tr></table>' CaptionAlign="Top">
        <Columns>
            <asp:BoundField DataField="cod_res" HeaderText="cod_res" InsertVisible="False" ReadOnly="True" SortExpression="cod_res" />
            <asp:BoundField DataField="fecha_res" HeaderText="fecha_res" SortExpression="fecha_res" />
            <asp:BoundField DataField="doc_usu" HeaderText="doc_usu" SortExpression="doc_usu" />
            <asp:BoundField DataField="cod_prod" HeaderText="cod_prod" SortExpression="cod_prod" />
            <asp:BoundField DataField="cant_prod" HeaderText="cant_prod" SortExpression="cant_prod" />
            <asp:BoundField DataField="hora" HeaderText="hora" SortExpression="hora" />
            <asp:BoundField DataField="estado" HeaderText="estado" SortExpression="estado" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT * FROM [tbl_reserva] WHERE ([estado] = @estado)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label2" Name="estado" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

