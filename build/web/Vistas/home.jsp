<%-- 
    Document   : home
    Created on : 16-oct-2020, 9:22:11
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
        
        System.out.println(PersonaDAO.obtenerPersona("kherop@gmail.com").toString());
        
        %>
    </body>
</html>
