using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PECEs
{
    public partial class AgregarTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ddlTipoCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtRazonSocial.Enabled = (ddlTipoCliente.SelectedValue == "Empresa"); // Se habilita razón social solo si el tipo elegido es Empresa

            if (!txtRazonSocial.Enabled)
            {
                txtRazonSocial.Text = "";
            }
        }

        protected void cvNombreLargo_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = args.Value.Trim().Length >= 5; //Validación nombre cliente al menos 5 caracteres
        }

        protected void cvProductoLargo_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = args.Value.Trim().Length >= 10; //Validación nombre producto al menos 10 caracteres
        }

        protected void cvDescripcionLarga_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = args.Value.Trim().Length >= 10; //Validación descripción producto al menos 10 caracteres
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) //No se crea el ticket si el formulario no es válido
            {
                return;
            }

            Cliente cliente; // cliente según lo seleccionado

            if (ddlTipoCliente.SelectedValue == "Empresa")
            {
                cliente = new Empresa()
                {
                    Nombre = txtNombre.Text,
                    Rut = txtRut.Text,
                    Telefono = txtTelefono.Text,
                    Email = txtEmail.Text,
                    RazonSocial = txtRazonSocial.Text
                };
            }
            else
            {
                cliente = new PersonaNatural()
                {
                    Nombre = txtNombre.Text,
                    Rut = txtRut.Text,
                    Telefono = txtTelefono.Text,
                    Email = txtEmail.Text
                };
            }

            // Se crea el Ticket (negocio)
            Ticket ticket = new Ticket
            {
                Cliente = cliente,
                Producto = txtProducto.Text,
                Descripcion = txtDescripcion.Text,
                Estado = txtEstado.Text,
            };

            string mensaje = TicketController.Create(ticket); // Se llama al controlador

            Response.Redirect("~/ListadoTickets.aspx?mensaje=" + Server.UrlEncode(mensaje)); // Se redirecciona al listado pasando el mensaje por url
        }
    }
}