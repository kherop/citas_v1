<%-- 
    Document   : controlador_enviar_mensaje
    Created on : 23-oct-2020, 12:24:25
    Author     : luis
--%>

<%@page import="Modelos.ArchivoMensajeDAO"%>
<%@page import="Modelos.PersonaDAO"%>
<%@page import="Modelos.MensajeDAO"%>
<%@page import="java.io.File"%>
<%@page import="Auxiliar.Constantes"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            // Guardo todos los datos del formulario para luego pasarselos a la consulta
            LinkedList<String> datosMensajes = new LinkedList();

            // Recuperamos todos los campos que nos vengan del formulario
            List items = upload.parseRequest(request);

            // Variable para saber si no hay archivo, para saber que contructor y el tipo de consulta que debo hacer
            boolean archivoCarga = false;

            // Se recorren todos los items, que son de tipo FileItem
            for (Object item : items) {
                FileItem campo = (FileItem) item;

                // Hay que comprobar si es un campo de formulario. Si no lo es, se guarda el fichero
                // subido donde nos interese.
                if (!campo.isFormField()) {

                    // Controlo si es usuario no introduce imagen propia, en ese caso pongo una
                    if (campo.getName().isEmpty()) {
                        archivoCarga = false;
                    } else {
                        // Si es un fichero, guardamos la imagen en la ruta del servidor
                        // Pero antes le cambio el nombre mediante la fecha para hacerla unica
                        Calendar cal = Calendar.getInstance();
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss-mm");
                        String nuevoNombre = (dateFormat.format(cal.getTime()) + campo.getName()).replace(" ", "");

                        // Se crea el archivo y se guarda en el directorio
                        File fichero = new File(Constantes.rutaArchivos, nuevoNombre);
                        campo.write(fichero);

                        // Guardo el nombre en los datos del usuarios
                        datosMensajes.add(nuevoNombre);

                        archivoCarga = true;
                    }
                } else {
                    //Si es un campo de formulario (no fichero) extraemos su valor de la siguiente manera.
                    // Para obtener clave y valor de los campos formulario.
                    String key = campo.getFieldName();
                    String valor = campo.getString();
                    // Guardo el valor en el LinkedList
                    datosMensajes.add(valor);
                }
            }

            // Preparado los datos del formulario
            String asunto = datosMensajes.get(0);
            String cuerpo = datosMensajes.get(1);
            String archivo = datosMensajes.get(2);

            // Recupero los datos de los usuarios
            String email = (String) session.getAttribute("emailUsuario");
            int idRemitente = PersonaDAO.obtenerID(email);
            int idDestinatario = (int) session.getAttribute("idDestinatario");

            // Ejecuto unas instrucciones u otras en funcion si ha cargado un archivo
            if (!archivoCarga) {
                // Guardo el nuevo mensaje en la BDD sin archivo
                MensajeDAO.nuevoMensaje(idRemitente, idDestinatario, asunto, cuerpo);
            } else {
                MensajeDAO.nuevoMensaje(idRemitente, idDestinatario, asunto, cuerpo);
                int idMensaje = MensajeDAO.obtenerID(idRemitente);
                ArchivoMensajeDAO.nuevoArchivo(idMensaje, archivo);
            }
        %>
    </body>
</html>
