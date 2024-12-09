using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Meraki
{
    public partial class IngresarRegistro : System.Web.UI.Page
    {

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            // Limpiar la sesión
            Session.Clear();
            Session.Abandon();

            // Redirigir al login
            Response.Redirect("Login.aspx");
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                CargaDrop();
                    

            }
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public void CargaDrop()
        {
            Paciente us = new Paciente();
            try
            {
                DropDownList2.DataSource = us.ListaEsp();
                DropDownList2.DataValueField = "id";
                DropDownList2.DataTextField = "descripcion";
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, new ListItem("Seleccionar", "-1"));


                DropDownList1.DataSource = us.ListaCon();
                DropDownList1.DataValueField = "id";
                DropDownList1.DataTextField = "nueva_consulta";
                DropDownList1.DataTextField = "control";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("Seleccionar", "-1"));


                DropDownList3.DataSource = us.ListaPri();
                DropDownList3.DataValueField = "id";
                DropDownList3.DataTextField = "descripcion";
                DropDownList3.DataBind();
                DropDownList3.Items.Insert(0, new ListItem("Seleccionar", "-1"));
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                if (!Page.IsValid)
                {
                    return;
                }
                int numero = 10;

                string Nombre = txtNombre_.Text.Trim();
                string Apellidos = txtApellidos.Text.Trim();
                string Fecha_Nacimiento = (txtFechaNacimiento.Text.Trim());
                string RUN = (txtRUN.Text.Trim());
                string DV = txtDV.Text.Trim();
                string Correo = txtCorreo.Text.Trim();
                string Celular = txtCelular.Text.Trim();
                string Direccion = txtDireccion.Text.Trim();

                if (String.IsNullOrEmpty(Nombre) || String.IsNullOrEmpty(Apellidos) ||
                    string.IsNullOrEmpty(Correo) || string.IsNullOrEmpty(RUN) || string.IsNullOrEmpty(DV) ||
                    String.IsNullOrEmpty(Fecha_Nacimiento) || String.IsNullOrEmpty(Celular) ||
                    String.IsNullOrEmpty(Direccion)
                    )
                {


                }

            }
            catch (Exception)
            {

                throw;
            }

        }

        protected void txtDV_TextChanged(object sender, EventArgs e)
        {

            string dv = ((TextBox)sender).Text;
            if (string.IsNullOrEmpty(dv) || dv.Length != 1)
            {
                // Muestra un mensaje o realiza una acción.
                Response.Write("El dígito verificador debe ser un solo carácter.");
            }

        }

        protected void ValidarRunYDV(object source, ServerValidateEventArgs args)
        {
            string run = txtRUN.Text; 
            string dv = txtDV.Text;

            
            if (!string.IsNullOrEmpty(run) && !string.IsNullOrEmpty(dv))
            {
                
                args.IsValid = true;
            }
            else
            {
                
                args.IsValid = false;
            }
        }
    }
}