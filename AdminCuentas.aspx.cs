using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Meraki
{
    public partial class AdminCuentas : System.Web.UI.Page
    {
        private string ID_Usuario;
        private string rolNombre;

        public object USUARIO { get; private set; }
            //public int ID { get; set; } // Asume que tienes un ID único para el usuario

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Inicializar roles en el primer renderizado de la página
                CargarRoles();
                //CargarUsuarios();
            }

            // Detectar si el postback proviene de un evento del cliente
            string eventTarget = Request["__EVENTTARGET"];
            string eventArgument = Request["__EVENTARGUMENT"];
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

        protected void GridViewDatosUsuario_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditarUsuario")
{
    string ID_Usuario = e.CommandArgument.ToString(); // Captura el ID_Usuario del CommandArgument
    System.Diagnostics.Debug.WriteLine("ID_Usuario capturado en RowCommand: " + ID_Usuario);

    ViewState["ID_Usuario"] = ID_Usuario; // Guarda el ID_Usuario en el ViewState para su uso posterior

    // Lógica para cargar datos en el modal
    Usuario usuario = new Usuario();
    DataTable resultado = usuario.CargarDatosUsuario(ID_Usuario); // Carga datos con el ID_Usuario

    if (resultado.Rows.Count > 0)
    {
        DataRow row = resultado.Rows[0];

        txtNombre.Text = row["Nombre_Usuario"].ToString();
        txtCorreo.Text = row["CorreoElectronico"].ToString();
        string rolId = row["Rol_ID"].ToString();
        if (ddlRol.Items.FindByValue(rolId) != null)
        {
            ddlRol.SelectedValue = rolId;
        }
        else
        {
            ddlRol.SelectedIndex = 0; // Opción por defecto si no se encuentra el rol
        }
        ddlEstadoCuenta.SelectedValue = row["EstadoCuenta"].ToString();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "MostrarModal", "abrirModal();", true);
    }
}

        }


        //protected void GridViewDatosUsuario_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    // Configurar la fila en modo edición
        //    GridViewDatosUsuario.EditIndex = e.NewEditIndex;

        //    // Recargar los datos en el GridView
        //    CargarUsuarios();

        //    // Obtener la fila que se está editando
        //    GridViewRow row = GridViewDatosUsuario.Rows[e.NewEditIndex];
        //    DropDownList ddlRol = (DropDownList)row.FindControl("ddlRol");

        //    if (ddlRol != null)
        //    {
        //        // Cargar los roles en el DropDownList
        //        Usuario usuario = new Usuario();
        //        ddlRol.DataSource = usuario.ListaRol(); // Método que devuelve los roles
        //        ddlRol.DataTextField = "NOMBRE"; // Nombre del rol
        //        ddlRol.DataValueField = "ID"; // ID del rol
        //        ddlRol.DataBind();

        //        // Seleccionar el valor actual del rol
        //        ddlRol.SelectedValue = DataBinder.Eval(row.DataItem, "Rol").ToString();
        //    }
        //}

        //protected void GridViewDatosUsuario_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    // Obtener la fila que está siendo editada
        //    GridViewRow row = GridViewDatosUsuario.Rows[e.RowIndex];

        //    // Obtener los valores editados
        //    string rut = ((Label)row.FindControl("lblRUT")).Text; // Clave primaria
        //    string nombre = ((TextBox)row.FindControl("txtNombre")).Text;
        //    string correo = ((TextBox)row.FindControl("txtCorreo")).Text;
        //    DropDownList ddlRol = (DropDownList)row.FindControl("ddlRol");
        //    string rol = ddlRol.SelectedValue;

        //    // Actualizar los datos en la base de datos
        //    Usuario usuario = new Usuario();
        //    bool actualizado = usuario.ActualizarUsuario(rut, nombre, correo, rol, ID_Usuario);

        //    if (actualizado)
        //    {
        //        // Salir del modo edición y recargar los datos
        //        GridViewDatosUsuario.EditIndex = -1;
        //        CargarUsuarios();
        //    }
        //    else
        //    {
        //        LabelMensajeError.Text = "Error al actualizar los datos del usuario.";
        //        LabelMensajeError.ForeColor = System.Drawing.Color.Red;
        //    }
        //}




        //protected void GridViewDatosUsuario_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    // Salir del modo edición
        //    GridViewDatosUsuario.EditIndex = -1;

        //    // Recargar los datos
        //    CargarUsuarios();
        //}




        private void CargarUsuarios()
        {
            try
            {
                Usuario usuario = new Usuario();
                DataTable resultado = usuario.ListarTodasLasCuentas();

                if (resultado != null && resultado.Rows.Count > 0)
                {
                  

                    GridViewDatosUsuario.DataSource = resultado;
                    GridViewDatosUsuario.DataBind();
                    GridViewDatosUsuario.Visible = true;
                }
                else
                {
                    GridViewDatosUsuario.Visible = false;
                    LabelMensajeError.Text = "No se encontraron usuarios registrados.";
                    LabelMensajeError.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                LabelMensajeError.Text = "Error al cargar usuarios: " + ex.Message;
                LabelMensajeError.ForeColor = System.Drawing.Color.Red;
            }
        }





        protected void GuardarCambios_Click(object sender, EventArgs e)
        {
            if (ViewState["ID_Usuario"] != null)
            {
                string idUsuario = ViewState["ID_Usuario"].ToString();

                Usuario usuario = new Usuario();
                bool resultado = usuario.ActualizarUsuario(
                    txtNombre.Text.Trim(),
                    txtCorreo.Text.Trim(),
                    ddlRol.SelectedValue, // El ID del rol seleccionado
                    ddlEstadoCuenta.SelectedValue,
                    idUsuario
                );

                if (resultado)
                {
                    LabelMensajeError.Text = "Datos actualizados correctamente.";
                    LabelMensajeError.ForeColor = System.Drawing.Color.Green;
                    CargarUsuarios();
                }
                else
                {
                    LabelMensajeError.Text = "Error al actualizar los datos.";
                    LabelMensajeError.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                LabelMensajeError.Text = "No se ha cargado un usuario para actualizar.";
                LabelMensajeError.ForeColor = System.Drawing.Color.Red;
            }
        }






        private void CargarRoles()
        {
            Usuario usuario = new Usuario();
            try
            {
                // Cargar los roles desde la base de datos
                ddlRol.DataSource = usuario.ListaRol();
                ddlRol.DataTextField = "NOMBRE"; // Columna para mostrar
                ddlRol.DataValueField = "ID"; // Columna de valor
                ddlRol.DataBind();

                // Insertar una opción predeterminada al inicio
                ddlRol.Items.Insert(0, new ListItem("Seleccionar", "-1"));
            }
            catch (Exception ex)
            {
                // Mostrar mensaje de error en caso de problemas
                LabelMensajeError.ForeColor = System.Drawing.Color.Red;
                LabelMensajeError.ForeColor = System.Drawing.Color.Red;
            }
        }



    }

}

