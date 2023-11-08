<%-- 
    Document   : LoginJSP
    Created on : 30 oct 2023, 21:05:55
    Author     : OA
--%>

<!DOCTYPE html>
<html>
<head>
    <title>Hotel Frank - Inicio de Sesión</title>
    <meta charset="UTF-8">
    <link href="CSS/css4.css" rel="stylesheet" type="text/css"/>   
</head>
<body>
    <div>
        <h1>Hotel Frank</h1>
    </div>
    <div>
        <%-- Forma legible de imprimir la fecha usando Scriptlets --%>
        <%
            java.util.Date fechaActual = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
            String fechaActualLegible = sdf.format(fechaActual);
        %>
        <p>Fecha actual: <strong><%= fechaActualLegible %></strong></p>
    </div>
    <form method="POST" action="InicioSesion" id="formLogin">
        <div id="resultLogin"></div>
        <div><label>Usuario:</label></div>
        <div><input type="text" name="tfUsuario" id="idtfUsuario"></div>
        <div><label>Contraseña:</label></div>
        <div><input type="password" name="tfContrasenia" id="idtfContrasenia" ></div>
        <div><input type="submit" value="Iniciar Sesión"></div>
    </form>
</body>
</html>

