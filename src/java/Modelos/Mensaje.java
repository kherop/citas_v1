package Modelos;


import java.sql.Date;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Definicion de la clase Mensaje
 -------------------------------
 * @author Luis Quesada
 * @version 1.0
 */
public class Mensaje {
    
    // Atributos de clase
    int idMensaje;
    int ideRemitente;
    int idDestinatario;
    String asusnto;
    Date fecha;
    String cuerpo;
    int leido;
    
    // Constructores

    public Mensaje() {
    }

    public Mensaje(int idMensaje, int ideRemitente, int idDestinatario, String asusnto, Date fecha, String cuerpo, int leido) {
        this.idMensaje = idMensaje;
        this.ideRemitente = ideRemitente;
        this.idDestinatario = idDestinatario;
        this.asusnto = asusnto;
        this.fecha = fecha;
        this.cuerpo = cuerpo;
        this.leido = leido;
    }

    public Mensaje(int ideRemitente, int idDestinatario, String asusnto, String cuerpo) {
        this.ideRemitente = ideRemitente;
        this.idDestinatario = idDestinatario;
        this.asusnto = asusnto;
        this.cuerpo = cuerpo;
    }
    
    
    
    // Métodos setter

    public void setIdMensaje(int idMensaje) {
        this.idMensaje = idMensaje;
    }

    public void setIdeRemitente(int ideRemitente) {
        this.ideRemitente = ideRemitente;
    }

    public void setIdDestinatario(int idDestinatario) {
        this.idDestinatario = idDestinatario;
    }

    public void setAsusnto(String asusnto) {
        this.asusnto = asusnto;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public void setCuerpo(String cuerpo) {
        this.cuerpo = cuerpo;
    }

    public void setLeido(int leido) {
        this.leido = leido;
    }
    
    // Métodos getter

    public int getIdMensaje() {
        return idMensaje;
    }

    public int getIdeRemitente() {
        return ideRemitente;
    }

    public int getIdDestinatario() {
        return idDestinatario;
    }

    public String getAsusnto() {
        return asusnto;
    }

    public Date getFecha() {
        return fecha;
    }

    public String getCuerpo() {
        return cuerpo;
    }

    public int getLeido() {
        return leido;
    }

    // Método toString
    @Override
    public String toString() {
        return "mensajes{" + "idMensaje=" + idMensaje + ", ideRemitente=" + ideRemitente + ", idDestinatario=" + idDestinatario + ", asusnto=" + asusnto + ", fecha=" + fecha + ", cuerpo=" + cuerpo + ", leido=" + leido + '}';
    }
    
    
    
}
