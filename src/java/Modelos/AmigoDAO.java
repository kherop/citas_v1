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
 * Clase para controlar el acceso a la BDD de la clase amigo
 * ----------------------------------------------------------
 *
 * @author Luis Quesada
 */
public class AmigoDAO {

    // Atributo para coger la sentencia sql las sentencias SQL
    private static java.sql.Statement Sentencia_SQL;

    // Atributo para almacenar el resultado de la consulta SQL
    private static java.sql.ResultSet Resultado_SQL;

    // Atributo para preparar la sentencia SQL
    private static PreparedStatement SQL_Preparada;

    // Método para enviar una amistad
    public static void nuevaSolicitudAmistad(int idEmisor, int idReceptor, String estado) {
        Persona persona = null;

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();
            // Creo la consulta SQL, la ejecuto y la guardo
            String sentencia = "INSERT INTO amigos (idEmisor, idReceptor, estado) VALUES(?, ?, ?);";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setInt(1, idEmisor);
            SQL_Preparada.setInt(2, idReceptor);
            SQL_Preparada.setString(3, estado);

            // Ejecuto la sentencia SQL y la guardo
            SQL_Preparada.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ConexionEstatica.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Cierro la conexión con la BDD y devuelvo el valor
        ConexionEstatica.cerrarBDD();
    }

    // Método para ver las amistades enviadas y pendientes de aceptar
    public static LinkedList amistadesEnviadas(String email) {
        LinkedList usuariosBD = new LinkedList<>();
        int usuario;

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();

            // Creo la consulta SQL, la ejecuto y la guardo
            String sentencia = "SELECT idReceptor FROM amigos WHERE idEmisor = (SELECT idUsuario FROM usuarios WHERE email = ?) AND estado = 'esperando';";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setString(1, email);

            // Ejecuto la sentencia SQL y la guardo
            Resultado_SQL = SQL_Preparada.executeQuery();

            // Si trae un resultado lo guardo en un objeto persona
            while (Resultado_SQL.next()) {
                usuario = Resultado_SQL.getInt("idReceptor");
                usuariosBD.add(usuario);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConexionEstatica.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Cierro la conexión con la BDD y devuelvo los valores
        ConexionEstatica.cerrarBDD();

        return usuariosBD;
    }

    // Método para ver las amistades recibidas
    public static LinkedList amistadesRecibidas(String email) {
        LinkedList usuarioBD = new LinkedList<>();
        int usuario;

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();

            // Creo la consulta SQL, la ejecuto y la guardo
            String sentencia = "SELECT idEmisor FROM amigos WHERE idReceptor = (SELECT idUsuario FROM usuarios WHERE email = ?) AND estado = 'esperando';";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setString(1, email);

            // Ejecuto la sentencia SQL y la guardo
            Resultado_SQL = SQL_Preparada.executeQuery();

            // Si trae un resultado lo guardo en un objeto persona
            while (Resultado_SQL.next()) {
                usuario = Resultado_SQL.getInt("idEmisor");
                usuarioBD.add(usuario);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConexionEstatica.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Cierro la conexión con la BDD y devuelvo los valores
        ConexionEstatica.cerrarBDD();

        return usuarioBD;
    }

    // Método para aceptar amistad
    public static void aceptarAmistad(int idEmisor) {

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();

            // Creo la consulta SQL, la ejecuto y la guardo
            String sentencia = "UPDATE amigos SET estado = 'aceptada' WHERE idEmisor = ?;";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setInt(1, idEmisor);

            // Ejecuto la sentencia
            SQL_Preparada.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Cierro la conexión con la BDD
        ConexionEstatica.cerrarBDD();
    }

    // Método para ver las amistades recibidas
    public static LinkedList amistadesAceptadas(String email) {
        LinkedList usuarioBD = new LinkedList<>();
        int usuario;

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();

            // Creo la consulta SQL, esta consulta guarda las solicitudes que ha enviado
            // el usuario y estan aceptadas, guardo los receptores de esas amistadas
            String sentencia = "SELECT idReceptor FROM amigos WHERE idEmisor = (SELECT idUsuario FROM usuarios WHERE email = ?) AND estado = 'aceptada';";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setString(1, email);

            // Ejecuto la sentencia SQL y la guardo
            Resultado_SQL = SQL_Preparada.executeQuery();

            // Si trae un resultado lo guardo en un objeto persona
            while (Resultado_SQL.next()) {
                usuario = Resultado_SQL.getInt("idEmisor");
                usuarioBD.add(usuario);
            }

            // Creo la segunda consulta SQL, esta son las que el esta
            // como receptor y han sido aceptadas, es decir guardo los emisores aceptadas
            sentencia = "SELECT idEmisor FROM amigos WHERE idReceptor = (SELECT idUsuario FROM usuarios WHERE email = ?) AND estado = 'aceptada';";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setString(1, email);

            // Ejecuto la sentencia SQL y la guardo
            Resultado_SQL = SQL_Preparada.executeQuery();

            // Si trae un resultado lo guardo en un objeto persona
            while (Resultado_SQL.next()) {
                usuario = Resultado_SQL.getInt("idEmisor");
                usuarioBD.add(usuario);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConexionEstatica.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Cierro la conexión con la BDD y devuelvo los valores
        ConexionEstatica.cerrarBDD();

        return usuarioBD;
    }

    // Método para eliminar amistad
    public static void eliminarAmistad(int idUno, int idDos) {
        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();

            // Creo la consulta SQL, la ejecuto para eliminar de la tabla usuarios
            String sentencia = "DELETE FROM `amigos` WHERE (idEmisor = ? AND idReceptor = ?) OR (idEmisor = ? AND idReceptor = ?);";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setInt(1, idUno);
            SQL_Preparada.setInt(2, idDos);
            SQL_Preparada.setInt(3, idDos);
            SQL_Preparada.setInt(4, idUno);

            // Ejecuto la sentencia
            SQL_Preparada.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Cierro la conexión con la BDD
        ConexionEstatica.cerrarBDD();
    }

}
