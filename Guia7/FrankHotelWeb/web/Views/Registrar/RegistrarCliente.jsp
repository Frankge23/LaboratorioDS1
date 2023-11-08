<%-- 
    Document   : RegistrarCliente
    Created on : 16 sept 2023, 18:39:18
    Author     : OA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../../wwwroot/css/css1.css" rel="stylesheet" type="text/css"/>
    <title>Formulario de Cliente</title>
</head>
<body>
    <div class="container">
        <form class="form" action="RegistrarClienteServlet" method="post"> <!-- Agregamos el atributo action con la URL del servlet -->
            <h1>Registro de Cliente</h1>
            <div class="form-group">
                <label for="nombres">Nombres:</label> <!-- Corregimos el atributo "for" para que coincida con el "id" del campo -->
                <input type="text" id="nombres" name="nombres" required>
            </div>
            <div class="form-group">
                <label for="apellidos">Apellidos:</label> <!-- Cambiamos el "id" a "apellidos" para evitar duplicados -->
                <input type="text" id="apellidos" name="apellidos" required>
            </div>
            <div class="form-group">
                <label for="direccion">Dirección:</label>
                <input type="text" id="direccion" name="direccion" required>
            </div>
            <div class="form-group">
                <label for="telefono">Teléfono:</label>
                <input type="tel" id="telefono" name="telefono" required>
            </div>
            <div class="form-group">
                <button type="submit">Registrar Cliente</button>
            </div>
        </form>
        <div class="mensaje">
            <p id="registroExitoso"></p> <!-- Aquí mostraremos el mensaje de registro exitoso -->
        </div>
    </div>
</body>
</html>
