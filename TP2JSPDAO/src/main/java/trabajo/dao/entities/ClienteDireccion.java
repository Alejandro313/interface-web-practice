package trabajo.dao.entities;

public class ClienteDireccion {
    private int id;
    private String nombre;
    private String fecha_nacimiento;
    private String documento;
    private String telefono;
    private String email;
    private String direccion;
    private String comentarios;

    public ClienteDireccion() {
    }

    public ClienteDireccion(int id, String nombre, String fecha_nacimiento, String documento, String telefono, String email, String direccion, String comentarios) {
        this.id = id;
        this.nombre = nombre;
        this.fecha_nacimiento = fecha_nacimiento;
        this.documento = documento;
        this.telefono = telefono;
        this.email = email;
        this.direccion = direccion;
        this.comentarios = comentarios;
    }

    @Override
    public String toString() {
        return "ClienteDireccion{" + "id=" + id + ", nombre=" + nombre + ", fecha_nacimiento=" + fecha_nacimiento + ", documento=" + documento + ", telefono=" + telefono + ", email=" + email + ", direccion=" + direccion + ", comentarios=" + comentarios + '}';
    }

    public String getComentarios() {
        return comentarios;
    }

    public void setComentarios(String comentarios) {
        this.comentarios = comentarios;
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

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
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

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    
}
