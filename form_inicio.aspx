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
</asp:Content>

