using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using DatosBase;

namespace Servicio
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service3" en el código, en svc y en el archivo de configuración a la vez.
    // NOTA: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione Service3.svc o Service3.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class Service3 : IService3
    {
        public void RegistroAlumno(string grupoSeleccionado, string apellidos, string nombres, string cui)
        {
            Registrar registrador = new Registrar();
            try
            {
                // Llamamos al método Registro de la clase Registrar
                registrador.Registro(grupoSeleccionado, apellidos, nombres, cui);
            }
            catch (ArgumentException ex)
            {
                // Manejo de errores de validación del grupo
                Console.WriteLine("Error al registrar al alumno: " + ex.Message);
            }
            catch (Exception ex)
            {
                // Manejo de otros errores
                Console.WriteLine("Error general al registrar al alumno: " + ex.Message);
            }
        }
    }
}
