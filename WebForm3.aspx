<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="MatriculasLaboratorio.WebForm3" %>

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

  <div class="container">
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
            <td></td>
            <td>Razonamiento Logico Matematico</td>
            <td>Arte Computacional</td>
            <td>Ingles Tecnico Profesional I</td>
        </tr>
        <tr>
            <td>9:40 AM - 10:30 AM</td>
            <td>Razonamiento Logico Matematico</td>
            <td></td>
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
            <td></td>
            <td></td>
            <td>Liderazgo y Oratoria</td>
        </tr>
        <tr>
            <td>13:10 AM - 14:00 AM</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>Liderazgo y Oratoria</td>
        </tr>
      </tbody>
    </table>
  </div>

  <script>
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