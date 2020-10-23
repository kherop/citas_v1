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
    public static LinkedList obtenerPersonas() {

        // Declaro una LinkedList y un objeto mensaje para guardar y manejar el resultado de la consulta
        LinkedList mensajesBD = new LinkedList<>();
        Mensaje mensaje = null;

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();
            // Creo la consulta SQL, la ejecuto y la guardo
            Sentencia_SQL = ConexionEstatica.getSentencia_SQL();
            String sentencia = "SELECT * FROM mensajes WHERE idDestinatario = (SELECT idUsuario FROM usuarios where email = ?);";
            Resultado_SQL = Sentencia_SQL.executeQuery(sentencia);

            // Si trae resultados voy creando personas y las añado al LinkedList
            while (Resultado_SQL.next()) {
                mensaje = new Mensaje(Resultado_SQL.getInt("idMensaje"),
                        Resultado_SQL.getInt("idDestinatario"),
                        Resultado_SQL.getInt("idReceptor"),
                        Resultado_SQL.getString("asunto"),
                        Resultado_SQL.getDate("fecha"),
                        Resultado_SQL.getString("cuerpo"),
                        Resultado_SQL.getString("archivo"),
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
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Cierro la conexión con la BDD
        ConexionEstatica.cerrarBDD();
    }
    
}
