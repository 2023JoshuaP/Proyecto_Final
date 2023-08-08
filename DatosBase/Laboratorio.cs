using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatosBase
{
    public class Laboratorio
    {
        public IList<String> getLaboratorios()
        {
            List<string> laboratorios = new List<string>();

            string conexion = "Data Source=(localdb)\\ProjectModels;Initial Catalog=PruebaTIDataBase;Integrated Security=True;";
            string consulta = "SELECT Laboratorios FROM dbo.GruposLaboratorios";

            using (SqlConnection connection = new SqlConnection(conexion))
            {
                SqlCommand command = new SqlCommand(consulta, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    string laboratorio = reader.GetString(0);
                    laboratorios.Add(laboratorio);
                }

                reader.Close();
            }

            return laboratorios;
        }
    }
}
