using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace Servicio
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IService3" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IService3
    {
        [OperationContract]
        void RegistroAlumno(string grupoSeleccionado, string cui, string apellidos, string nombres);
    }
}
