/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Clase para controlar el acceso a la BDD de la clase intereses
 * -------------------------------------------------------------
 *
 * @author Luis Quesada Romero
 * @version 1.0
 */
public class InteresesDAO {

    // Atributo para coger la sentencia sql las sentencias SQL
    private static java.sql.Statement Sentencia_SQL;

    // Atributo para almacenar el resultado de la consulta SQL
    private static java.sql.ResultSet Resultado_SQL;

    // Atributo para preparar la sentencia SQL
    private static PreparedStatement SQL_Preparada;

    // Método para crear un nuevo grupo de intereses con una subconsulta para
    // obtener el idUsuario mediante el email
    public static void nuevosIntereses(String email, String busca, String tipoRelacion, String hijos, int artisticos, int deportivos, int politicos) {
        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();

            // Creo la consulta SQL, la ejecuto y la guardo
            String sentencia = "INSERT INTO preferencias (idUsuario, busca, tipoRelacion, hijos, artisticos, deportivos, politicos)"
                    + " VALUES((SELECT idUsuario FROM usuarios WHERE email = ?), ?, ?, ?, ?, ?, ?);";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setString(1, email);
            SQL_Preparada.setString(2, busca);
            SQL_Preparada.setString(3, tipoRelacion);
            SQL_Preparada.setString(4, hijos);
            SQL_Preparada.setInt(5, artisticos);
            SQL_Preparada.setInt(6, deportivos);
            SQL_Preparada.setInt(7, politicos);

            // Ejecuto la sentencia
            SQL_Preparada.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Cierro la conexión con la BDD
        ConexionEstatica.cerrarBDD();
    }

