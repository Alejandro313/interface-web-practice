package trabajo.dao.repositories.jdbc;

import trabajo.dao.entities.Cliente;
import trabajo.dao.entities.Direccion;
import trabajo.dao.enums.TipoDocumento;
import trabajo.dao.repositories.interfaces.I_ClienteRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClienteRepository implements I_ClienteRepository{

    private Connection conn;

    public ClienteRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void save(Cliente cliente) {
        if(cliente==null) return;
        String sqlDireccion="insert into direcciones (calle,numero,piso,depto,torre,codigoPostal,ciudad,provincia,pais) values (?,?,?,?,?,?,?,?,?)";
        String sqlCliente="insert into clientes (nombre,apellido,fenaci,tipoDocumento,numeroDocumento,telefono,email,idDireccion,comentarios) values (?,?,?,?,?,?,?,?,?)";
            
        try(
                PreparedStatement psDir=conn.prepareStatement(
                "insert into direcciones "
                        + "(calle,numero,piso,depto,torre,codigoPostal,ciudad,provincia,pais) values "
                        + "(?,?,?,?,?,?,?,?,?)",
                PreparedStatement.RETURN_GENERATED_KEYS);
                
                PreparedStatement psCli=conn.prepareStatement(
                "insert into clientes "
                        + "(nombre,apellido,fenaci,tipoDocumento,numeroDocumento,telefono,email,idDireccion,comentarios) values "
                        + "(?,?,?,?,?,?,?,?,?)",
                PreparedStatement.RETURN_GENERATED_KEYS);
                ){
                psDir.setString(1, cliente.getDireccion().getCalle());
                psDir.setInt(2, cliente.getDireccion().getNumero());
                psDir.setString(3, cliente.getDireccion().getPiso());
                psDir.setString(4, cliente.getDireccion().getDepto());
                psDir.setString(5, cliente.getDireccion().getTorre());
                psDir.setString(6, cliente.getDireccion().getCodigoPostal());
                psDir.setString(7, cliente.getDireccion().getCiudad());
                psDir.setString(8, cliente.getDireccion().getProvincia());
                psDir.setString(9, cliente.getDireccion().getPais());
                psDir.execute();
                ResultSet rsDir=psDir.getGeneratedKeys();
                if(rsDir.next()) cliente.getDireccion().setId(rsDir.getInt(1));
                
                psCli.setString(1, cliente.getNombre());
                psCli.setString(2, cliente.getApellido());
                psCli.setString(3, cliente.getFenaci());
                psCli.setString(4, cliente.getTipoDocumento()+"");
                psCli.setString(5, cliente.getNumeroDocumento());
                psCli.setString(6, cliente.getTelefono());
                psCli.setString(7, cliente.getEmail());
                psCli.setInt(8, cliente.getDireccion().getId());
                psCli.setString(9, cliente.getComentarios());
                psCli.execute();
                ResultSet rsCli=psCli.getGeneratedKeys();
                if(rsCli.next()) cliente.setId(rsCli.getInt(1));   
                
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public void remove(Cliente cliente) {
        if(cliente == null) return;
        try (PreparedStatement ps=conn.prepareStatement("delete from clientes where id=?")){
            ps.setInt(1, cliente.getId());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    @Override
    public void update(Cliente cliente) {
        if(cliente==null) return;
        try(
                PreparedStatement psDir=conn.prepareStatement(
                "update clientes set"
                        + "(calle,numero,piso,depto,torre,codigoPostal,ciudad,provincia,pais) values "
                        + "(where id = ?)",
                PreparedStatement.RETURN_GENERATED_KEYS);
                
                PreparedStatement psCli=conn.prepareStatement(
                "update direcciones set"
                        + "(nombre,apellido,fenaci,tipoDocumento,numeroDocumento,telefono,email,idDireccion,comentarios) values "
                        + "where id = ?",
                PreparedStatement.RETURN_GENERATED_KEYS);
                ){
                psDir.setString(1, cliente.getDireccion().getCalle());
                psDir.setInt(2, cliente.getDireccion().getNumero());
                psDir.setString(3, cliente.getDireccion().getPiso());
                psDir.setString(4, cliente.getDireccion().getDepto());
                psDir.setString(5, cliente.getDireccion().getTorre());
                psDir.setString(6, cliente.getDireccion().getCodigoPostal());
                psDir.setString(7, cliente.getDireccion().getCiudad());
                psDir.setString(8, cliente.getDireccion().getProvincia());
                psDir.setString(9, cliente.getDireccion().getPais());
                psDir.setInt(10, cliente.getDireccion().getId());
                psDir.execute();
                
                psCli.setString(1, cliente.getNombre());
                psCli.setString(2, cliente.getApellido());
                psCli.setString(3, cliente.getFenaci());
                psCli.setString(4, cliente.getTipoDocumento()+"");
                psCli.setString(5, cliente.getNumeroDocumento());
                psCli.setString(6, cliente.getTelefono());
                psCli.setString(7, cliente.getEmail());
                psCli.setInt(8, cliente.getDireccion().getId());
                psCli.setString(9, cliente.getComentarios());
                psCli.setInt(10, cliente.getId());
                psCli.execute();  
                
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public List<Cliente> getAll() {
        List<Cliente> list=new ArrayList();
        try (ResultSet rs=conn.createStatement().executeQuery(
                "select \n" +
                "    c.id idCliente,nombre,apellido,fenaci,tipoDocumento,numeroDocumento, telefono, email, comentarios, \n" +
                "    idDireccion,calle,numero,piso,depto,torre,codigoPostal,ciudad,provincia,pais\n" +
                "    from clientes c join direcciones d on c.idDireccion = d.id;"
        )){
            while(rs.next()){
                list.add(
                    new Cliente(
                    rs.getInt("idCliente"), 
                    rs.getString("nombre"), 
                    rs.getString("apellido"), 
                    rs.getString("fenaci"), 
                    TipoDocumento.valueOf(rs.getString("tipoDocumento")), 
                    rs.getString("numeroDocumento"), 
                    rs.getString("telefono"), 
                    rs.getString("email"), 
                    new Direccion(
                            rs.getInt("idDireccion"), 
                            rs.getString("calle"), 
                            rs.getInt("numero"), 
                            rs.getString("piso"), 
                            rs.getString("depto"), 
                            rs.getString("torre"), 
                            rs.getString("codigoPostal"), 
                            rs.getString("ciudad"), 
                            rs.getString("provincia"), 
                            rs.getString("pais")
                    ), 
                    rs.getString("comentarios")
                ));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
}
