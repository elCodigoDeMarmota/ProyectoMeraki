using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Meraki
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            string usuarioInput = txtUsuario.Text.Trim();
            string contraseñaInput = txtContraseña.Text.Trim();

            if (string.IsNullOrEmpty(usuarioInput) || string.IsNullOrEmpty(contraseñaInput))
            {
                lblMensajeError2.Text = "Debe ingresar usuario y contraseña.";
                lblMensajeError2.CssClass = "mensajeError";
                lblMensajeError2.Style["visibility"] = "visible";
                lblMensajeError2.Visible = true;
                return;
            }

            try
            {
                Usuario usuario = new Usuario();
                var resultado = usuario.Autentificación(usuarioInput, contraseñaInput);

                if (resultado != null)
                {
                    // Login exitoso
                    string nombreCompleto = $"{resultado.Rows[0]["USU_NOMBRE"]} {resultado.Rows[0]["USU_APELLIDOS"]}";
                    Session["UsuarioNombre"] = nombreCompleto;
                    Response.Redirect("PanelControl_Jefatura.aspx");
                }
                else
                {
                    // Usuario o contraseña incorrectos
                    lblMensajeError2.Text = "Usuario o contraseña incorrectos.";
                    lblMensajeError2.CssClass = "mensajeError";
                    lblMensajeError2.Style["visibility"] = "visible";
                    lblMensajeError2.Visible = true;


                }
            }
            catch (Exception ex)
            {
                lblMensajeError2.Text = "Ocurrió un error inesperado. Intente más tarde.";
                lblMensajeError2.CssClass = "mensajeError";
                lblMensajeError2.Style["visibility"] = "visible";
                lblMensajeError2.Visible = true;
                // Log.Error("Error al iniciar sesión: ", ex); // Registrar el error
            }
        }

    }
}
