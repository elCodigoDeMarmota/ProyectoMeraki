using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Meraki
{
    public class Usuario
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

        public void CrearCuenta(string Nombre, string Apellidos, DateTime Fecha_Nacimiento, int RUN, string DV, string Correo, string Contraseña)
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
                        cmd.Parameters.AddWithValue("@Nombre", Nombre);
                        cmd.Parameters.AddWithValue("@Apellidos", Apellidos);
                        cmd.Parameters.AddWithValue("@FechaNacimiento", Fecha_Nacimiento);
                        cmd.Parameters.AddWithValue("@RUN", RUN);
                        cmd.Parameters.AddWithValue("@DV", DV);
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

        public bool ValidarRun(int run, string dv)
        {
            int suma = 0;
            int multiplicador = 2;

            while (run > 0)
            {
                int digito = run % 10;
                suma += digito * multiplicador;
                multiplicador = multiplicador == 7 ? 2 : multiplicador + 1;
                run /= 10;
            }

            int resto = suma % 11;
            int verificador = 11 - resto;

            string dvCalculado = verificador == 11 ? "0" : verificador == 10 ? "K" : verificador.ToString();

            return dv.ToUpper() == dvCalculado;
        }

        public bool UsuarioExistente(int RUN, string DV)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(conexion))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("UsuarioExistente", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure; // Indica que es un procedimiento almacenado

                        // Parámetros del procedimiento almacenado
                        cmd.Parameters.AddWithValue("@RUN", RUN);
                        cmd.Parameters.AddWithValue("@DV", DV);

                        // Ejecuta el procedimiento y obtiene el resultado
                        int usuarioExistente = (int)cmd.ExecuteScalar();
                        return usuarioExistente > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                // Manejo del error
                throw new Exception("Error al verificar si el usuario existe: " + ex.Message);
            }
        }



        public DataTable Autentificación(string USUARIO, string CONTRASEÑA)
        {
            SqlDataReader dr = null;
            DataTable dt = new DataTable();
            try
            {
                #region Paso 1: Abrir Conecion
                SqlConnection conn = new SqlConnection(conexion);
                conn.Open(); // Abrir conexión
                #endregion
                #region Paso 2: Llamar al procedimiento
                SqlCommand cmd = new SqlCommand("autentificacion", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                #endregion
                #region Paso 3: Pasar parametros
                cmd.Parameters.Add("@USUARIO", SqlDbType.VarChar, 60);
                cmd.Parameters["@USUARIO"].Value = USUARIO;

                cmd.Parameters.Add("@CONTRASEÑA", SqlDbType.VarChar, 60);
                cmd.Parameters["@CONTRASEÑA"].Value = CONTRASEÑA;
                #endregion
                #region Paso 4: Ejecuto el prodecimiento
                dr = cmd.ExecuteReader();
                dt.Load(dr);
                #endregion

                #region cierro conexion y dr
                dr.Close();
                conn.Close();
                #endregion
                return dt;


            }
            catch (Exception ex)
            {
                // Manejo de errores
                throw new Exception("Error al autenticar el usuario: " + ex.Message);
            }

        }

    }
}
