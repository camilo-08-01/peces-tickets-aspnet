<%@ Page Title="" Language="C#" MasterPageFile="~/MPSitio.Master" AutoEventWireup="true" CodeBehind="ListadoTickets.aspx.cs" Inherits="PECEs.ListadoTickets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Listado de Tickets</h2>
    <!-- mensaje que llega por URL desde AgregarTicket o Delete -->
    <asp:Label ID="lblMensaje" runat="server" ForeColor="Green" Visible="false"></asp:Label>

    <!-- mensaje cuando no hay registros -->
    <asp:Label ID="lblSinRegistros" runat="server" Text="No existen registros disponibles para mostrar" ForeColor="Red" Visible="false"></asp:Label>

    <!-- Grilla de datos -->
     <!-- AutoGenerateColumns se deja false para tener control total sobre que columnas se muestran (Id, nombre, producto y estado) -->
    <asp:GridView ID="gvTickets" runat="server" AutoGenerateColumns="false" 
        OnRowCommand="gvTickets_RowCommand">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" />
            <asp:TemplateField HeaderText ="Cliente">
                <ItemTemplate>
                    <%# Eval("Cliente.Nombre") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Producto" HeaderText="Producto" />
            <asp:BoundField DataField="Estado" HeaderText="Estado" />
            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <asp:Button ID="btnVerDetalle" runat="server" Text="Ver Detalle" CommandName="VerDetalle" CommandArgument='<%# Eval("Id") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
