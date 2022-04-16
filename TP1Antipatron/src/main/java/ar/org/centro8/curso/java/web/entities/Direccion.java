package ar.org.centro8.curso.java.web.entities;

public class Direccion {
    private int id;
    private String calle;
    private int numero;
    private String piso;
    private String depto;
    private String torre;
    private String codigoPostal;
    private String ciudad;
    private String provincia;
    private String pais;

    public Direccion() {
    }

    public Direccion(String calle, int numero, String piso, String depto, String torre, String codigoPostal, String ciudad, String provincia, String pais) {
        this.calle = calle;
        this.numero = numero;
        this.piso = piso;
        this.depto = depto;
        this.torre = torre;
        this.codigoPostal = codigoPostal;
        this.ciudad = ciudad;
        this.provincia = provincia;
        this.pais = pais;
    }

    public Direccion(int id, String calle, int numero, String piso, String depto, String torre, String codigoPostal, String ciudad, String provincia, String pais) {
        this.id = id;
        this.calle = calle;
        this.numero = numero;
        this.piso = piso;
        this.depto = depto;
        this.torre = torre;
        this.codigoPostal = codigoPostal;
        this.ciudad = ciudad;
        this.provincia = provincia;
        this.pais = pais;
    }

    @Override
    public String toString() {
        return "Direccion{" + "id=" + id + ", calle=" + calle + ", numero=" + numero + ", piso=" + piso + ", depto=" + depto + ", torre=" + torre + ", codigoPostal=" + codigoPostal + ", ciudad=" + ciudad + ", provincia=" + provincia + ", pais=" + pais + '}';
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getPiso() {
        return piso;
    }

    public void setPiso(String piso) {
        this.piso = piso;
    }

    public String getDepto() {
        return depto;
    }

    public void setDepto(String depto) {
        this.depto = depto;
    }

    public String getTorre() {
        return torre;
    }

    public void setTorre(String torre) {
        this.torre = torre;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }
    
    
    
}
