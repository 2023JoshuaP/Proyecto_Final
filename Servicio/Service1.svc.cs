using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Web;
using DatosBase;

namespace Servicio
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service1" en el código, en svc y en el archivo de configuración a la vez.
    // NOTA: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione Service1.svc o Service1.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class Service1 : IService1
    {
        public IList<String> tomarInformacion(string CUI, string contrasenia)
        {
            EncontrarDato datos = new EncontrarDato();
            IList<String> resultados = datos.encontrarCUI(CUI, contrasenia);

            // Verificar si CUI y contraseña coinciden con valores específicos
            if (CUI == "cui_especifico" && contrasenia == "contrasenia_especifica")
            {
                HttpContext.Current.Response.Redirect("WebAdministrador.aspx"); // Cambia esto a la página especial que desees
            }

            return resultados;
        }
    }
}
