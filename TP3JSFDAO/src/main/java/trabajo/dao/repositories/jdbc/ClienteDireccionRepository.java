package trabajo.dao.repositories.jdbc;

import trabajo.dao.entities.ClienteDireccion;
import trabajo.dao.repositories.interfaces.I_ClienteDireccionRepository;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClienteDireccionRepository implements I_ClienteDireccionRepository{

    private Connection conn;

    public ClienteDireccionRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public List<ClienteDireccion> getAll() {
        List<ClienteDireccion>list=new ArrayList();
        try (ResultSet rs=conn.createStatement().executeQuery(
            "select * from V_clientes_direcciones"
        )){
            while(rs.next()){
                list.add(
                    new ClienteDireccion(
                        rs.getInt("idCliente"),
                        rs.getString("nombre"),
                        rs.getString("fenaci"),
                        rs.getString("tipoDocumento")+" "+rs.getString("numeroDocumento"),   
                        rs.getString("telefono"),
                        rs.getString("email"),
                        rs.getString("calle")+" "+rs.getString("numero")+" "+rs.getString("ciudad")+" "+rs.getString("pais"),
                        rs.getString("comentarios")
                    )
                );
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
}
