/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

/**
 * Definición de la clase intereses --------------------------------
 *
 * @author Luis Quesada Romero
 * @version 1.0
 */
public class Intereses {

    // Atributos de clase
    int idPreferencias;
    int idUsuario;
    String busca;
    String tipoRelacion;
    String hijos;
    int artisticos;
    int deportivos;
    int politicos;

    // Contructor por defecto
    public Intereses() {
    }

    // Constructor con todos los paremetros
    public Intereses(int idPreferencias, int idUsuario, String busca, String tipoRelacion, String hijos, int artisticos, int deportivos, int politicos) {
        this.idPreferencias = idPreferencias;
        this.idUsuario = idUsuario;
        this.busca = busca;
        this.tipoRelacion = tipoRelacion;
        this.hijos = hijos;
        this.artisticos = artisticos;
        this.deportivos = deportivos;
        this.politicos = politicos;
    }

    // Constructor sin id de preferencias para que lo genere de forma automatica la BDD
    public Intereses(int idUsuario, String busca, String tipoRelacion, String hijos, int artisticos, int deportivos, int politicos) {
        this.idUsuario = idUsuario;
        this.busca = busca;
        this.tipoRelacion = tipoRelacion;
        this.hijos = hijos;
        this.artisticos = artisticos;
        this.deportivos = deportivos;
        this.politicos = politicos;
    }

    // Métodos getter
    public int getIdPreferencias() {
        return idPreferencias;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public String getBusca() {
        return busca;
    }

    public String getTipoRelacion() {
        return tipoRelacion;
    }

    public String getHijos() {
        return hijos;
    }

    public int getArtisticos() {
        return artisticos;
    }

    public int getDeportivos() {
        return deportivos;
    }

    public int getPoliticos() {
        return politicos;
    }

    // Métodos setter
    public void setIdPreferencias(int idPreferencias) {
        this.idPreferencias = idPreferencias;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void setBusca(String busca) {
        this.busca = busca;
    }

    public void setTipoRelacion(String tipoRelacion) {
        this.tipoRelacion = tipoRelacion;
    }

    public void setHijos(String hijos) {
        this.hijos = hijos;
    }

    public void setArtisticos(int artisticos) {
        this.artisticos = artisticos;
    }

    public void setDeportivos(int deportivos) {
        this.deportivos = deportivos;
    }

    public void setPoliticos(int politicos) {
        this.politicos = politicos;
    }

    // Método toString
    @Override
    public String toString() {
        return "Intereses{" + "idPreferencias=" + idPreferencias + ", idUsuario=" + idUsuario + ", busca=" + busca + ", tipoRelacion=" + tipoRelacion + ", hijos=" + hijos + ", artisticos=" + artisticos + ", deportivos=" + deportivos + ", politicos=" + politicos + '}';
    }

}
