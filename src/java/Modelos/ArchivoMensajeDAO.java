/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase para controlar el acceso a la BDD de la clase ArchivoMensaje
 *
 * @author luis
 */
public class ArchivoMensajeDAO {

    // Atributo para coger la sentencia sql las sentencias SQL
    private static java.sql.Statement Sentencia_SQL;

    // Atributo para almacenar el resultado de la consulta SQL
    private static java.sql.ResultSet Resultado_SQL;

    // Atributo para preparar la sentencia SQL
    private static PreparedStatement SQL_Preparada;

    // Método para insertar un nuevo archivo
    public static void nuevoArchivo(int idMensaje, String rutaArchivo) {

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();

            // Creo la consulta SQL, la ejecuto y la guardo
            String sentencia = "INSERT INTO archivosMensajes (idMensaje, rutaArchivo) VALUES (?, ?);";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setInt(1, idMensaje);
            SQL_Preparada.setString(2, rutaArchivo);

            // Ejecuto la sentencia
            SQL_Preparada.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ArchivoMensajeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Cierro la conexión con la BDD
        ConexionEstatica.cerrarBDD();
    }

    // Método para obtener archivos 
    public static ArchivoMensaje obtenerArchivo(int idMensaje) {
        ArchivoMensaje archivo = null;

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();
            // Creo la consulta SQL, la ejecuto y la guardo
            String sentencia = "SELECT * FROM archivosMensajes WHERE idMensaje = ?;";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setInt(1, idMensaje);

            // Ejecuto la sentencia SQL y la guardo
            Resultado_SQL = SQL_Preparada.executeQuery();

            // Si trae un resultado lo guardo en un objeto persona
            if (Resultado_SQL.next()) {
                archivo = new ArchivoMensaje(
                        Resultado_SQL.getInt("idArchivo"),
                        Resultado_SQL.getInt("idMensaje"),
                        Resultado_SQL.getString("rutaArchivo"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConexionEstatica.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Cierro la conexión con la BDD y devuelvo el valor
        ConexionEstatica.cerrarBDD();
        return archivo;
    }

}
