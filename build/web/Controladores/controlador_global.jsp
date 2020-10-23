<%-- 
    Document   : controlador_global
    Created on : 21-oct-2020, 12:41:57
    Author     : luis
--%>

<%@page import="Modelos.PersonaDAO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Map"%>
<%@page import="Modelos.InteresesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controlador amigos</title>
    </head>
    <body>
        llega
        <%

            // Recupero el email de correo de la sesion
            String email = (String) session.getAttribute("emailUsuario");
            
            // Recupero el id del usario
            int idUsuario = PersonaDAO.obtenerID(email);

            // Boton lateral de home con opc = 1
            if (request.getParameter("opc").equals("1")) {
                // Recargo compatibilidad por si algún usuario a modificado su perfil
                Map<Integer, Integer> puntuacion = InteresesDAO.compatibilidad(email);
                session.setAttribute("puntuacion", puntuacion);
                // Lo redirijo al home
                response.sendRedirect("../Vistas/home.jsp");
            }

            if (request.getParameter("opc").equals("2")) {

                // Elimino al usuario de los usuarios conectados antes de salir
                LinkedList usGlobales = (LinkedList) application.getAttribute("usGlobales");
                
                for (Object usGlobale : usGlobales) {
                        if(idUsuario == (int)usGlobale) {
                            usGlobales.remove(usGlobale);
                        }
                    }
                session.invalidate();
                response.sendRedirect("../index.jsp");
            }

        %>

    </body>
</html>
