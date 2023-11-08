<%-- 
    Document   : indexForm
    Created on : 17 sept 2023, 18:00:25
    Author     : OA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <title>Formulario de Cliente</title>
    </head>
    <body>
       <form action="ProcesoServlet" method="post">
            <label>Nombres</label>
            <input type="text" name="nombres">
            <br>
            <label>Apellidos</label>
            <input type="text" name="apellidos">
            <br>
            <label>Direccion</label>
            <input type="text" name="direccion">
            <br>
            <label>Telefono</label>
            <input type="text" name="telefono">
            <br>
            <input type="submit" value="Registrar">
        </form>
    </body>
</html>
