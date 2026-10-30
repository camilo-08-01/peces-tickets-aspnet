using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PECEs
{
    public partial class ListadoTickets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // se muestra mensaje si viene por URL
                string mensaje = Request.QueryString["mensaje"];
                if (!string.IsNullOrEmpty(mensaje) )
                {
                    lblMensaje.Text = mensaje;
                    lblMensaje.Visible = true;

                    // cambia color según éxito o error
                    lblMensaje.ForeColor = mensaje.Contains("éxito")
                        ? System.Drawing.Color.Green : System.Drawing.Color.Red;
                }

                string filtro = Request.QueryString["filtro"];

                List<Ticket> listado;

                if(!string.IsNullOrEmpty(filtro) )
                {
                    //se lista según filtro
                    listado = TicketController.Search(filtro);
                }
                else
                {
                    listado = TicketController.ReadAll();
                }

                // se verifica si hay registros
                if (listado == null || listado.Count == 0)
                {
                    gvTickets.Visible = false;
                    lblSinRegistros.Visible = true;
                }
                else
                {
                    gvTickets.Visible=true;
                    gvTickets.DataSource = listado;
                    gvTickets.DataBind();
                }
            }
        }

        protected void gvTickets_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "VerDetalle")
            {
                string id = e.CommandArgument.ToString();
                Response.Redirect("~/DetalleTicket.aspx?id=" + id);
            }
        }
    }
}