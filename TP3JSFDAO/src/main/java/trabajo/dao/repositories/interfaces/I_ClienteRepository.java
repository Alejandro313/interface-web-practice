package trabajo.dao.repositories.interfaces;

import trabajo.dao.entities.Cliente;
import trabajo.dao.enums.TipoDocumento;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public interface I_ClienteRepository {
    void save(Cliente cliente);
    void remove(Cliente cliente);
    void update(Cliente cliente);
    List<Cliente>getAll();
    default Cliente getById(int id){
        return getAll()
                .stream()
                .filter(c->c.getId()==id)
                .findFirst()
                .orElse(new Cliente());
    }
    default List<Cliente>getLikeApellido(String apellido){
        if(apellido==null) return new ArrayList();
        return getAll()
                .stream()
                .filter(c->c.getApellido()!=null 
                        && c.getApellido().toLowerCase().contains(apellido.toLowerCase()))
                .collect(Collectors.toList());
    }
    default Cliente getByTipoNumero(TipoDocumento tipo,String numero){
        if(tipo==null || numero==null) return new Cliente();
        return getAll()
                .stream()
                .filter(c->c.getNumeroDocumento()!=null  
                        && c.getTipoDocumento()==tipo 
                        && c.getNumeroDocumento().equals(numero))
                .findAny()
                .orElse(new Cliente());
    }
}
