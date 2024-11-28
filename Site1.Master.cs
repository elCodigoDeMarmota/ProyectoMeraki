using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Meraki
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //lblUsuario.Text = Session["NombreUsuario"].ToString();/*Variable de session*/
            //lblRol.Text = Session["Rol"].ToString();
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void btnCrearCuenta_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CrearCuenta.aspx"); // Cambia la ruta según la ubicación de tu página de creación de cuenta
        }
    }
}