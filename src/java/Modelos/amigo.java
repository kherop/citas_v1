/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.Date;

/**
 * Definicion de la clase Amigos
 * -----------------------------
 * @author Luis Quesada
 * @version 1.0
 */
public class amigo {
 
    // Atributos de clase
    int idEmisor;
    int idReceptor;
    String estado; // aceptada - espera, si se rechaza se elimina de la base de datos y se queda libre
    Date fechaAceptada;

    // Constructor por defecto
    public amigo() {
    }

    // Constructor con todos los parametros
    public amigo(int idEmisor, int idReceptor, String estado, Date fechaAceptada) {
        this.idEmisor = idEmisor;
        this.idReceptor = idReceptor;
        this.estado = estado;
        this.fechaAceptada = fechaAceptada;
    }

    // Constructor para lanzar amistad desde la app
    public amigo(int idEmisor, int idReceptor, String estado) {
        this.idEmisor = idEmisor;
        this.idReceptor = idReceptor;
        this.estado = estado;
    }

    // Métodos getter
    public int getIdEmisor() {
        return idEmisor;
    }

    public int getIdReceptor() {
        return idReceptor;
    }

    public String getEstado() {
        return estado;
    }

    public Date getFechaAceptada() {
        return fechaAceptada;
    }

    // Métodos setter
    public void setIdEmisor(int idEmisor) {
        this.idEmisor = idEmisor;
    }

    public void setIdReceptor(int idReceptor) {
        this.idReceptor = idReceptor;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void setFechaAceptada(Date fechaAceptada) {
        this.fechaAceptada = fechaAceptada;
    }

    // Método toString
    @Override
    public String toString() {
        return "amigos{" + "idEmisor=" + idEmisor + ", idReceptor=" + idReceptor + ", estado=" + estado + ", fechaAceptada=" + fechaAceptada + '}';
    }
    
}
