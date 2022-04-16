package ar.org.centro8.curso.java.web.managed.bean;

import ar.org.centro8.curso.java.web.entities.Cliente;
import ar.org.centro8.curso.java.web.entities.Direccion;
import ar.org.centro8.curso.java.web.interfaces.connectors.Connector;
import ar.org.centro8.curso.java.web.repositories.interfaces.I_ClienteRepository;
import ar.org.centro8.curso.java.web.repositories.jdbc.ClienteRepository;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Named;

@Named()
@SessionScoped
public class ClienteMB implements Serializable{
    private Cliente cliente;
    private String mensaje="";
    private String buscarApellido="";
    private Date fenaci=new Date();
    private I_ClienteRepository cr=new ClienteRepository(Connector.getConnection());
    
    public ClienteMB(){
        cliente=new Cliente();
        cliente.setDireccion(new Direccion());
    }
    
    public void addMessage(FacesMessage.Severity severity, String summary, String detail) {
        FacesContext.getCurrentInstance().
                addMessage(null, new FacesMessage(severity, summary, detail));
    }
    
    public void save(){
        System.out.println("*****************************************");
        System.out.println(cliente.getFenaci());
        System.out.println("*****************************************");
        try {
            cliente.setFenaci(fenaci);
            cr.save(cliente);
            if(cliente.getId()>0){
                mensaje="Se guardo el cliente id: "+cliente.getId();
                addMessage(FacesMessage.SEVERITY_INFO, "Info Message", mensaje);
                cliente=new Cliente();
                cliente.setDireccion(new Direccion());
            }else{
                mensaje="No se pudo guardar el cliente!";
                addMessage(FacesMessage.SEVERITY_ERROR, "Info Message", mensaje);
            }
        } catch (Exception e) {
            System.out.println(e);
            mensaje="No se pudo guardar el cliente!";
            addMessage(FacesMessage.SEVERITY_ERROR, "Info Message", mensaje);
        }
    }
    
    public List<Cliente>getAll(){
        return cr.getAll();
    }
    
    public List<Cliente>getLikeApellido(){
        return cr.getLikeApellido(buscarApellido);
    }
    
    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getBuscarApellido() {
        return buscarApellido;
    }

    public void setBuscarApellido(String buscarApellido) {
        this.buscarApellido = buscarApellido;
    }

    public Date getFenaci() {
        return fenaci;
    }

    public void setFenaci(Date fenaci) {
        this.fenaci = fenaci;
    }

}
