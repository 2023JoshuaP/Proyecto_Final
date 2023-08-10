using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MatriculasLaboratorio
{
    public partial class WebAdministrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ActualizarContadores();
        }
        public void ActualizarContadores()
        {
            labA.Text = ObtenerContador("Laboratorio_Grupo_A").ToString();
            labB.Text = ObtenerContador("Laboratorio_Grupo_B").ToString();
            labC.Text = ObtenerContador("Laboratorio_Grupo_C").ToString();
            labD.Text = ObtenerContador("Laboratorio_Grupo_D").ToString();
        }

        private int ObtenerContador(string tabla)
        {
            string connectionString = "Data Source=(localdb)\\ProjectModels;Initial Catalog=PruebaTIDataBase;Integrated Security=True;";
            int count = 0;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = $"SELECT COUNT(*) FROM {tabla}";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    count = (int)command.ExecuteScalar();
                }
            }

            return count;
        }
    }
}