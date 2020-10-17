/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.PreparedStatement;

/**
 * Clase para controlar el acceso a la BDD de la clase Persona
 * -----------------------------------------------------------
 *
 * @author Luis Quesada
 * @version 1.0
 */
public class PersonaDAO {

    // Atributo para coger la sentencia sql las sentencias SQL
    private static java.sql.Statement Sentencia_SQL;

    // Atributo para almacenar el resultado de la consulta SQL
    private static java.sql.ResultSet Resultado_SQL;

    // Atributo para preparar la sentencia SQL
    private static PreparedStatement SQL_Preparada;

    // Método para obtener todos los registros de la BDD
    public static LinkedList obtenerPersonas() {

        // Declaro una LinkedList y un objeto persona para guardar y manejar el resultado de la consulta
        LinkedList personasBD = new LinkedList<>();
        Persona persona = null;

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();
            // Creo la consulta SQL, la ejecuto y la guardo
            Sentencia_SQL = ConexionEstatica.getSentencia_SQL();
            String sentencia = "SELECT * FROM usuarios;";
            Resultado_SQL = Sentencia_SQL.executeQuery(sentencia);

            // Si trae resultados voy creando personas y las añado al LinkedList
            while (Resultado_SQL.next()) {
                persona = new Persona(Resultado_SQL.getInt("idUsuario"),
                        Resultado_SQL.getString("nombre"),
                        Resultado_SQL.getString("apellido"),
                        Resultado_SQL.getString("sexo"),
                        Resultado_SQL.getString("email"),
                        Resultado_SQL.getString("password"),
                        Resultado_SQL.getString("img_perfil"),
                        Resultado_SQL.getInt("activado"));
                personasBD.add(persona);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConexionEstatica.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Cierro la conexión con la BDD y devuelvo los valores
        ConexionEstatica.cerrarBDD();
        return personasBD;
    }

    // Método para comprabar si existe una persona pasandole el email
    public static Persona obtenerPersona(String email) {
        Persona persona = null;

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();
            // Creo la consulta SQL, la ejecuto y la guardo
            String sentencia = "SELECT * FROM usuarios WHERE email = ?;";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setString(1, email);

            // Ejecuto la sentencia SQL y la guardo
            Resultado_SQL = SQL_Preparada.executeQuery();

            // Si trae un resultado lo guardo en un objeto persona
            if (Resultado_SQL.next()) {
                persona = new Persona(Resultado_SQL.getInt("idUsuario"),
                        Resultado_SQL.getString("nombre"),
                        Resultado_SQL.getString("apellido"),
                        Resultado_SQL.getString("sexo"),
                        Resultado_SQL.getString("email"),
                        Resultado_SQL.getString("password"),
                        Resultado_SQL.getString("img_perfil"),
                        Resultado_SQL.getInt("activado"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConexionEstatica.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Cierro la conexión con la BDD y devuelvo el valor
        ConexionEstatica.cerrarBDD();
        return persona;
    }

    // Metodo para comprobar el login con el email y la contraseña
    public static boolean login(String email, String password) {
        boolean existe = false;

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();
            // Creo la consulta SQL, la ejecuto y la guardo
            String sentencia = "SELECT * FROM usuarios WHERE email = ? AND password = ?;";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setString(1, email);
            SQL_Preparada.setString(2, password);

            // Ejecuto la sentencia SQL y la guardo
            Resultado_SQL = SQL_Preparada.executeQuery();

            // Si
            if (Resultado_SQL.absolute(1)) {
                existe = true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConexionEstatica.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Cierro la conexión con la BDD y devuelvo el valor
        ConexionEstatica.cerrarBDD();
        return existe;
    }

    // Método para cambiar la contraseña
    public static void cambiarPass(String password, String email) {

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();

            // Creo la consulta SQL, la ejecuto y la guardo
            String sentencia = "UPDATE usuarios SET password = ? WHERE email = ?;";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setString(1, password);
            SQL_Preparada.setString(2, email);

            // Ejecuto la sentencia
            SQL_Preparada.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Cierro la conexión con la BDD
        ConexionEstatica.cerrarBDD();
    }

}
