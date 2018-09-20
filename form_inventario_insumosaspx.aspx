<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_inventario_insumosaspx.aspx.cs" Inherits="form_inventario_insumosaspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  
    <h1>inventario</h1>
    <asp:ListView ID="ListView1" runat="server">
        <ItemTemplate>
            <div class="list">   
                <table>
                    <tr>
                        <td>    </td>
                    </tr>
                </table>
            </div>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>

