using System;
using System.Security.Cryptography;
using System.Text;

namespace Meraki.Utils
{
    public static class Utils
    {
        public static string GenerarSalt()
        {
            Random random = new Random();
            byte[] saltBytes = new byte[16];
            random.NextBytes(saltBytes);

            // Convertir los bytes a una cadena en Base64
            return Convert.ToBase64String(saltBytes);
        }

        // Método para generar el hash de una contraseña con un salt
        public static string GenerarHash(string contraseña, string salt)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                // Concatenar la contraseña con el salt
                string contraseñaConSalt = contraseña + salt;

                // Convertir a bytes y calcular el hash
                byte[] bytes = Encoding.UTF8.GetBytes(contraseñaConSalt);
                byte[] hashBytes = sha256.ComputeHash(bytes);

                // Convertir el hash a una representación hexadecimal
                StringBuilder sb = new StringBuilder();
                foreach (byte b in hashBytes)
                {
                    sb.Append(b.ToString("x2"));
                }
                return sb.ToString();
            }
        }

        // Método para verificar si la contraseña ingresada es válida
        public static bool VerificarContraseña(string contraseñaIngresada, string salt, string hashAlmacenado)
        {
            // Generar el hash de la contraseña ingresada usando el mismo salt
            string hashIngresado = GenerarHash(contraseñaIngresada, salt);

            // Comparar el hash ingresado con el almacenado
            return hashAlmacenado == hashIngresado;
        }

    }
}