<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebAdministrador.aspx.cs" Inherits="MatriculasLaboratorio.WebAdministrador" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        /* Personaliza los estilos aquÃ­ si es necesario */
        .BoxLaboratorio {
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .borde-h2 {
            padding: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container">
        <h1 class="mt-5">Pagina Administrador</h1>
        <h2 class="mt-4 borde-h2">Inscritos en laboratorios:</h2>

        <div class="BoxLaboratorio row g-3">
            <asp:Label ID="label1" runat="server" CssClass="col-md-3 col-form-label">Laboratorio A:</asp:Label>
            <asp:Label ID="labA" runat="server" text="" CssClass="col-md-9"></asp:Label>
        </div>
        <div class="BoxLaboratorio row g-3">
            <asp:Label ID="label2" runat="server" CssClass="col-md-3 col-form-label">Laboratorio B:</asp:Label>
            <asp:Label ID="labB" runat="server" text="" CssClass="col-md-9"></asp:Label>
        </div>
        <div class="BoxLaboratorio row g-3">
            <asp:Label ID="label3" runat="server" CssClass="col-md-3 col-form-label">Laboratorio C:</asp:Label>
            <asp:Label ID="labC" runat="server" text="" CssClass="col-md-9"></asp:Label>
        </div>
        <div class="BoxLaboratorio row g-3">
            <asp:Label ID="label4" runat="server" CssClass="col-md-3 col-form-label">Laboratorio D:</asp:Label>
            <asp:Label ID="labD" runat="server" text="" CssClass="col-md-9"></asp:Label>
        </div>
    </form>
</body>
</html>
