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
    

}
