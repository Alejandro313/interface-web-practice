package trabajo.dao.repositories.interfaces;

import trabajo.dao.entities.ClienteDireccion;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public interface I_ClienteDireccionRepository {

    List<ClienteDireccion>getAll();
    default List<ClienteDireccion>getLikeNombre(String nombre){
        if(nombre==null) return new ArrayList();
        return getAll()
                .stream()
                .filter(c->c.getNombre().toLowerCase().contains(nombre.toLowerCase()))
                .collect(Collectors.toList());
    }
    default List<ClienteDireccion>getLikeDireccion(String direccion){
        if(direccion==null) return new ArrayList();
        return getAll()
                .stream()
                .filter(c->c.getDireccion().toLowerCase().contains(direccion.toLowerCase()))
                .collect(Collectors.toList());
    }
    default List<ClienteDireccion>getLikeDocumento(String documento){
        if(documento==null) return new ArrayList();
        return getAll()
                .stream()
                .filter(c->c.getDocumento().toLowerCase().contains(documento.toLowerCase()))
                .collect(Collectors.toList());
    }
    default ClienteDireccion getById(int id){
        return getAll()
                .stream()
                .filter(c->c.getId()==id)
                .findFirst()
                .orElse(new ClienteDireccion());
    }
}
