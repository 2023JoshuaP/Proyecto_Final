<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="MatriculasLaboratorio.WebForm2" %>

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

        .result-container {
            margin-bottom: 10px;
        }

        .result-container label {
            color: white;
        }

        .result-textbox {
            width: 100%;
            padding: 8px;
            background-color: #0f3546;
            color: #fff;
            border: 1px solid #033548;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .result-textbox:focus {
            outline: none;
            border-color: #04AA6D;
        }

        .select-group-container {
            margin-bottom: 10px;
        }

        .select-group-container label {
            display: block;
            margin-bottom: 5px;
            color: white;
        }

        .select-group-container select {
            width: 100%;
            padding: 8px;
            background-color: #0f3546;
            color: #fff;
            border: 1px solid #033548;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
            max-width: 250px;
        }

        .select-group-container select:focus {
            outline: none;
            border-color: #04AA6D;
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
    <script src="./Scripts/jquery-3.4.1.js"></script>
    <script type="text/javascript">

        var grupoSeleccionado;

        // Función para seleccionar un grupo
        function selectGroup(grupo) {
            grupoSeleccionado = grupo;
        }

        function Verificar() {
            var nombres = document.getElementById("lblNombres").value;
            var apellidos = document.getElementById("lblApellidos").value;

            if (nombres !== "" && apellidos !== "") {
                $.ajax({
                    type: "POST",
                    url: "WebForm2.aspx/VerificarAlumno",
                    data: JSON.stringify({ nombres: nombres, apellidos: apellidos }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var count = data.d;
                        if (parseInt(count) > 0) {
                            alert("Alumno ya registrado");
                        } else {
                            // Alumno no registrado, enviar el formulario al servidor
                            __doPostBack('btnRegistrar', ''); // Llamada al método __doPostBack
                        }
                    },
                    error: function () {
                        alert("Error al verificar alumno.");
                    }
                });
            } else {
                alert("Por favor, complete todos los campos antes de registrarse.");
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Matriculas de laboratorio</h1>
            <div>
                <asp:Label ID="lblCUI" runat="server" Text=""></asp:Label>
            </div>
            <div>
                <asp:Label ID="lblUsuario" runat="server" Text=""></asp:Label>
            </div>
            <div>
                <asp:Label ID="lblCourseName" runat="server" Text="Course Name: Fundamento de la Computacion"></asp:Label>
            </div>
            <div class="result-container">
                <label>Nombres:</label>
                <asp:TextBox ID="lblNombres" runat="server" CssClass="result-textbox" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="result-container">
                <label>Apellidos:</label>
                <asp:TextBox ID="lblApellidos" runat="server" CssClass="result-textbox" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="result-container">
                <label>Grupo:</label>
                <asp:TextBox ID="lblGrupo" runat="server" CssClass="result-textbox" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="select-group-container">
                <label>Select Group:</label>
                <asp:DropDownList ID="ddlGroup" runat="server">
                    <asp:ListItem Text="Selecciona Grupo"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <asp:Button ID="btnHorario" runat="server" Text="Horarios" OnClick="btnVerHorario" CssClass="enviar-button" />
                <asp:Button ID="btnRegistrar" runat="server" Text="Registrarse" OnClientClick="Verificar();" OnClick="btnRegistrarAlumno" CssClass="enviar-button" />
            </div>
        </div>
    </form>
</body>
</html>
