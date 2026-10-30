<%@ Page Title="" Language="C#" MasterPageFile="~/MPSitio.Master" AutoEventWireup="true" CodeBehind="DetalleTicket.aspx.cs" Inherits="PECEs.DetalleTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Detalle del Ticket</h2>

    <!-- mensaje de error si no existe el ticket -->
    <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false"></asp:Label>

    <!-- Panel con los datos del ticket -->
    <asp:Panel ID="pnlDetalle" runat="server" Visible="false">
        <table>
            <tr>
                <td><asp:Label ID="lblIdTitulo" runat="server" Text="ID:"></asp:Label></td>
                <td><asp:Label ID="lblId" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblTipoClienteTitulo" runat="server" Text="Tipo de Cliente:"></asp:Label></td>
                <td><asp:Label ID="lblTipoCliente" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblNombreTitulo" runat="server" Text="Nombre:"></asp:Label></td>
                <td><asp:Label ID="lblNombre" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblRutTitulo" runat="server" Text="RUT:"></asp:Label></td>
                <td><asp:Label ID="lblRut" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblTelefonoTitulo" runat="server" Text="Teléfono:"></asp:Label></td>
                <td><asp:Label ID="lblTelefono" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblEmailTitulo" runat="server" Text="Email:"></asp:Label></td>
                <td><asp:Label ID="lblEmail" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblRazonSocialTitulo" runat="server" Text="Razón Social:"></asp:Label></td>
                <td><asp:Label ID="lblRazonSocial" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblProductoTitulo" runat="server" Text="Producto:"></asp:Label></td>
                <td><asp:Label ID="lblProducto" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblDescripcionTitulo" runat="server" Text="Descripción:"></asp:Label></td>
                <td><asp:Label ID="lblDescripcion" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblEstadoTitulo" runat="server" Text="Estado:"></asp:Label></td>
                <td><asp:Label ID="lblEstado" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblFechaCreacionTitulo" runat="server" Text="Fecha de Creación:"></asp:Label></td>
                <td><asp:Label ID="lblFechaCreacion" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnVolver" runat="server" Text="Volver" OnClick="btnVolver_Click" />
                    <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" OnClick="btnActualizar_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
