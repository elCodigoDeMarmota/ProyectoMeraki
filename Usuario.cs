using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Web.Configuration;
using System.Data.SqlClient;

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

        public void CrearCuenta(string Nombre, string Apellidos, DateTime Fecha_Nacimiento, int RUN, string DV,  string Correo, string Contraseña)
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

    }
}