/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

/**
 * Definición de la clase asignacion de roles
 * ------------------------------------------
 * @author Luis Quesada Romero
 */
public class AsignacionRoles {
    
    // Atributos de clase
    int idUsuario;
    int idRol;
    
    // Constructor por defecto
    public AsignacionRoles() {
    }

    // Constructor con todos los parametros
    public AsignacionRoles(int idUsuario, int idRol) {
        this.idUsuario = idUsuario;
        this.idRol = idRol;
    }

    // Métodos getter
    public int getIdUsuario() {
        return idUsuario;
    }

    public int getIdRol() {
        return idRol;
    }

    // Métodos setter
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    // Método toString
    @Override
    public String toString() {
        return "asignacionRoles{" + "idUsuario=" + idUsuario + ", idRol=" + idRol + '}';
    }
    
}
