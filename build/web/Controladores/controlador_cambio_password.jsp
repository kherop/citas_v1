<%-- 
    Document   : controlador_cambio_password
    Created on : 13-oct-2020, 11:36:19
    Author     : luis
--%>

<%@page import="Modelos.EnviarCorreo"%>
<%@page import="Modelos.Persona"%>
<%@page import="Modelos.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controlador cambio contraseña</title>
    </head>
    <body>
        cambio
        <%

            // Recupero el valor del correo del formulario
            String email;

            if (request.getParameter("recuperar_password") != null) {
                email = request.getParameter("email");

                if (PersonaDAO.obtenerPersona(email) != null) {
                    // Genero una nueva contraseña
                    String nuevoPass = Persona.nuevoPass();

                    // La modificamos en la BDD
                    PersonaDAO.cambiarPass(nuevoPass, email);

                    // Notificamos al usuario
                    String mensaje = "Hola, tu nueva contraseña es: " + nuevoPass;
                    String subject = "Contraseña modificada";
                    EnviarCorreo.send(email, subject, mensaje);
                }
                response.sendRedirect("../Vistas/exito_cambio_password.jsp");
            }

        %>
    </body>
</html>
