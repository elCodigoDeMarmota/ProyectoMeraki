using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Meraki
{
    public partial class AdminCuentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    // Ocultar los controles inicialmente
            //    txtBuscarUsuario.Visible = false;
            //    btnBuscarUsuario.Visible = false;
            //    GridView1.Visible = false;
            //}
        }



        protected void Menu3_MenuItemClick(object sender, MenuEventArgs e)
        {
            // Ocultar todos los paneles por defecto
            PanelUsuarios.Visible = false;
            //PanelPermisos.Visible = false;
            //PanelCuentas.Visible = false;

            switch (e.Item.Value)
            {
                case "Usuarios":
                    PanelUsuarios.Visible = true;
                    // Simula datos para el GridView
                    //GridViewUsuarios.DataSource = GetUsuariosData();
                    //GridViewUsuarios.DataBind();
                    break;
            }
            //    protected void Menu3_MenuItemClick(object sender, MenuEventArgs e)
            //    {
            //        // Limpiar datos del GridView
            //        GridView1.DataSource = null;
            //        GridView1.DataBind();

            //        // Manejar el contenido según el ítem seleccionado
            //        switch (e.Item.Value)
            //        {
            //            case "Usuarios":
            //                // Ejemplo: Mostrar datos de usuarios
            //                GridView1.DataSource = GetUsuariosData();
            //                GridView1.DataBind();
            //                break;

            //            case "Roles":
            //                // Ejemplo: Mostrar datos de roles
            //                GridView1.DataSource = GetRolesData();
            //                GridView1.DataBind();
            //                break;

            //            case "Cuentas":
            //                // Ejemplo: Mostrar datos de cuentas
            //                GridView1.DataSource = GetCuentasData();
            //                GridView1.DataBind();
            //                break;
            //        }
            //    }

        
        }

        protected void ButtonBuscar_Click(object sender, EventArgs e)
        {
            string RUT = txtBuscarUsuario.Text.Trim();

            if (string.IsNullOrEmpty(RUT))
            {
                LabelMensajeError.Text = "Por favor, ingresa un RUT válido.";
                LabelMensajeError.ForeColor = System.Drawing.Color.Red;
                LabelMensajeError.Visible = true;
                return;
            }

            Usuario usuario = new Usuario();
            DataTable resultado = usuario.BuscarUsuarioPorRUT(RUT);

            if (resultado != null && resultado.Rows.Count > 0)
            {
                // Mostrar los resultados en el GridView
                GridViewDatosUsuario.DataSource = resultado;
                GridViewDatosUsuario.DataBind();
                GridViewDatosUsuario.Visible = true;

                // Limpiar el mensaje
                LabelMensajeError.Text = string.Empty;
            }
            else
            {
                // Si no se encuentra el usuario, mostrar mensaje
                GridViewDatosUsuario.Visible = false;
                LabelMensajeError.Text = "No se encontraron resultados para el RUT ingresado.";
                LabelMensajeError.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void CheckBoxMostrarTodos_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                if (CheckBoxMostrarTodo.Checked)
                {
                    // Mostrar todas las cuentas
                    Usuario usuario = new Usuario();
                    DataTable resultado = usuario.ListarTodasLasCuentas();

                    if (resultado != null && resultado.Rows.Count > 0)
                    {
                        GridViewDatosUsuario.DataSource = resultado;
                        GridViewDatosUsuario.DataBind();
                        GridViewDatosUsuario.Visible = true;

                        // Ocultar mensajes de error
                        LabelMensajeError.Text = string.Empty;
                    }
                }
                else
                {
                    // Si se desmarca el CheckBox, limpiar el GridView
                    GridViewDatosUsuario.Visible = false;
                }
            }
            catch (Exception ex)
            {
                LabelMensajeError.Text = "Ocurrió un error al listar las cuentas: " + ex.Message;
                LabelMensajeError.ForeColor = System.Drawing.Color.Red;
            }
        }


    }

}

