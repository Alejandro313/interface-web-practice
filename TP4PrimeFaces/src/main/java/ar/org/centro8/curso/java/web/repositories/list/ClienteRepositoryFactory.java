package ar.org.centro8.curso.java.web.repositories.list;

public class ClienteRepositoryFactory {
    private static ClienteRepository cr=new ClienteRepository();
    private ClienteRepositoryFactory(){}
    public static ClienteRepository getClienteRepository(){
        return cr;
    }
}
