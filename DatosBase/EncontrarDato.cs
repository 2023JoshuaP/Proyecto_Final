using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DatosBase
{
    public class EncontrarDato
    {
        public IList<String> encontrarCUI(string cui, string contrasenia)
        {
            string conexion = "Data Source=(localdb)\\ProjectModels;Initial Catalog=Base_Datos_Estudiantes;Integrated Security=True;";
            string consulta = "SELECT Apellidos, Nombres, Grupo FROM EstudiantesPrimerAnio WHERE CUI = @Cui AND Contrasenia = @Contrasenia;";
            IList<String> resultados = new List<String>();

            using (SqlConnection connection = new SqlConnection(conexion))
            {
                SqlCommand command = new SqlCommand(consulta, connection);
                command.Parameters.AddWithValue("@Cui", cui);
                command.Parameters.AddWithValue("@Contrasenia", contrasenia);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    string apellidos = reader["Apellidos"].ToString();
                    string nombres = reader["Nombres"].ToString();
                    string grupo = reader["Grupo"].ToString();

                    resultados.Add(apellidos);
                    resultados.Add(nombres);
                    resultados.Add(grupo);

                    if (cui == "12345678" && contrasenia == "admin")
                    {
                        HttpContext.Current.Response.Redirect("WebAdministrador.aspx"); // Cambia esto a la página especial que desees
                    }
                }
                reader.Close();
            }

            return resultados;
        }
    }
}
