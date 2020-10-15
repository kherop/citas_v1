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
            Persona usuario;
            String tabla;
            String correo;
            String password;
            String rol;

            correo = request.getParameter("correo");
            usuario = PersonaDAO.obtenerPersona(correo);
            System.out.println(correo);
            System.out.println(usuario);
            
                        
            
            /*
            // Boton login
            if (request.getParameter("entrar_home") != null) { // Boton entrada
                // Recupero los datos del formulario
                correo = request.getParameter("correo");
                password = request.getParameter("password");

                // Intento recuperar la persona mediante el correo de la BDD
                usuario = (Persona) ConexionEstatica.obtenerPersona(correo);

                // La la persona es null redirijo a la pagina de fallo
                if (usuario == null) {
                    response.sendRedirect("../Vistas/fallo_login.jsp");
                }

                // Evaluo el login correcto
                if (ConexionEstatica.loginCorrecto(usuario, password)) {
                    // Evaluo el rol del usuario para redireccionarlo
                    rol = usuario.getRol();
                    if (rol.equals("usuario")) {
                        response.sendRedirect("../Vistas/panel_user.jsp");
                    } else {
                        response.sendRedirect("controlador_admin.jsp");
                    }

                } else {
                    response.sendRedirect("../Vistas/fallo_login.jsp");
                }

                // Guardo el correo y el rol del usuario en la sesion para tener una referencia
                session.setAttribute("correoUsuario", correo);
                // Recupero el rol
                String rolUsuario = ConexionEstatica.recuperarString(correo, "rol");
                session.setAttribute("rolUsuario", usuario.getRol());
            }
*/
        %>
    </body>
</html>
