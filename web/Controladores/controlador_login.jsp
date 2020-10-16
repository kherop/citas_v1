<%-- 
    Document   : controlador_login
    Created on : 13-oct-2020, 11:35:19
    Author     : luis
--%>

<%@page import="Modelos.ConexionEstatica"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelos.ConexionEstatica"%>
<%@page import="Modelos.PersonaDAO"%>
<%@page import="Modelos.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controlador login</title>
    </head>
    <body>

        <%
            // Creo variables de sesion
            String tabla;
            String email;
            String password;

            if (request.getParameter("entrar_login") != null) {
                // Recupero el correo y el password
                email = request.getParameter("email");
                password = request.getParameter("password");

                // Evaluo login
                if (PersonaDAO.login(email, password) == null) {
                    response.sendRedirect("Vistas/error_login.jsp");
                } else {
                    response.sendRedirect("Vista/home.jsp");
                }
            }


        %>
    </body>
</html>
