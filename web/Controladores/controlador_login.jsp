<%-- 
    Document   : controlador_login
    Created on : 13-oct-2020, 11:35:19
    Author     : luis
--%>

<%@page import="Auxiliar.VerificarRecaptcha"%>
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

                //Obtenemos el valor de g-recaptcha-response del reCaptcha
                String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
                System.out.println(gRecaptchaResponse);

                //Verificamos los datos del captcha con la URL de Google
                boolean verificado = VerificarRecaptcha.verificar(gRecaptchaResponse);

                System.out.println("captcha: " + verificado);
                String errorMessage = "";

                // Evaluo login
                if (!PersonaDAO.login(email, password)) {
                    // Si la consulta viene vacia
                    response.sendRedirect("../Vistas/error_login.jsp");
                } else {

                    if (verificado) {
                        // Evaluo si el usuario esta activo o no
                        if (PersonaDAO.usuarioActivado(email)) {
                            // Si esta activo guardo el email en la sesion y lo redirijo al homr
                            session.setAttribute("emailUsuario", email);

                            // Preparo la compatibilidad del usuario con todos y lo guardo en la sesion
                            Map<Integer, Integer> puntuacion = InteresesDAO.compatibilidad(email);
                            session.setAttribute("puntuacion", puntuacion);

                            response.sendRedirect("../Vistas/home.jsp");
                        } else {
                            // Si no esta activo lo redirijo a la pagina
                            response.sendRedirect("../Vistas/no_activo.jsp");
                        }
                    } else {
                        if (verificado) {
                            errorMessage = "Usuario y/o password incorrectos";
                        } else {
                            errorMessage = "Captcha no válido";
                        }
                        session.setAttribute("errorMessage", errorMessage);
                        response.sendRedirect("login.jsp");
                    }

                }
            }

        %>
    </body>
</html>