    // Método para recuperar los intereses de un usuario de la BDD
    public static Intereses obtenerIntereses(String email) {
        Intereses intereses = null;

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();
            // Creo la consulta SQL, la ejecuto y la guardo
            String sentencia = "SELECT * FROM preferencias WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE email = ?);";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setString(1, email);

            // Ejecuto la sentencia SQL y la guardo
            Resultado_SQL = SQL_Preparada.executeQuery();

            // Si trae un resultado lo guardo en un objeto persona
            if (Resultado_SQL.next()) {
                intereses = new Intereses(Resultado_SQL.getInt("idPreferencias"),
                        Resultado_SQL.getInt("idUsuario"),
                        Resultado_SQL.getString("busca"),
                        Resultado_SQL.getString("tipoRelacion"),
                        Resultado_SQL.getString("hijos"),
                        Resultado_SQL.getInt("artisticos"),
                        Resultado_SQL.getInt("deportivos"),
                        Resultado_SQL.getInt("politicos"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConexionEstatica.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Cierro la conexión con la BDD y devuelvo el valor
        ConexionEstatica.cerrarBDD();
        return intereses;
    }

    // Método para actualizar intereses
    public static void actualizarIntereses(String busca, String tipoRelacion, String hijos, int artisticos, int deportivos, int politicos, String email) {
        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();

            // Creo la consulta SQL, la ejecuto y la guardo
            String sentencia = "UPDATE preferencias SET busca = ?, tipoRelacion = ?, hijos = ?, artisticos = ?, deportivos = ?, politicos = ? WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE email = ?);";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setString(1, busca);
            SQL_Preparada.setString(2, tipoRelacion);
            SQL_Preparada.setString(3, hijos);
            SQL_Preparada.setInt(4, artisticos);
            SQL_Preparada.setInt(5, deportivos);
            SQL_Preparada.setInt(6, politicos);
            SQL_Preparada.setString(7, email);

            // Ejecuto la sentencia
            SQL_Preparada.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Cierro la conexión con la BDD
        ConexionEstatica.cerrarBDD();
    }

    // Método para obtener todos los intereses de los usuarios
    public static LinkedList obtenerTodosIntereses() {
        // Declaro una LinkedList y un objeto intereses para guardar y manejar el resultado de la consulta
        LinkedList interesesBD = new LinkedList<>();
        Intereses intereses = null;

        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();
            // Creo la consulta SQL, la ejecuto y la guardo
            Sentencia_SQL = ConexionEstatica.getSentencia_SQL();
            String sentencia = "SELECT * FROM preferencias;";
            Resultado_SQL = Sentencia_SQL.executeQuery(sentencia);

            // Si trae resultados voy creando personas y las añado al LinkedList
            while (Resultado_SQL.next()) {
                intereses = new Intereses(Resultado_SQL.getInt("idPreferencias"),
                        Resultado_SQL.getInt("idUsuario"),
                        Resultado_SQL.getString("busca"),
                        Resultado_SQL.getString("tipoRelacion"),
                        Resultado_SQL.getString("hijos"),
                        Resultado_SQL.getInt("artisticos"),
                        Resultado_SQL.getInt("deportivos"),
                        Resultado_SQL.getInt("politicos"));
                interesesBD.add(intereses);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConexionEstatica.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Cierro la conexión con la BDD y devuelvo los valores
        ConexionEstatica.cerrarBDD();
        return interesesBD;
    }

    // Método para eliminar persona
    public static void eliminarIntereses(String email) {
        try {
            // Creo una conexion
            ConexionEstatica.nuevaConexion();

            // Creo la consulta SQL, la ejecuto para eliminar de la tabla usuarios
            String sentencia = "DELETE FROM preferencias WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE email = ?);";

            // Preparo la sentencia SQL
            SQL_Preparada = ConexionEstatica.getConexion().prepareStatement(sentencia);
            SQL_Preparada.setString(1, email);

            // Ejecuto la sentencia
            SQL_Preparada.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Cierro la conexión con la BDD
        ConexionEstatica.cerrarBDD();
    }

    // Método para comprobar la compatibilidad de un usuario con todos los registrados.
    /*
    Este algoritmo es muy sencillo, se basa en la diferencia, primero voy a comparar el tipo de relacion
    e hijos, si coinciden en estos aspectos su diferencia sera 0 y si no coinciden sera 1, en esta 
    parte se puede sacar hasta 2 putos de diferencia.
    Los gustos o lo que busca, es decir, chico, chica no lo evaluo eso seria mas bien un filtro para ver
    lo que se muestra o no.
    La segunda parte es la importancia en deporte, arte y politica, aqui cada usuario pone un valor entre
    0 y 10, por lo tanto calcularemos la diferencia entre los usuarios, asi si un usuario tiene un 8 y otro
    un 6 su diferencia es de 2.
    Se van sumando todas las diferencias y al final nos dara un numero que cuando mas cercano sea al 0 mas
    compatible seran los usuarios.
    No voy a filtrar entre chicos que buscan chica, que buscan chicos, etc, etc, voy a enfocarlo a amistad
    y luego como en las tarjeta que ve el usuario se ven todos los datos que ya decida él que quiere hacer.
     */
    public static Map compatibilidad(String email) {
        // Creo un HashMap para guardar los datos
        Map<Integer, Integer> puntuacion = new HashMap<Integer, Integer>();
        TreeMap<Integer, Integer> ordenada = new TreeMap<>();

        // Recupero todos los intereses de los usuarios
        LinkedList<Intereses> interesesBD = InteresesDAO.obtenerTodosIntereses();

        // Recupero los intereses del usuario
        Intereses interesUsuario = InteresesDAO.obtenerIntereses(email);

        // Recorro el LinkedList de todos los usuarios para ir viendo la compatilidad
        for (Intereses interesesAux : interesesBD) {
            System.out.println(interesesBD);
            int resultado = 0; // Guardo la puntuacion total
            // Evaluo tipo de relacion, sino quieren lo mismo sumo 1
            if (!interesUsuario.getTipoRelacion().equals(interesesAux.getTipoRelacion())) {
                resultado += 1;
            }

            // Evaluo los hijos
            switch (interesUsuario.getHijos()) {
                case "si":
                    // Solo se llevara mal con quien no quiera hijos
                    if (interesesAux.getHijos().equals("no")) {
                        resultado += 1;
                    }
                    break;
                case "no":
                    // Solo se llevara mal con quien si tenga hijos
                    if (interesesAux.getHijos().equals("si")) {
                        resultado += 1;
                    }
                    break;
                case "noImp":
                    // Si no le imporata no le afecta
                    break;
                default:
                    break;
            }

            // Evaluamos la puntuacion de arte
            resultado += Math.abs(interesUsuario.getArtisticos() - interesesAux.getArtisticos());

            // Evaluamos la puntuacion de deporte
            resultado += Math.abs(interesUsuario.getDeportivos() - interesesAux.getDeportivos());

            // Evaluamos la puntuacion de arte
            resultado += Math.abs(interesUsuario.getPoliticos() - interesesAux.getPoliticos());

            // Si no es el mismo lo guardo en el HashMap
            if (!(interesUsuario.getIdUsuario() == interesesAux.getIdUsuario())) {
                puntuacion.put(interesesAux.getIdUsuario(), resultado);
            }
        }

        ordenada.putAll(puntuacion);

        for (Map.Entry<Integer, Integer> entry : ordenada.entrySet()) {
            System.out.println("Key = " + entry.getKey()
                    + ", Value = " + entry.getValue());
        }

        return puntuacion;
    }

}
