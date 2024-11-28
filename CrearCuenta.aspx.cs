using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                // Verifica si las validaciones del cliente son válidas
                if (!Page.IsValid)
                {
                    return; // Si hay errores en los campos requeridos, detén la ejecución
                }

                // Captura los valores de los controles del formulario
                string Nombre = txtNombre_.Text.Trim();
                string Apellidos = txtApellidos.Text.Trim();
                DateTime Fecha_Nacimiento = DateTime.Parse(txtFechaNacimiento.Text.Trim());
                int RUN = int.Parse(txtRUN.Text.Trim());
                string DV = txtDV.Text.Trim();
                string Correo = txtCorreo.Text.Trim();
                string Contraseña = txtContraseña.Text.Trim();

                // Validar contraseñas
                if (Contraseña != txtConfirmaContraseña.Text.Trim())
                {
                    lblMensajeError2.Text = "Las contraseñas no coinciden.";
                    lblMensajeError2.CssClass = "mensajeError"; // Hace visible el mensaje
                    lblMensajeError2.Style["visibility"] = "visible"; // Mostrar el mensaje
                    lblMensajeError2.Style["display"] = "block"; // Asegúrate de que se vea

                    return; // Detiene la ejecución si las contraseñas no coinciden
                }

                Usuario usuario = new Usuario();
                if (usuario.UsuarioExistente(RUN, DV))
                {
                    lblMensajeError2.Text = "El usuario ya está registrado.";
                    lblMensajeError2.CssClass = "mensajeError"; // Hace visible el mensaje
                    lblMensajeError2.Style["visibility"] = "visible"; // Mostrar el mensaje
                    lblMensajeError2.Style["display"] = "block"; // Asegúrate de que se vea

                    return; // Detiene la ejecución si el usuario ya existe
                }

                // Validar RUN
                if (!usuario.ValidarRun(RUN, DV))
                {
                    lblMensajeError2.Text = "El RUN ingresado no es válido.";
                    lblMensajeError2.CssClass = "mensajeError"; // Hace visible el mensaje
                    lblMensajeError2.Style["visibility"] = "visible"; // Mostrar el mensaje
                    lblMensajeError2.Style["display"] = "block"; // Asegúrate de que se vea

                    return; // Detiene la ejecución si el RUN no es válido
                }

                // Crear cuenta si todas las validaciones son correctas
                usuario.CrearCuenta(Nombre, Apellidos, Fecha_Nacimiento, RUN, DV, Correo, Contraseña);

                LimpiarFormulario();

                // Mostrar mensaje de éxito
                lblMensajeExito2.Text = "Cuenta creada exitosamente.";
                lblMensajeExito2.CssClass = "mensajeExito";
                lblMensajeExito2.Style["visibility"] = "visible"; // Mostrar el mensaje
                lblMensajeExito2.Style["display"] = "block"; // Asegúrate de que se vea

            }
            catch (Exception ex)
            {
                // Manejo de errores
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