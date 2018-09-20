<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="true" CodeFile="form_detalle_reserva.aspx.cs" Inherits="form_detalle_reserva" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Detalle Reserva</title>
    <style type="text/css">

        .auto-style1 {
            width: 41%;
            height: 113px;
        }
        .auto-style2 {
            width: 225px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Cantidad Reserva"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="Codigo Producto"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="nom_prod" DataValueField="cod_prod">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT [cod_prod], [nom_prod] FROM [tbl_productos]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label4" runat="server" Text="Codigo Reserva"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="cod_res" DataValueField="cod_res">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT [cod_res] FROM [tbl_reserva]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Guardar" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="cod_det_res" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="453px" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="cod_det_res" HeaderText="cod_det_res" InsertVisible="False" ReadOnly="True" SortExpression="cod_det_res" />
                <asp:BoundField DataField="cant_res" HeaderText="cant_res" SortExpression="cant_res" />
                <asp:TemplateField HeaderText="cod_prod" SortExpression="cod_prod">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" DataTextField="nom_prod" DataValueField="cod_prod" SelectedValue='<%# Bind("cod_prod") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT [cod_prod], [nom_prod] FROM [tbl_productos]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("cod_prod") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="cod_res" SortExpression="cod_res">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="cod_res" DataValueField="cod_res" SelectedValue='<%# Bind("cod_res") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" SelectCommand="SELECT [cod_res] FROM [tbl_reserva]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("cod_res") %>'></asp:Label>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:invenire_cuero_ConnectionString %>" DeleteCommand="DELETE FROM [tbl_detalle_reserva] WHERE [cod_det_res] = @cod_det_res" InsertCommand="INSERT INTO [tbl_detalle_reserva] ([cant_res], [cod_prod], [cod_res]) VALUES (@cant_res, @cod_prod, @cod_res)" SelectCommand="SELECT * FROM [tbl_detalle_reserva]" UpdateCommand="UPDATE [tbl_detalle_reserva] SET [cant_res] = @cant_res, [cod_prod] = @cod_prod, [cod_res] = @cod_res WHERE [cod_det_res] = @cod_det_res">
            <DeleteParameters>
                <asp:Parameter Name="cod_det_res" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="cant_res" Type="Int32" />
                <asp:Parameter Name="cod_prod" Type="String" />
                <asp:Parameter Name="cod_res" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="cant_res" Type="Int32" />
                <asp:Parameter Name="cod_prod" Type="String" />
                <asp:Parameter Name="cod_res" Type="Int32" />
                <asp:Parameter Name="cod_det_res" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>

