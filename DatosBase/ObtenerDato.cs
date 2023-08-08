using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatosBase
{
    class ObtenerDato
    {
        class DBconnection
        {
            public static void Main(String[] args)
            {
                DBconnection db = new DBconnection();
                db.query();
                Console.ReadKey();
            }
            private void query()
            {
                EncontrarDato c = new EncontrarDato();
                IList<string> datos = c.encontrarCUI("20233590", "6i0u6fe1");
                if (datos.Count == 0)
                {
                    Console.WriteLine("Datos no encontrados");
                    return;
                }
                foreach (string dato in datos)
                {
                    Console.WriteLine(dato);
                }
            }
        }
    }
}
