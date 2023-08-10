<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="MatriculasLaboratorio.WebForm6" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        body {
            background-color: #040a1c;
            color: white;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-image: url('EPCCFONDO.png');
            background-size: cover;
            background-position: center;
            opacity: 0.8;
            transition: background-image 1s ease, opacity 1s ease;
        }

        .container {
            background-color: #032b39;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        h1 {
            margin-top: 0;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 10px;
            text-align: left;
            color: white;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 5px;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .enviar-button {
            border: none;
            background-color: #04AA6D;
            color: white;
            padding: 14px 28px;
            font-size: 16px;
            cursor: pointer;
            display: inline-block;
            margin: 0 auto;
            transition: background-color 0.3s;
        }

        .enviar-button:hover {
            background-color: #038055;
        }

        .success {
            color: black; /* Cambio de color del texto a negro */
            background-color: #C3FFB8;
            padding: 10px;
            border-radius: 5px;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.13/jspdf.plugin.autotable.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.0/jspdf.umd.min.js"></script>
    <script type="text/javascript">
        function generatePDF(grupo) {
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

            // Guardar el PDF con nombre personalizado basado en el grupo
            doc.save('horario_' + grupo.toLowerCase() + '.pdf');
        }

        // Asociar evento click del botón Descargar Horario con generatePDF()
        window.onload = function () {
            const btnDownloadPDF = document.getElementById('btnDownloadPDF');
            if (btnDownloadPDF) {
                btnDownloadPDF.addEventListener('click', function () {
                    generatePDF('<%= Request.QueryString["grupo"] %>');
                });
            }
        };

        var images = [
            'EPCCFONDO.png',
            'EPCCFONDO2.png'
        ];

        var currentImage = 0;

        function changeBackground() {
            currentImage = (currentImage + 1) % images.length;
            document.body.style.backgroundImage = "url('" + images[currentImage] + "')";
        }

        setInterval(changeBackground, 5000);
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Aquí se muestra el mensaje -->
            <a id="downloadLink" style="display: none;"></a>
            <div id="mensajeMatricula">
                <div class="success">
                    Sr. Alumno, su matrícula a Laboratorio se realizó correctamente, pase a descargar su horario final.
                </div>
                <div class="button-container">
                    <button id="btnDownloadPDF" class="enviar-button">Descargar Horario</button>
            </div>
        </div>
        </div>
    </form>
</body>
</html>
