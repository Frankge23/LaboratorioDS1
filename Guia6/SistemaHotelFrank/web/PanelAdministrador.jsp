<%-- 
    Document   : PanelAdministrador
    Created on : 30 oct 2023, 23:07:55
    Author     : OA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Panel del Administrador - Hotel Frank</title>
</head>
<body>
    <div><h1>Hotel Frank - Panel del Administrador</h1></div>
    
    <c:set var="usuario" value="${param.tfUsuario}" />
    <div><h3><strong>¡Bienvenido <c:out value="${usuario}" />!</strong></h3></div>

    <div>
        <%@include file="MenuAdministrador.jsp" %>
    </div>
    <div>            
        <%@include file="Footer.html" %>
    </div>  
</body>
</html>
