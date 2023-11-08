<%-- 
    Document   : LoginJSP
    Created on : 30 oct 2023, 21:05:55
    Author     : OA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Hotel Frank</title>
    <link href="CSS/css4.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form method="POST" action="/SistemaHotelFrank/InicioSesion" id="formLogin">
        <div id="resultLogin"></div>    
        <div><h1>Hotel Frank - Inicio de Sesión</h1></div>           
        <div><label>Fecha actual: <%= new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(new java.util.Date()) %></label></div><br>
        <div><label>Usuario:</label></div>            
        <div><input type="text" name="username" id="idtfUsuario"></div><br>
        <div><label>Contraseña:</label></div>
        <div><input type="password" name="password" id="idtfContrasenia" ></div><br>
        <div><input type="submit" value="Iniciar sesión"></div>
    </form>    
</body>
</html>




