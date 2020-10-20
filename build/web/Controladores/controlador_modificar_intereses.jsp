<%-- 
    Document   : controlador_modificar_intereses
    Created on : 20-oct-2020, 13:47:33
    Author     : luis
--%>

<%@page import="Modelos.InteresesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar intereses</title>
    </head>
    <body>
        <%

            if (request.getParameter("modificar_preferencias") != null) {

                // Recojo los datos del formulario
                String busca = request.getParameter("busca");
                String tipoRelacion = request.getParameter("tipoRelacion");
                String hijos = request.getParameter("hijos");
                int artisticos = Integer.parseInt(request.getParameter("artisticos"));
                int deportivos = Integer.parseInt(request.getParameter("deportivos"));
                int politicos = Integer.parseInt(request.getParameter("politicos"));

                // Recupero el email de usuario para realizar la consulta
                String email = (String) session.getAttribute("emailUsuario");

                // Modifico los intereses enl a BDD
                InteresesDAO.actualizarIntereses(busca, tipoRelacion, hijos, artisticos, deportivos, politicos, email);

                // Redirijo a la página de nuevo
                response.sendRedirect("../Vistas/perfil.jsp");

            }

        %>
    </body>
</html>
