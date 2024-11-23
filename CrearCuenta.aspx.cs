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



        protected void btnCrearCuenta_Click(object sender, EventArgs e)
        {


            try
            { 

                // Captura los valores de los controles del formulario
                string Nombre = txtNombre_.Text.Trim();
                string Apellidos = txtApellidos.Text.Trim();
                DateTime Fecha_Nacimiento = DateTime.Parse(txtFechaNacimiento.Text.Trim());
                int RUN = int.Parse(txtRUN.Text.Trim());
                string DV = txtDV.Text.Trim();
                string Correo = txtCorreo.Text.Trim();
                string Contraseña = txtContraseña.Text.Trim();

                // Validar RUN
                Usuario usuario = new Usuario();
                    if (usuario.ValidarRun(RUN, DV))
                    {
                        // Llama al método CrearCuenta
                        usuario.CrearCuenta(Nombre, Apellidos, Fecha_Nacimiento, RUN, DV, Correo, Contraseña);

                        // Mensaje de éxito
                        lblMensaje.Text = "Cuenta creada exitosamente.";
                        lblMensaje.CssClass = "mensajeTexto";
                    }
                    else
            {
                // Mensaje de error si el RUN no es válido
                lblMensaje.Text = "El RUN ingresado no es válido.";
                lblMensaje.CssClass = "mensajeTexto";
            }
                }
                catch (Exception ex)
                {
                    // Manejo de errores
                    lblMensaje.Text = "Ocurrió un error: " + ex.Message;
                    //    lblMensaje.CssClass = "mensajeTexto";
                }

                }
            }
}