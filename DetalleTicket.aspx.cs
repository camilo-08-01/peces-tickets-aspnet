using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PECEs
{
    public partial class DetalleTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // se obtiene el id desde la URL
                string id = Request.QueryString["id"];

                if(string.IsNullOrEmpty(id) )
                {
                    MostrarError("No se proporcionó un ID de ticket válido");
                    return;
                }

                // se busca el ticket usando el controlador
                Ticket ticket = TicketController.Read(id);

                if(ticket == null )
                {
                    MostrarError("No se encontró un ticket con el ID proporcionado");
                    return;
                }

                CargarDatos(ticket);
            }
        }

        private void CargarDatos(Ticket ticket) // Para dejjar el Page_Load limpio y fácil de leer
        {
            pnlDetalle.Visible = true;

            lblId.Text = ticket.Id;
            lblNombre.Text = ticket.Cliente.Nombre;
            lblRut.Text = ticket.Cliente.Rut;
            lblTelefono.Text = ticket.Cliente.Telefono;
            lblEmail.Text = ticket.Cliente.Email;
            lblProducto.Text = ticket.Producto;
            lblDescripcion.Text = ticket.Descripcion;
            lblEstado.Text = ticket.Estado;

            // se muestra tipo de cliente y razón social si corresponde
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
        }

        private void MostrarError(string mensaje) // Muestra el error y oculta el panel
        {
            lblError.Text = mensaje;
            lblError.Visible = true;
            pnlDetalle.Visible = false;
        }


        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            Response.Redirect("~/ActualizarTickets.aspx?id=" + id);
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ListadoTickets.aspx");
        }
    }
}