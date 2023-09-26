/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/ServletRegistro")
public class ServletRegistro1 extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");

        String mensaje = "Registro exitoso de: " + nombres + " " + apellidos;

        response.setContentType("text/html");
        response.getWriter().println("<html><body>");
        response.getWriter().println("<h1>" + mensaje + "</h1>");
        response.getWriter().println("<p>Nombres: " + nombres + "</p>");
        response.getWriter().println("<p>Apellidos: " + apellidos + "</p>");
        response.getWriter().println("<p>Dirección: " + direccion + "</p>");
        response.getWriter().println("<p>Teléfono: " + telefono + "</p>");
        response.getWriter().println("</body></html>");
    }
}
