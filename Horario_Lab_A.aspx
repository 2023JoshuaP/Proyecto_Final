<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Horario_Lab_A.aspx.cs" Inherits="MatriculasLaboratorio.HorarioLabA" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>LABORATORIOS-EPCC</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />

  <style>
    /* Estilos para el modo claro */
    body {
      /* Agrega tus estilos actuales para el modo claro aquí */
    }
    nav,
    .offcanvas {
      background-color: #1e293b;
    }
    .navbar-toggler {
      border: none;
    }
    .navbar-toggler:focus {
      outline: none;
      box-shadow: none;
    }
    @media (max-width: 768px) {
      .navbar-nav > li:hover {
        background-color: #0dcaf0;
      }
    }
    
    /* Estilos para el modo oscuro */
    body.dark-mode {
      background-color: #1e293b;
      color: #ffffff;
    }
    .navbar.dark-mode {
      background-color: #1e293b;
    }
    .container.dark-mode {
      background-color: #1e293b;
    }

    body.dark-mode h1,
    body.dark-mode h2,
    body.dark-mode h3,
    body.dark-mode h4,
    body.dark-mode h5,
    body.dark-mode h6,
    body.dark-mode p,
    body.dark-mode a,
    body.dark-mode li,
    body.dark-mode th,
    body.dark-mode td { 
      color: #ffffff;
    }
  </style>
</head>
<body>
  <div id="pdfContent" class="container">
    <h1>Horario</h1>
    <table class="table">
      <thead>
        <tr>
          <th>Hora</th>
          <th>Lunes</th>
          <th>Martes</th>
          <th>Miércoles</th>
          <th>Jueves</th>
          <th>Viernes</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>7:00 AM - 7:50 AM</td>
          <td>Fundamentos de la Computacion</td>
          <td>Ingles Tecnico Profesional I</td>
          <td>Metodologia del Trabajo Intelectual Universitario</td>
          <td>Arte Computacional</td>
          <td>Estructuras Discretas I</td>
        </tr>
        <tr>
          <td>7:50 AM - 8:40 AM</td>
          <td>Fundamentos de la Computacion</td>
          <td>Ingles Tecnico Profesional I</td>
          <td>Metodologia del Trabajo Intelectual Universitario</td>
          <td>Arte Computacional</td>
          <td>Estructuras Discretas I</td>
        </tr>
        <tr>
            <td>8:50 AM - 9:40 AM</td>
            <td>Razonamiento Logico Matematico</td>
            <td>Fundamentos de la Computacion</td>
            <td>Razonamiento Logico Matematico</td>
            <td>Arte Computacional</td>
            <td>Ingles Tecnico Profesional I</td>
        </tr>
        <tr>
            <td>9:40 AM - 10:30 AM</td>
            <td>Razonamiento Logico Matematico</td>
            <td>Fundamentos de la Computacion</td>
            <td>Razonamiento Logico Matematico</td>
            <td>Arte Computacional</td>
            <td>Ingles Tecnico Profesional I</td>
        </tr>
        <tr>
            <td>10:40 AM - 11:30 AM</td>
            <td>Metodologia del Trabajo Intelectual Universitario</td>
            <td></td>
            <td>Estructuras Discretas I</td>
            <td>Estructuras Discretas I</td>
            <td></td>
        </tr>
        <tr>
            <td>11:30 AM - 12:20 PM</td>
            <td>Metodologia del Trabajo Intelectual Universitario</td>
            <td></td>
            <td>Estructuras Discretas I</td>
            <td>Estructuras Discretas I</td>
            <td>Liderazgo y Oratoria</td>
        </tr>
        <tr>
            <td>12:20 PM - 13:10 PM</td>
            <td></td>
            <td></td>
            <td>Fundamentos de la Computacion</td>
            <td></td>
            <td>Liderazgo y Oratoria</td>
        </tr>
        <tr>
            <td>13:10 PM - 14:00 PM</td>
            <td></td>
            <td></td>
            <td>Fundamentos de la Computacion</td>
            <td></td>
            <td>Liderazgo y Oratoria</td>
        </tr>
      </tbody>
    </table>
  </div>
  <button id="btnDownloadPDF">Descargar PDF</button>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.13/jspdf.plugin.autotable.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.0/jspdf.umd.min.js"></script>
  <script>
      function generatePDF() {
          // Configurar orientación del PDF a 'landscape' (horizontal)
          const doc = new jsPDF({
              orientation: 'landscape'
          });

          // Calcular el ancho de la página y el ancho de las celdas
          const pageWidth = doc.internal.pageSize.getWidth();
          const cellWidth = pageWidth / 6;

          // Agregar contenido al PDF con letras más pequeñas (fontSize: 10)
          doc.setFontSize(10);
          doc.text('Horario', 20, 20);

          // Obtener la tabla como elemento HTML
          const element = document.getElementById('pdfContent');

          // Obtener las filas y celdas de la tabla
          const rows = element.getElementsByTagName('tr');

          // Calcular el ancho total de la tabla
          let tableWidth = 0;
          for (let i = 0; i < rows[0].cells.length; i++) {
              tableWidth += cellWidth;
          }

          // Calcular la posición horizontal para centrar la tabla
          let x = (pageWidth - tableWidth) / 2;

          // Posición vertical inicial
          let y = 30;

          // Variable para almacenar la altura de las celdas
          let cellHeight = 0;

          // Dibujar filas y celdas de la tabla
          for (let i = 0; i < rows.length; i++) {
              const cells = rows[i].getElementsByTagName('td');

              for (let j = 0; j < cells.length; j++) {
                  const cellText = cells[j].innerText;

                  // Calcular el número de líneas basado en el ancho de la celda y el tamaño de fuente
                  const textLines = doc.splitTextToSize(cellText, cellWidth - 4);
                  const numLines = textLines.length;

                  // Calcular el alto de la celda
                  cellHeight = numLines * 7 + 6;

                  doc.rect(x, y, cellWidth, cellHeight, 'S');
                  doc.text(textLines, x + 2, y + 6);

                  x += cellWidth;
              }

              // Restaurar la posición horizontal y actualizar la posición vertical
              x = (pageWidth - tableWidth) / 2;
              y += cellHeight;
          }

          // Guardar el PDF
          doc.save('horario.pdf');
      }

      // Asocia el evento click del botón con la función generatePDF
      const btnDownloadPDF = document.getElementById('btnDownloadPDF');
      btnDownloadPDF.addEventListener('click', generatePDF);

      const botonCambiarModo = document.createElement('button');
      botonCambiarModo.textContent = 'Cambiar Modo';
      botonCambiarModo.style.position = 'fixed';
      botonCambiarModo.style.bottom = '20px';
      botonCambiarModo.style.right = '20px';
      botonCambiarModo.style.padding = '10px';
      botonCambiarModo.style.backgroundColor = '#007bff';
      botonCambiarModo.style.color = '#ffffff';
      botonCambiarModo.style.border = 'none';
      botonCambiarModo.style.borderRadius = '5px';
      botonCambiarModo.style.cursor = 'pointer';
      botonCambiarModo.style.zIndex = '9999';
    
      document.body.appendChild(botonCambiarModo);
    
      botonCambiarModo.addEventListener('click', () => {
        document.body.classList.toggle('dark-mode');
      });
  </script>
</body>
</html>
