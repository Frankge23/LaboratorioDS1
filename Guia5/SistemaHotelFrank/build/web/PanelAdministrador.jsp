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
    
    <div>
        <%
            String usuario = request.getParameter("tfUsuario");
            if (usuario != null) {
        %>
        <%-- <h2><strong>Bienvenido, <%= usuario %> !</strong></h2>--%>
        <%
            }
        %>
    </div>

  <%--  <div><h3>Menú de opciones</h3></div>--%>
    <div>
        <%@include file="MenuAdministrador.jsp" %>
    </div>
    <div>            
        <%@include file="Footer.html" %>
    </div>
</body>
</html>
