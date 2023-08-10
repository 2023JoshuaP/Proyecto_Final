using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MatriculasLaboratorio
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            string cui = txtCUI.Text;

            string contrasenia = txtPassword.Text;

            if (cui == "" || contrasenia == "")
            {
                Response.Write("<script>alert('Por favor, complete todos los campos.');</script>");
            }
            else
            {
                Session["CUI"] = cui;

                Session["contrasenia"] = contrasenia;
                if (cui == "12345678" && contrasenia == "admin")
                {
                    Response.Redirect("WebAdministrador.aspx");
                }
                else
                {
                    Response.Redirect("WebForm2.aspx");
                }
            }
        }
    }
}