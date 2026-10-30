using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PECEs
{
    public partial class MPSitio : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string filtro = txtBusquedaAvanzada.Text.Trim();
            Response.Redirect("~/ListadoTickets.aspx?filtro=" + Server.UrlEncode(filtro));
        }
    }
}