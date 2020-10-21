<%-- 
    Document   : controlador_admin
    Created on : 20-oct-2020, 23:26:35
    Author     : luis
--%>

<%@page import="Modelos.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%

            // Variables
            String nombre;
            String apellido;
            String genero;
            String email;
            String password;

            // Boton de modificar
            if (request.getParameter("modificar_admin") != null) {
                // Por medidas de segurida no recupero el password, entonces evaluo si el usuario 
                // introduce uno o no, por no pisar el suyo con un password vacio
                if (request.getParameter("password") == null) {
                    // Recojo los datos del formulario
                    nombre = request.getParameter("nombre");
                    apellido = request.getParameter("apellido");
                    genero = request.getParameter("genero");
                    email = request.getParameter("email");

                    // Modifico el objeto
                    PersonaDAO.actualizarPersonaSinPass(nombre, apellido, genero, email);

                    // Redirijo de nuevo a la vista de administrador
                    response.sendRedirect("../Vistas/administrar.jsp");
                } else {
                    // Recojo los datos del formulario
                    nombre = request.getParameter("nombre");
                    apellido = request.getParameter("apellido");
                    genero = request.getParameter("genero");
                    email = request.getParameter("email");
                    password = request.getParameter("password");

                    // Modifico el objeto
                    PersonaDAO.actualizarPersona(nombre, apellido, genero, email, password);
                    // Redirijo de nuevo a la vista de administrador
                    response.sendRedirect("../Vistas/administrar.jsp");
                }

            }

            // Boton de eliminar
            if (request.getParameter("eliminar_admin") != null) {
                email = request.getParameter("email");
                PersonaDAO.eliminarPersona(email);
                // Redirijo de nuevo a la vista de administrador
                response.sendRedirect("../Vistas/administrar.jsp");
            }

            // Boton de activar o desactivar
            if (request.getParameter("desactivar_admin") != null) {
                email = request.getParameter("email");
                int valor = 0;
                PersonaDAO.activarDesactivar(valor, email);
                // Redirijo de nuevo a la vista de administrador
                response.sendRedirect("../Vistas/administrar.jsp");
            }

            if (request.getParameter("activar_admin") != null) {
                email = request.getParameter("email");
                int valor = 1;
                PersonaDAO.activarDesactivar(valor, email);
                // Redirijo de nuevo a la vista de administrador
                response.sendRedirect("../Vistas/administrar.jsp");
            }
            

        %>


    </body>
</html>
