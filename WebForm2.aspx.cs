using MatriculasLaboratorio.ServiceReference1;
using MatriculasLaboratorio.ServiceReference2;
using MatriculasLaboratorio.ServiceReference3;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MatriculasLaboratorio
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string[] laboratorios = serviceCall();
                foreach (string laboratorio in laboratorios)
                {
                    ddlGroup.Items.Add(new ListItem(laboratorio, laboratorio));
                }
                // Retrieve the query parameters from the URL
                string cui = (String)Session["CUI"];
                string contrasenia = (String)Session["contrasenia"];

                // Check if the value is not null
                if (!string.IsNullOrEmpty(cui))
                {
                    // Display the retrieved value
                    lblCUI.Text = "CUI: " + cui;

                    // Call EncontrarInformacion method to populate additional controls
                    EncontrarInformacion(cui, contrasenia);
                }
            }
        }
        private String[] serviceCall()
        {
            Service2Client client = new Service2Client();
            String[] laboratorios = client.getLaboratorios();
            return laboratorios;
        }
        private void EncontrarInformacion(string CUI, string contrasenia)
        {
            Service1Client serviceClient = new Service1Client();
            String[] datos = serviceClient.tomarInformacion(CUI, contrasenia);

            if (datos != null && datos.Length >= 3)
            {
                String apellidos = datos[0];
                String nombres = datos[1];
                String grupo = datos[2];

                lblApellidos.Text = apellidos;
                lblNombres.Text = nombres;
                lblGrupo.Text = grupo;
            }
            else
            {
                Response.Write("<script>alert('No se encontró información para el CUI proporcionado.');</script>");
            }
        }
        protected void btnRegistrarAlumno(object sender, EventArgs e)
        {
            // Obtener los datos del alumno a registrar
            string cui = lblCUI.Text.Substring(5); // Eliminamos el prefijo "CUI: " para obtener solo el número
            string apellidos = lblApellidos.Text;
            string nombres = lblNombres.Text;
            string grupoSeleccionado = ddlGroup.SelectedValue;

            // Verificar si el estudiante ya está matriculado en el grupo seleccionado
            int alumnoExistente = VerificarAlumno(nombres, apellidos);
            if (alumnoExistente > 0)
            {
                string mensaje = "alert('El alumno ya está matriculado en el grupo " + grupoSeleccionado + ".');";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "AlumnoExistente", mensaje, true);
                return; // No realizar el registro y redirección
            }

            // Llamar al servicio para registrar al alumno
            Service3Client serviceClient = new Service3Client();
            serviceClient.RegistroAlumno(grupoSeleccionado, apellidos, nombres, cui);

            string contraseniaEspecifica = "admin";
            string contraseniaIngresada = "admin";
            if (cui == "12345678" && contraseniaIngresada == contraseniaEspecifica)
            {
                Response.Redirect("WebAdministrador.aspx"); // Cambia esto a la página especial que desees
                return; // No realizar el registro y redirección
            }

            if (alumnoExistente == 0)
            {
                string successScript = "alert('Registro exitoso en el grupo " + grupoSeleccionado + ".');";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "RegistroExitoso", successScript, true);
            }

            // ...

            string redirectScript = "setTimeout(function() { window.location.href = 'WebForm6.aspx?grupo=" + grupoSeleccionado + "'; }, 1000);";
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Redireccionar", redirectScript, true);
        }
        protected void btnVerHorario(object sender, EventArgs e)
        {
            string grupo = lblGrupo.Text;
            if (grupo == "A")
            {
                Response.Redirect("WebForm3.aspx");
            }
            else if (grupo == "B")
            {
                Response.Redirect("WebForm4.aspx");
            }
            else if (grupo == "C")
            {
                Response.Redirect("WebForm5.aspx");
            }
        }
        [WebMethod]
        public static int VerificarAlumno(string nombres, string apellidos)
        {
            string connectionString = "Data Source=(localdb)\\ProjectModels;Initial Catalog=PruebaTIDataBase;Integrated Security=True;";
            string[] tablas = { "Laboratorio_Grupo_A", "Laboratorio_Grupo_B", "Laboratorio_Grupo_C", "Laboratorio_Grupo_D" };
            int count = 0;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                foreach (string tabla in tablas)
                {
                    string query = $"SELECT COUNT(*) FROM {tabla} WHERE Nombres = @nombres AND Apellidos = @apellidos";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@nombres", nombres);
                        command.Parameters.AddWithValue("@apellidos", apellidos);

                        count = (int)command.ExecuteScalar();

                        if (count > 0)
                        {
                            // El estudiante ya está registrado en esta tabla, no es necesario seguir buscando.
                            break;
                        }
                    }
                }
            }

            return count;
        }
    }
}