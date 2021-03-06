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
 * Controla el acceso a la BDD de la clase mensajes
 *
 * @author luis
 */
public class MensajeDAO {

    // Atributo para coger la sentencia sql las sentencias SQL
    private static java.sql.Statement Sentencia_SQL;

    // Atributo para almacenar el resultado de la consulta SQL
    private static java.sql.ResultSet Resultado_SQL;

    // Atributo para preparar la sentencia SQL
    private static PreparedStatement SQL_Preparada;

    // Método para obtener todos los mensajes de la BDD
    public static LinkedList obtenerMensajes(String email) {

        // Declaro una LinkedList y un objeto mensaje para guardar y manejar el resultado de la consulta
        LinkedList mensajesBD = new LinkedList<>();
        Mensaje mensaje = null;

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();
            // Creo la consulta SQL, la ejecuto y la guardo
            Sentencia_SQL = ConexionEstatica.getSentencia_SQL();

            String sentencia = "SELECT * FROM mensajes WHERE idDestinatario = (SELECT idUsuario FROM usuarios where email = ?);";
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setString(1, email);
            // Ejecuto la sentencia SQL y la guardo
            Resultado_SQL = SQL_Preparada.executeQuery();

            // Si trae resultados voy creando personas y las añado al LinkedList
            while (Resultado_SQL.next()) {
                mensaje = new Mensaje(Resultado_SQL.getInt("idMensaje"),
                        Resultado_SQL.getInt("idRemitente"),
                        Resultado_SQL.getInt("idDestinatario"),
                        Resultado_SQL.getString("asunto"),
                        Resultado_SQL.getDate("fecha"),
                        Resultado_SQL.getString("cuerpo"),
                        Resultado_SQL.getInt("leido"));
                mensajesBD.add(mensaje);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConexionEstatica.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Cierro la conexión con la BDD y devuelvo los valores
        ConexionEstatica.cerrarBDD();
        return mensajesBD;
    }

    // Método para crear un nuevo mensaje idMensaje lo genera la BDD y la fecha pone la current_time, leido para a 0 y sin archivo
    public static void nuevoMensaje(int idRemitente, int idDestinatario, String asunto, String cuerpo) {

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();

            // Creo la consulta SQL, la ejecuto y la guardo
            String sentencia = "INSERT INTO mensajes (idRemitente, idDestinatario, asunto, cuerpo) VALUES (?, ?, ?, ?);";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setInt(1, idRemitente);
            SQL_Preparada.setInt(2, idDestinatario);
            SQL_Preparada.setString(3, asunto);
            SQL_Preparada.setString(4, cuerpo);

            // Ejecuto la sentencia
            SQL_Preparada.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ConexionEstatica.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Cierro la conexión con la BDD
        ConexionEstatica.cerrarBDD();
    }

    // Método para crear un nuevo mensaje idMensaje lo genera la BDD y la fecha pone la current_time, leido para a 0 y con archivo
    public static void nuevoMensaje(int idRemitente, int idDestinatario, String asunto, String cuerpo, String archivo) {

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();

            // Creo la consulta SQL, la ejecuto y la guardo
            String sentencia = "INSERT INTO mensajes (idRemitente, idDestinatario, asunto, cuerpo) VALUES (?, ?, ?, ?, ?);";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setInt(1, idRemitente);
            SQL_Preparada.setInt(2, idDestinatario);
            SQL_Preparada.setString(3, asunto);
            SQL_Preparada.setString(4, cuerpo);
            SQL_Preparada.setString(5, archivo);

            // Ejecuto la sentencia
            SQL_Preparada.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(MensajeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Cierro la conexión con la BDD
        ConexionEstatica.cerrarBDD();
    }

    // Método para buscar el idMensaje con la fecha mas reciente de ese remitente
    public static int obtenerID(int idRemitente) {
        int idMensaje = 0;

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();
            // Creo la consulta SQL, la ejecuto y la guardo
            String sentencia = "SELECT idMensaje FROM mensajes WHERE idRemitente = ? AND fecha = (SELECT MAX(fecha) FROM mensajes);";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setInt(1, idRemitente);

            // Ejecuto la sentencia SQL y la guardo
            Resultado_SQL = SQL_Preparada.executeQuery();

            // Si trae un resultado lo guardo en un objeto persona
            if (Resultado_SQL.next()) {
                idMensaje = Resultado_SQL.getInt("idMensaje");
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConexionEstatica.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Cierro la conexión con la BDD y devuelvo el valor
        ConexionEstatica.cerrarBDD();
        return idMensaje;
    }

}
