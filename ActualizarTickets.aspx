<%@ Page Title="" Language="C#" MasterPageFile="~/MPSitio.Master" AutoEventWireup="true" CodeBehind="ActualizarTickets.aspx.cs" Inherits="PECEs.ActualizarTickets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Actualizar Ticket</h2>

    <!-- Mensaje de error si no existe el ticket -->
    <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false"></asp:Label>

    <!-- Mensaje de éxito o error al actualizar -->
    <asp:Label ID="lblMensaje" runat="server" Forecolor="Red" Visible="false" ></asp:Label>

    <asp:Panel ID="pnlActualizar" runat="server" Visible="false">

        <asp:ValidationSummary ID="vsActualizarTicket" runat="server" ValidationGroup="vgActualizarTicket" 
            HeaderText="Se encontraron los siguientes errores:" DisplayMode="BulletList" ForeColor="Red" />

        <table>

            <!-- Datos no editables del cliente -->
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
                <td><asp:Label ID="lblRazonSocialTitulo" runat="server" Text="Razón Social:"></asp:Label></td>
                <td><asp:Label ID="lblRazonSocial" runat="server"></asp:Label></td>
            </tr>

            <!-- Datos no editables del ticket -->
            <tr>
                <td><asp:Label ID="lblIdTitulo" runat="server" Text="ID Ticket:"></asp:Label></td>
                <td><asp:Label ID="lblId" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblEstadoTitulo" runat="server" Text="Estado:"></asp:Label></td>
                <td><asp:Label ID="lblEstado" runat="server"></asp:Label></td>
            </tr>
            <!--Datos editables del cliente-->
            <tr>
                <td><asp:Label ID="lblTelefonoTitulo" runat="server" Text="Teléfono:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTelefono" runat="server"
                        ControlToValidate="txtTelefono" Text="*"
                        ErrorMessage="El teléfono es obligatorio"
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="vgActualizarTicket">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lblEmailTitulo" runat="server" Text="Email:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ControlToValidate="txtEmail" Text="*"
                        ErrorMessage="El email es obligatorio"
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="vgActualizarTicket">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        ControlToValidate="txtEmail" Text="*"
                        ErrorMessage="El formato del email no es válido" 
                        ForeColor="Red" 
                        Display="Dynamic"
                        ValidationGroup="vgActualizarTicket"
                        ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>

            <!-- Datos editables del ticket -->
            <tr>
                <td><asp:Label ID="lblProductoTitulo" runat="server" Text="Producto:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtProducto" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvProducto" runat="server"
                        ControlToValidate="txtProducto" Text="*"
                        ErrorMessage="El producto es obligatorio"
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="vgActualizarTicket">
                    </asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="cvProductoLargo" runat="server" 
                        ControlToValidate="txtProducto" Text="*"
                        ErrorMessage="El nombre del producto debe tener al menos 10 caracteres"
                        ForeColor="Red" 
                        Display="Dynamic"
                        ValidationGroup="vgActualizarTicket"
                        OnServerValidar="cvProductoLargo_ServerValidate">
                    </asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lblDescripcionTitulo" runat="server" Text="Descripción:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server"
                        ControlToValidate="txtDescripcion" Text="*"
                        ErrorMessage="La descripción es obligatoria"
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="vgActualizarTicket">
                    </asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="cvDescripcionLarga" runat="server" 
                        ControlToValidate="txtDescripcion" Text="*"
                        ErrorMessage="La descripción debe tener al menos 10 caracteres" 
                        ForeColor="Red" 
                        Display="Dynamic"
                        ValidationGroup="vgActualizarTicket" 
                        OnServerValidate="cvDescripcionLarga_ServerValidate">
                    </asp:CustomValidator>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" OnClick="btnActualizar_Click"
                        ValidationGroup="vgActualizarTicket" CausesValidation="true"/>
                    <asp:Button ID="btnVolver" runat="server" Text="Volver" OnClick="btnVolver_Click" CausesValidation="false" /> 
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
