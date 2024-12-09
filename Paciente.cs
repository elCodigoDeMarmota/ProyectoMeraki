using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace Meraki
{
    public class Paciente
    {
        string conexion = WebConfigurationManager.ConnectionStrings["LOCAL"].ConnectionString;

        public string ProbarConexion()
        {
            string Resultado = null;
            try
            {
                SqlConnection conn = new SqlConnection(conexion);
                conn.Open();
                Resultado = "Conexión exitosa";
                return Resultado;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void RegistrarPaciente(int RUN, string DV,string Nombre, string Apellidos, DateTime Fecha_Nacimiento, string FONO, string CELULAR, string DIRECCION, string Correo, string Contraseña)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(conexion))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("CrearCuenta", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Agregamos parámetros del procedimiento
                        cmd.Parameters.AddWithValue("@RUN", RUN);
                        cmd.Parameters.AddWithValue("@DV", DV);
                        cmd.Parameters.AddWithValue("@Nombre", Nombre);
                        cmd.Parameters.AddWithValue("@Apellidos", Apellidos);
                        cmd.Parameters.AddWithValue("@FechaNacimiento", Fecha_Nacimiento);
                        cmd.Parameters.AddWithValue("@FONO", FONO);
                        cmd.Parameters.AddWithValue("@CELULAR", CELULAR);
                        cmd.Parameters.AddWithValue("@DIRECCION", DIRECCION);

                        cmd.Parameters.AddWithValue("@Correo", Correo);
                        cmd.Parameters.AddWithValue("@Contraseña", Contraseña);

                        //se ejecuta el procedimiento
                        cmd.ExecuteNonQuery();
                    }

                }
            }
            catch (Exception ex)
            {

                throw new Exception("Error al guardar el usuario: " + ex.Message);
            }
        }

        public DataTable ListaEsp()
        {
            DataTable dt = new DataTable();
            SqlDataReader dr = null;
            try
            {
                //Abrir la conexion
                SqlConnection con = new SqlConnection(conexion);
                con.Open();

                //Llamar al procedimiento almacenado
                SqlCommand cmd = new SqlCommand("ListaEspecialidad", con);
                cmd.CommandType = CommandType.StoredProcedure;

                //ejecuto procedure
                dr = cmd.ExecuteReader();
                dt.Load(dr);

                //Cierro dr y conexion
                dr.Close();
                con.Close();
                return dt;
            }
            catch (Exception)
            {

                throw;
            }

        }
        public DataTable ListaCon()
        {
            DataTable dt = new DataTable();
            SqlDataReader dr = null;
            try
            {
                //Abrir la conexion
                SqlConnection con = new SqlConnection(conexion);
                con.Open();

                //Llamar al procedimiento almacenado
                SqlCommand cmd = new SqlCommand("ListaTipoConsulta", con);
                cmd.CommandType = CommandType.StoredProcedure;

                //ejecuto procedure
                dr = cmd.ExecuteReader();
                dt.Load(dr);

                //Cierro dr y conexion
                dr.Close();
                con.Close();
                return dt;
            }
            catch (Exception)
            {

                throw;
            }

        }
        public DataTable ListaPri()
        {
            DataTable dt = new DataTable();
            SqlDataReader dr = null;
            try
            {
                //Abrir la conexion
                SqlConnection con = new SqlConnection(conexion);
                con.Open();

                //Llamar al procedimiento almacenado
                SqlCommand cmd = new SqlCommand("ListaPrioridad", con);
                cmd.CommandType = CommandType.StoredProcedure;

                //ejecuto procedure
                dr = cmd.ExecuteReader();
                dt.Load(dr);

                //Cierro dr y conexion
                dr.Close();
                con.Close();
                return dt;
            }
            catch (Exception)
            {

                throw;
            }

        }






    }

}