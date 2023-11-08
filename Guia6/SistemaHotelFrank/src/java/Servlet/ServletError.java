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
import java.io.PrintWriter;

@WebServlet(name = "ServletError", urlPatterns = {"/ServletError"})
public class ServletError extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Configura el tipo de contenido de la respuesta como HTML
        response.setContentType("text/html");

        // Obtiene la información sobre el error
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        String requestUri = (String) request.getAttribute("javax.servlet.error.request_uri");

        // Crea una página de error personalizada
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>Error</title></head>");
        out.println("<body>");
        out.println("<h1>Error</h1>");
        out.println("<p>Se ha producido un error con el código " + statusCode + " en la página " + requestUri + ".</p>");
        out.println("</body>");
        out.println("</html>");
    }
}
