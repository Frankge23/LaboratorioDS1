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
import jakarta.servlet.jsp.JspWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "RegistrarClienteServlet", urlPatterns = {"/RegistrarClienteServlet"})
public class RegistrarClienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");

        
        String jdbcURL = "jdbc:sqlserver://localhost:1433;databaseName=HotelFrank;encrypt=true;trustServerCertificate=true;";
        String dbUser = "sa";
        String dbPassword = "admin";

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            
            String insertSQL = "INSERT INTO Clientes (Nombres, Apellidos, Direccion, Telefono) VALUES (?, ?, ?, ?)";
            PreparedStatement insertStmt = con.prepareStatement(insertSQL);
            insertStmt.setString(1, nombres);
            insertStmt.setString(2, apellidos);
            insertStmt.setString(3, direccion);
            insertStmt.setString(4, telefono);
            insertStmt.executeUpdate();
            insertStmt.close();

            
            String selectSQL = "SELECT Nombres, Apellidos, Direccion, Telefono FROM Clientes";
            PreparedStatement selectStmt = con.prepareStatement(selectSQL);
            ResultSet resultSet = selectStmt.executeQuery();

            out.println("Registro exitoso de cliente.");

            
            out.println("<table border='1'>");
            out.println("<tr>");
            out.println("<th>Nombres</th>");
            out.println("<th>Apellidos</th>");
            out.println("<th>Dirección</th>");
            out.println("<th>Teléfono</th>");
            out.println("</tr>");

            while (resultSet.next()) {
                out.println("<tr>");
                out.println("<td>" + resultSet.getString("Nombres") + "</td>");
                out.println("<td>" + resultSet.getString("Apellidos") + "</td>");
                out.println("<td>" + resultSet.getString("Direccion") + "</td>");
                out.println("<td>" + resultSet.getString("Telefono") + "</td>");
                out.println("</tr>");
            }

            out.println("</table");

           
            resultSet.close();
            selectStmt.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            out.println("Error: " + e.getMessage());
        }
    }
}
