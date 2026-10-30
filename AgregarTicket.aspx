<%@ Page Title="" Language="C#" MasterPageFile="~/MPSitio.Master" AutoEventWireup="true" CodeBehind="AgregarTicket.aspx.cs" Inherits="PECEs.AgregarTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Agregar Ticket</h2>

    <asp:ValidationSummary ID="vsCrearTicket" runat="server" ValidationGroup="vgCrearTicket"
        HeaderText="Se encontraron los siguientes errores:" DisplayMode="BulletList" ForeColor="Red"/>

    <table>
        <tr>
            <td>
                <asp:Label ID="lblTipoCliente" runat="server" Text="Tipo de Cliente"></asp:Label> 
            </td>
            <td>
                <asp:DropDownList ID="ddlTipoCliente" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTipoCliente_SelectedIndexChanged">
                    <asp:ListItem Text="Seleccionar" Value="" Enabled="false" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Persona Natural" Value="PersonaNatural"></asp:ListItem>
                    <asp:ListItem Text="Empresa" Value="Empresa"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvTipoCliente" runat="server"
                    ControlToValidate="ddlTipoCliente" InitialValue=""
                    Text="*" ErrorMessage="Debe seleccionar un tipo de clinete"
                    ValidationGroup="vgCrearTicket" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lblNombre" runat="server" Text="Nombre:"></asp:Label></td> <!-- NOMBRE -->
            <td>
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server"
                    ControlToValidate="txtNombre" Text="*" 
                    ErrorMessage="El nombre es obligatorio" ValidationGroup="vgCrearTicket"
                    Display="Dynamic" ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvNombreLargo" runat="server"
                    ControlToValidate="txtNombre" Text="*" 
                    ErrorMessage="El nombre debe tener al menos 5 caracteres"
                    ValidationGroup="vgCrearTicket" Display="Dynamic"
                    ForeColor="Red" OnServerValidate="cvNombreLargo_ServerValidate">
                </asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lblRut" runat="server" Text="RUT:"></asp:Label></td> <!-- RUT -->
            <td>
                <asp:TextBox ID="txtRut" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvRut" runat="server"
                    ControlToValidate="txtRut" Text="*"
                    ErrorMessage="El RUT es obligatorio"
                    ValidationGroup="vgCrearTicket" Display="Dynamic" ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revRut" runat="server" 
                    ControlToValidate="txtRut" Text="*" 
                    ErrorMessage="El formato del RUT debe ser 12345678-9"
                    ValidationGroup="vgCrearTicket" Display="Dynamic" ForeColor="Red"
                    ValidationExpression="^(\d{8,9}-[\dkK])$" >
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lblTelefono" runat="server" Text="Telefono:"></asp:Label></td> <!-- TELEFONO -->
            <td>
                <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTelefono" runat="server"
                    ControlToValidate="txtTelefono" Text="*" 
                    ErrorMessage="El teléfono es obligatorio"
                    ValidationGroup="vgCrearTicket" Display="Dynamic" ForeColor="Red">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label></td> <!-- EMAIL -->
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                    ControlToValidate="txtEmail" Text="*"
                    ErrorMessage="El email es obligatorio"
                    ValidationGroup="vgCrearTicket" Display="Dynamic" ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                    ControlToValidate="txtEmail" Text="*"
                    ErrorMessage="El formato del email no es válido"
                    ValidationGroup="vgCrearTicket" Display="Dynamic" ForeColor="Red"
                    ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lblRazonSocial" runat="server" Text="Razón Social:"></asp:Label></td> <!-- RAZON SOCIAL -->
            <td><asp:TextBox ID="txtRazonSocial" runat="server" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblProducto" runat="server" Text="Producto:"></asp:Label></td> <!-- PRODUCTO -->
            <td>
                <asp:TextBox ID="txtProducto" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvProducto" runat="server"
                    ControlToValidate="txtProducto" Text="*" 
                    ErrorMessage="El nombre del producto es obligatorio"
                    ValidationGroup="vgCrearTicket" Display="Dynamic" ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvProductoLargo" runat="server"
                    ControlToValidate="txtProducto" Text="*"
                    ErrorMessage="El nombre del producto debe tener al menos 10 caracteres"
                    ValidationGroup="vgCrearTicket" Display="Dynamic" ForeColor="Red"
                    OnServerValidate="cvProductoLargo_ServerValidate">
                </asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lblDescripcion" runat="server" Text="Descripción:"></asp:Label></td> <!-- DESCRIPCION -->
            <td>
                <asp:TextBox ID="txtDescripcion" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server"
                    ControlToValidate="txtDescripcion" Text="*"
                    ErrorMessage="La descripción es obligatoria"
                    ValidationGroup="vgCrearTicket" Display="Dynamic" ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvDescripcionLarga" runat="server" 
                    ControlToValidate="txtDescripcion" Text="*"
                    ErrorMessage="La descripción debe tener al menos 10 caracteres"
                    ValidationGroup="vgCrearTicket" Display="Dynamic" ForeColor="Red"
                    OnServerValidate="cvDescripcionLarga_ServerValidate">
                </asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lblEstado" runat="server" Text="Estado:"></asp:Label></td> <!-- ESTADO -->
            <td><asp:TextBox ID="txtEstado" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan ="2">
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar Ticket" OnClick="btnAgregar_Click" 
                    ValidationGroup="vgCrearTicket" CausesValidation="true" />
            </td>
        </tr>
        </table>
</asp:Content>
