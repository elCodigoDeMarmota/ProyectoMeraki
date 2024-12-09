using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Meraki.Utils;

namespace Meraki
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();

       
            string USUARIO = txtUsuario.Text.Trim();
            string CONTRASEÑA = txtContraseña.Text.Trim();



            DataTable resultado = usuario.Autentificación(USUARIO, CONTRASEÑA);

            if (resultado.Rows.Count > 0)
            {
                string nombreCompleto = resultado.Rows[0]["USU_NOMBRE"].ToString() + " " + resultado.Rows[0]["USU_APELLIDOS"].ToString();
                Session["UsuarioNombre"] = nombreCompleto;


                lblMensajeExito2.Text = "Inicio de sesión exitoso.";
                lblMensajeExito2.CssClass = "mensajeExito";
                lblMensajeExito2.Style["visibility"] = "visible"; 
                lblMensajeExito2.Style["display"] = "block";
                lblMensajeExito2.Visible = true;

                Response.Redirect("PanelControl_Jefatura.aspx");
                return;
            }

            else
            {
                lblMensajeError2.Text = "Usuario o contraseña incorrectos.";
                lblMensajeError2.CssClass = "mensajeError";
                lblMensajeError2 .Visible = true;
             
                lblMensajeError2.Style["visibility"] = "visible"; 
                lblMensajeError2.Style["display"] = "block"; 
              
            }


        }

    }

        //protected void btnIniciarSesion_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("~/Login.aspx");
        //}
}
