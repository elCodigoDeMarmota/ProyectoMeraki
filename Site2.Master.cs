using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Meraki
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsuarioNombre"] != null)
            {
                lblUsuario.Text = "Bienvenid@ " + Session["UsuarioNombre"].ToString();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("Login.aspx"); 
        }


    }
}