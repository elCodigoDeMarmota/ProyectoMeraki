using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Meraki
{
    public partial class PanelControl_Jefatura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresarRegistro_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("IngresarRegistro.aspx");
        }

        protected void btnDashboard_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void btnAdminCuentas_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AdminCuentas.aspx");
        }
    }
}