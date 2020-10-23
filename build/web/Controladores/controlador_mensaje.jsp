<%-- 
    Document   : controlador_mensajes
    Created on : 23-oct-2020, 9:36:20
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            if (request.getParameter("mensaje_tarjeta") != null) {
                // Recupero el id del destinatario y lo guardo en la sesion
                int idDestinatario = Integer.parseInt(request.getParameter("idUsuario"));
                session.setAttribute("idDestinatario", idDestinatario);
                // Lo redirijo a la página para enviar el nuevo usuario
                response.sendRedirect("../Vistas/mensaje.jsp");
            }
        %>

    </body>
</html>
