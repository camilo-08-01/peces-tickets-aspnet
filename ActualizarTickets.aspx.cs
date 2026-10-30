using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PECEs
{
    public partial class ActualizarTickets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                // se obtiene id desde la URL
                string id = Request.QueryString["id"];

                if(string.IsNullOrEmpty(id) )
                {
                    MostrarError("No se proporcionó un ID de ticket válido.");
                    return;
                }

                Ticket ticket = TicketController.Read(id);

                if (ticket == null )
                {
                    MostrarError("No se encontró un ticket con el ID proporcionado.");
                    return;
                }

                CargarDatos(ticket);
            }
        }

        private void CargarDatos(Ticket ticket)
        {
            pnlActualizar.Visible = true;

            // Datos no editables del cliente
            lblId.Text = ticket.Id;
            lblNombre.Text = ticket.Cliente.Nombre;
            lblRut.Text = ticket.Cliente.Rut;
            lblEstado.Text = ticket.Estado;

            // Tipo de cliente y razón social
            if (ticket.Cliente is Empresa empresa)
            {
                lblTipoCliente.Text = "Empresa";
                lblRazonSocial.Text = empresa.RazonSocial;
            }
            else
            {
                lblTipoCliente.Text = "Persona Natural";
                lblRazonSocial.Text = "N/A";
            }

            //Datos editables del cliente
            txtTelefono.Text = ticket.Cliente.Telefono;
            txtEmail.Text = ticket.Cliente.Email;

            //Datos editables del ticket
            txtProducto.Text = ticket.Producto;
            txtDescripcion.Text = ticket.Descripcion;
        }

        private void MostrarError (string mensaje)
        {
            lblError.Text = mensaje;
            lblError.Visible = true;
            pnlActualizar.Visible = false;
        }

        protected void cvProductoLargo_ServerValidate(object source , ServerValidateEventArgs args)
        {
            args.IsValid = args.Value.Trim().Length >= 10; //Validación nombre producto al menos 10 caracteres
        }

        protected void cvDescripcionLarga_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = args.Value.Trim().Length >= 10; //Validación descripción producto al menos 10 caracteres
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            // se obtiene el id desde la URL
            string id = Request.QueryString["id"];

            // se llama al controlador con los datos actualizados
            string mensaje = TicketController.Update(id, txtProducto.Text, txtDescripcion.Text, lblEstado.Text, txtEmail.Text, txtTelefono.Text);

            // se muestra mensaje de éxito o error
            lblMensaje.Text = mensaje;
            lblMensaje.Visible = true;
            lblMensaje.ForeColor = mensaje.Contains("éxito")
                ? System.Drawing.Color.Green : System.Drawing.Color.Red;
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ListadoTickets.aspx");
        }
    }
}