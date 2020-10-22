<%-- 
    Document   : controlador_login
    Created on : 13-oct-2020, 11:35:19
    Author     : luis
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="Modelos.Intereses"%>
<%@page import="Modelos.InteresesDAO"%>
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

            if (request.getParameter("entrar_login") != null) {
                // Creo variables de sesion
                String email;
                String password;

                // Recupero el correo y el password
                email = request.getParameter("email");
                password = request.getParameter("password");

                // Evaluo login
                if (!PersonaDAO.login(email, password)) {
                    // Si la consulta viene vacia
                    response.sendRedirect("../Vistas/error_login.jsp");
                } else {

                    // Evaluo si el usuario esta activo o no
                    if (PersonaDAO.usuarioActivado(email)) {
                        // Si esta activo guardo el email en la sesion y lo redirijo al homr
                        session.setAttribute("emailUsuario", email);
                        
                        // Preparo la compatibilidad del usuario con todos
                        Map<Integer, Integer> puntuacion = InteresesDAO.compatibilidad(email);
                        
                        response.sendRedirect("../Vistas/home.jsp");
                    } else {
                        // Si no esta activo lo redirijo a la pagina
                        response.sendRedirect("../Vistas/no_activo.jsp");
                    }
                }
            }

        %>
    </body>
</html>
