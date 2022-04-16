package ar.org.centro8.curso.java.web.entities;

import ar.org.centro8.curso.java.web.enums.TipoDocumento;

public class Cliente {
    private int id;
    private String nombre;
    private String apellido;
    private String fenaci;
    private TipoDocumento tipoDocumento;
    private String numeroDocumento;
    private String telefono;
    private String email;
    private Direccion direccion;
    private String comentarios;

    public Cliente() {
    }

    public Cliente(String nombre, String apellido, String fenaci, TipoDocumento tipoDocumento, String numeroDocumento, String telefono, String email, Direccion direccion, String comentarios) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.fenaci = fenaci;
        this.tipoDocumento = tipoDocumento;
        this.numeroDocumento = numeroDocumento;
        this.telefono = telefono;
        this.email = email;
        this.direccion = direccion;
        this.comentarios = comentarios;
    }

    public Cliente(int id, String nombre, String apellido, String fenaci, TipoDocumento tipoDocumento, String numeroDocumento, String telefono, String email, Direccion direccion, String comentarios) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fenaci = fenaci;
        this.tipoDocumento = tipoDocumento;
        this.numeroDocumento = numeroDocumento;
        this.telefono = telefono;
        this.email = email;
        this.direccion = direccion;
        this.comentarios = comentarios;
    }

    @Override
    public String toString() {
        return "Cliente{" + "id=" + id + ", nombre=" + nombre + ", apellido=" + apellido + ", fenaci=" + fenaci + ", tipoDocumento=" + tipoDocumento + ", numeroDocumento=" + numeroDocumento + ", telefono=" + telefono + ", email=" + email + ", direccion=" + direccion + ", comentarios=" + comentarios + '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getFenaci() {
        return fenaci;
    }

    public void setFenaci(String fenaci) {
        this.fenaci = fenaci;
    }

    public TipoDocumento getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(TipoDocumento tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public String getNumeroDocumento() {
        return numeroDocumento;
    }

    public void setNumeroDocumento(String numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Direccion getDireccion() {
        return direccion;
    }

    public void setDireccion(Direccion direccion) {
        this.direccion = direccion;
    }

    public String getComentarios() {
        return comentarios;
    }

    public void setComentarios(String comentarios) {
        this.comentarios = comentarios;
    }

    
}
