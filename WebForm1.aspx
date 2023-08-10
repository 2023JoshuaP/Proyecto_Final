<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="MatriculasLaboratorio.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Matriculas de laboratorio</title>
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
            color: green;
        }
    </style>
    <script type="text/javascript">
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

        function validar_numeros(event) {
            var numeros = event.KeyCode || event.which;
            var datos = document.getElementById('<%= txtCUI.ClientID %>');
            var cui = datos.value;
            if (numeros < 48 || numeros > 57) {
                event.preventDefault();
                alert("Solo se aceptan números.");
            } else if (cui.length >= 8) {
                event.preventDefault();
                alert("Solo se acepta hasta 8 números.");
            }
        }

        function validar_letras(event) {
            var letras = event.KeyCode || event.which;
            if ((letras < 65 || letras > 90) && (letras < 97 || letras > 122)) {
                event.preventDefault();
                alert("Error, solo se permiten letras.");
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Matriculas de laboratorio</h1>
            <div>
                <label>CUI:</label>
                <asp:TextBox ID="txtCUI" runat="server" onkeypress="validar_numeros(event);"></asp:TextBox>
            </div>
            
            <div>
                <label>Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div class="button-container">
                <asp:Button ID="btnEnviar" runat="server" Text="Enviar" OnClick="btnEnviar_Click" CssClass="enviar-button" />
            </div>
        </div>
    </form>
</body>
</html>
