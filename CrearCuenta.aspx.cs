using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Meraki.Utils;

namespace Meraki
{
    public partial class CrearCuenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ValidarRunYDV(object sender, ServerValidateEventArgs args)
        {
            if (string.IsNullOrEmpty(txtRUN.Text) || string.IsNullOrEmpty(txtDV.Text))
            {
                args.IsValid = false;
                CustomVal_RUN_DV.ErrorMessage = "El RUN y el dígito verificador son obligatorios.";
                CustomVal_RUN_DV.CssClass = "mensajeError";
                CustomVal_RUN_DV.Style["visibility"] = "visible"; // Mostrar el mensaje
                CustomVal_RUN_DV.Style["display"] = "block"; // Asegúrate de que se vea
            }
        }

        protected void btnCrearCuenta_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsValid)
                {
                    return; 
                }

                string Nombre = txtNombre_.Text.Trim();
                string Apellidos = txtApellidos.Text.Trim();
                DateTime Fecha_Nacimiento = DateTime.Parse(txtFechaNacimiento.Text.Trim());
                int RUN = int.Parse(txtRUN.Text.Trim());
                string DV = txtDV.Text.Trim();
                string Correo = txtCorreo.Text.Trim();
                string Contraseña = txtContraseña.Text.Trim();

                if (Contraseña != txtConfirmaContraseña.Text.Trim())
                {
                    lblMensajeError2.Text = "Las contraseñas no coinciden.";
                    lblMensajeError2.CssClass = "mensajeError"; 
                    lblMensajeError2.Style["visibility"] = "visible"; 
                    lblMensajeError2.Style["display"] = "block"; 

                    return; 
                }

                Usuario usuario = new Usuario();
                if (usuario.UsuarioExistente(RUN, DV))
                {
                    lblMensajeError2.Text = "El usuario ya está registrado.";
                    lblMensajeError2.CssClass = "mensajeError"; 
                    lblMensajeError2.Style["visibility"] = "visible"; 
                    lblMensajeError2.Style["display"] = "block"; 
                    return; 
                }

             
                if (!usuario.ValidarRun(RUN, DV))
                {
                    lblMensajeError2.Text = "El RUN ingresado no es válido.";
                    lblMensajeError2.CssClass = "mensajeError"; 
                    lblMensajeError2.Style["visibility"] = "visible"; // Mostrar el mensaje
                    lblMensajeError2.Style["display"] = "block"; // Asegúrate de que se vea

                    return; 
                }
                // Crear salt y hash
                string salt = Utils.Utils.GenerarSalt();
                string hash = Utils.Utils.GenerarHash(Contraseña, salt);

                Contraseña = hash;


                usuario.CrearCuenta(Nombre, Apellidos, Fecha_Nacimiento, RUN, DV, Correo, Contraseña);

                LimpiarFormulario();

                lblMensajeExito2.Text = "Cuenta creada exitosamente.";
                lblMensajeExito2.CssClass = "mensajeExito";
                lblMensajeExito2.Style["visibility"] = "visible"; // Mostrar el mensaje
                lblMensajeExito2.Style["display"] = "block"; // Asegúrate de que se vea

            }
            catch (Exception ex)
            {
                lblMensajeError2.Text = "Ocurrió un error: " + ex.Message;
                lblMensajeError2.CssClass = "mensajeError";
            }
        }

        private void LimpiarFormulario()
        {
            txtNombre_.Text = "";
            txtApellidos.Text = "";
            txtFechaNacimiento.Text = "";
            txtRUN.Text = "";
            txtDV.Text = "";
            txtCorreo.Text = "";
            txtContraseña.Text = "";
            txtConfirmaContraseña.Text = "";

            lblMensajeError2.Visible = false;
            lblMensajeExito2.Visible = true;
        }


    }
}