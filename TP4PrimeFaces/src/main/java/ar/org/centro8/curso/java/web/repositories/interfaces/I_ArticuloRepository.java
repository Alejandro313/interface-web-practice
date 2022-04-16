package ar.org.centro8.curso.java.web.repositories.interfaces;

import ar.org.centro8.curso.java.web.entities.Articulo;
import ar.org.centro8.curso.java.web.enums.EspecieRecomendada;
import ar.org.centro8.curso.java.web.enums.Tipo;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public interface I_ArticuloRepository {
    void save(Articulo articulo);
    void remove(Articulo articulo);
    void update(Articulo articulo);
    List<Articulo>getAll();
    
    default Articulo getById(int id){
        return getAll()
                .stream()
                .filter(a->a.getId()==id)
                .findFirst()
                .orElse(new Articulo());
    }

    default List<Articulo>getLikeNombre(String nombre){
        if(nombre==null) return new ArrayList();
        return getAll()
                .stream()
                .filter(a->a.getNombre().toLowerCase().contains(nombre.toLowerCase()))
                .collect(Collectors.toList());
    }
    
    default List<Articulo>getLikeTipo(Tipo tipo){
        if(tipo==null) return new ArrayList();
        return getAll()
                .stream()
                .filter(a->a.getTipo().equals(tipo))
                .collect(Collectors.toList());
    }
    
    default List<Articulo>getLikeEspecieRecomendada(EspecieRecomendada especieRecomendada){
        if(especieRecomendada==null) return new ArrayList();
        return getAll()
                .stream()
                .filter(a->a.getEspecieRecomendada().equals(especieRecomendada))
                .collect(Collectors.toList());
    }
    
    default List<Articulo> getLikeActivo(boolean activo){
        return getAll()
                .stream()
                .filter(a->a.isActivo()==activo)
                .collect(Collectors.toList());
    }
}
