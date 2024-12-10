using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using Meraki.Utils;

namespace Meraki
{
    public class Usuario
    {
        string conexion = WebConfigurationManager.ConnectionStrings["LOCAL"].ConnectionString;

        public int ID { get; set; } // Asume que tienes un ID único para el usuario
        public string RUT { get; set; }
        public string Nombre { get; set; }
        public string Correo { get; set; }
        public string Rol { get; set; }
        public string EstadoCuenta { get; set; }

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

        public void CrearCuenta(string Nombre, string Apellidos, DateTime Fecha_Nacimiento, int RUN, string DV, string Correo, string Contraseña, string salt)
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
                        cmd.Parameters.AddWithValue("@Salt", salt);

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


        public DataTable Autentificación(string USUARIO, string CONTRASEÑA)
        {
            SqlDataReader dr = null;
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection conn = new SqlConnection(conexion))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("autentificacion", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@USUARIO", SqlDbType.VarChar, 60).Value = USUARIO;

                        dr = cmd.ExecuteReader();
                        dt.Load(dr);

                        if (dt.Rows.Count == 0)
                        {
                            // Usuario no encontrado
                            return null;
                        }

                        string hashAlmacenado = dt.Rows[0]["USU_CONTRASEÑA"].ToString();
                        string salt = dt.Rows[0]["USU_SALT"].ToString();

                        // Generar hash ingresado
                        string hashIngresado = Utils.Utils.GenerarHash(CONTRASEÑA, salt);

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

        public DataTable CargarDatosUsuario(string idUsuario = null, string rut = null)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection conn = new SqlConnection(conexion))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("BuscarUsuario", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Parámetros opcionales
                    cmd.Parameters.AddWithValue("@ID_Usuario", string.IsNullOrEmpty(idUsuario) ? (object)DBNull.Value : idUsuario);
                    cmd.Parameters.AddWithValue("@RUT", string.IsNullOrEmpty(rut) ? (object)DBNull.Value : rut);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al cargar los datos del usuario", ex);
            }

            return dt;
        }


        public bool ActualizarUsuario(string nombre, string correo, string rol, string estadoCuenta, string ID_Usuario)
        {
            using (SqlConnection conn = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("ActualizarUsuario", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                // Agregar parámetros
                cmd.Parameters.AddWithValue("@Nombre", nombre);
                cmd.Parameters.AddWithValue("@Correo", correo);
                cmd.Parameters.AddWithValue("@RolNombre", rol);
                cmd.Parameters.AddWithValue("@EstadoCuenta", estadoCuenta);
                cmd.Parameters.AddWithValue("@ID_Usuario", ID_Usuario); // Identificador único

                conn.Open();
                int filasAfectadas = cmd.ExecuteNonQuery();
                return filasAfectadas > 0; // Retorna true si se actualizó al menos una fila
            }
        }

        internal bool ActualizarUsuario(string rut, string nombre, string correo, string rol, object iD_Usuario)
        {
            throw new NotImplementedException();
        }
    }
}
