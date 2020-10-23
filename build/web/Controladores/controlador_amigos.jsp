<%-- 
    Document   : controlador_amigos
    Created on : 22-oct-2020, 13:00:18
    Author     : luis
--%>

<%@page import="Modelos.PersonaDAO"%>
<%@page import="Modelos.AmigoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%

            // Recupero el email de usuario de la sesion
            if (request.getParameter("me_gusta_tarjeta") != null) {
                // Recuperos los id de los involucrados y lanzo la solicitud
                String email = (String) session.getAttribute("emailUsuario");
                int idEmisor = PersonaDAO.obtenerID(email);
                int idReceptor = Integer.parseInt((String) request.getParameter("idUsuario"));
                String estado = "esperando";
                AmigoDAO.nuevaSolicitudAmistad(idEmisor, idReceptor, estado);

                // Redirecciono a la pagina home
                response.sendRedirect("../Vistas/home.jsp");
            }

            // Aceptar invitacion de amigo
            if (request.getParameter("aceptar_amistad") != null) {
                int idEmisor = Integer.parseInt(request.getParameter("idUsuario"));
                AmigoDAO.aceptarAmistad(idEmisor);

                // Redirecciono a la pagina home
                response.sendRedirect("../Vistas/home.jsp");
            }

            // Elimino amistad
            if (request.getParameter("eliminar_amistad") != null) {
                String email = (String) session.getAttribute("emailUsuario");
                int idUno = PersonaDAO.obtenerID(email);
                int idDos = Integer.parseInt(request.getParameter("idUsuario"));
                AmigoDAO.eliminarAmistad(idUno, idDos);
                // Redirecciono a la pagina home
                response.sendRedirect("../Vistas/amigos.jsp");
            }

        %>

    </body>
</html>
