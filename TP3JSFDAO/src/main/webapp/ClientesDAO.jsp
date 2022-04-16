<%@page import="trabajo.dao.repositories.jdbc.ClienteDireccionRepository"%>
<%@page import="trabajo.dao.repositories.interfaces.I_ClienteDireccionRepository"%>
<%@page import="trabajo.dao.entities.ClienteDireccion"%>
<%@page import="trabajo.dao.interfaces.utils.html.HtmlTable"%>
<%@page import="trabajo.dao.interfaces.connectors.Connector"%>
<%@page import="trabajo.dao.repositories.jdbc.ClienteRepository"%>
<%@page import="trabajo.dao.repositories.interfaces.I_ClienteRepository"%>
<%@page import="trabajo.dao.entities.Cliente"%>
<%@page import="trabajo.dao.entities.Direccion"%>
<%@page import="trabajo.dao.enums.TipoDocumento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% I_ClienteRepository cr=new ClienteRepository(Connector.getConnection()); %>
<% I_ClienteDireccionRepository cdr=new ClienteDireccionRepository(Connector.getConnection()); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <link href="css/estilos.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
         <header class="header">
            <nav class="nav">
                <a href="#" class="logo">PetShop</a>
                <ul class="nav-menu">
                    <li class="nav-menu-item">
                        <a href="ClientesDAO.jsp" class="nav-link">Clientes</a>
                    </li>
    
                    <li class="nav-menu-item">
                        <a href="ArticulosDAO.jsp" class="nav-link">Articulos</a>
                    </li>
                </ul>
            </nav>
        </header>
        
        <div id="form">
            <form>
                <table>
                    <tr><td>Nombre:             </td><td><input type="text" name="nombre"   required minlength="3" maxlength="20" style="width: 200px;" /></td></tr>
                    <tr><td>Apellido:           </td><td><input type="text" name="apellido" required minlength="3" maxlength="20" style="width: 200px;" /></td></tr>
                    <tr><td>Fecha Nacimiento:   </td><td><input type="date" name="fenaci"   required style="width: 203px;" /></td></tr>
                    <tr><td>TipoDocumento:      </td>
                        <td>
                            <select name="tipoDocumento" style="width: 208px;" >
                                <% 
                                    for(TipoDocumento t: TipoDocumento.values()){
                                        out.println("<option value='"+t+"' >"+t+"</option>");
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr><td>Número Documento:   </td><td><input type="text"  name="numeroDocumento" required minlength="6" maxlength="8"  style="width: 200px;" /></td></tr>
                    <tr><td>Teléfono:           </td><td><input type="text"  name="telefono"                 minlength="8" maxlength="16" style="width: 200px;" /></td></tr>
                    <tr><td>Email:              </td><td><input type="email" name="email"                    minlength="3" maxlength="50" style="width: 200px;" /></td></tr>
                    <tr>
                        <td>Dirección:          </td>
                        <td>
                            <table>
                                <tr>
                                    <td>Calle:  </td><td><input type="text"     name="calle"                required    minlength="3" maxlength="120" style="width: 150px;" /></td>
                                    <td>Numero: </td><td><input type="number"   name="numero"   value="0"   required    style="width: 70px;"  /></td>
                                    <td>Piso:   </td><td><input type="text"     name="piso"                             minlength="1" maxlength="12"  style="width: 70px;"  /></td>
                                </tr>
                                <tr>
                                    <td>Departamento:   </td><td><input type="text" name="depto"        minlength="1" maxlength="12" style="width: 70px;" /></td>
                                    <td>Torre:          </td><td><input type="text" name="torre"        minlength="1" maxlength="12" style="width: 70px;"  /></td>
                                    <td>Código Postal:  </td><td><input type="text" name="codigoPostal" minlength="1" maxlength="12" style="width: 70px;"  /></td>
                                </tr>
                                <tr>
                                    <td>Ciudad:     </td><td><input type="text" name="ciudad"       value='CABA'        minlength="3" maxlength="50"   style="width: 100px;" /></td>
                                    <td>Provincia:  </td><td><input type="text" name="provincia"    value='CABA'        minlength="3" maxlength="50"   style="width: 100px;"  /></td>
                                    <td>Pais:       </td><td><input type="text" name="pais"         value='Argentina'   minlength="3" maxlength="50"   style="width: 100px;"  /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr><td>Comentarios:        </td><td><input type="text"  name="comentarios"     minlength="0" maxlength="255" style="width: 400px;" /></td></tr>
                    <tr>
                        <td><input type="reset"  value="Limpiar" class="boton"/></td>
                        <td><input type="submit" value="Enviar"  class="boton"/></td>
                    </tr>
                </table>
            </form>
        </div>
        
        <%
            try{
                //dirección
                String calle=request.getParameter("calle");                       //required                       
                int numero=0;                        //required
                if(request.getParameter("numero")!=null) numero=Integer.parseInt(request.getParameter("numero"));
                String piso=request.getParameter("piso");
                String departamento=request.getParameter("depto");
                String torre=request.getParameter("torre");
                String codigoPostal=request.getParameter("codigoPostal");
                String ciudad=request.getParameter("ciudad");
                String provincia=request.getParameter("provincia");
                String pais=request.getParameter("pais");
                System.out.println(calle);

                //cliente
                String nombre=request.getParameter("nombre");                      //required
                String apellido=request.getParameter("apellido");                    //required
                String fenaci=request.getParameter("fenaci");                      //required
                TipoDocumento tipoDocumento=TipoDocumento.valueOf(request.getParameter("tipoDocumento"));               //required
                String numeroDocumento=request.getParameter("numeroDocumento");             //required
                String telefono=request.getParameter("telefono");
                String email=request.getParameter("email");
                String comentarios=request.getParameter("comentarios");

                if(nombre!=null && apellido!=null && calle!=null && piso!=null){
                    Direccion dir=new Direccion(calle, numero, piso, departamento, torre, codigoPostal, ciudad, provincia, pais);
                    Cliente cliente=new Cliente(nombre, apellido, fenaci, tipoDocumento, numeroDocumento, telefono, email, dir, comentarios);
                    cr.save(cliente);
                    if(cliente.getId()!=0){
                        out.println("<div class='info'>se pudo guardar un cliente id="+cliente.getId()+"!</div>");  
                    }else{
                        out.println("<div class='error'>No se pudo guardar!</div>"); 
                    }   
                }else{
                    out.println("<div class='error'>Debe completar todos los parametros!</div>");  
                }
            }catch(Exception e){
                out.println("<div class='error'>Debe completar todos los parametros!</div>");  
            }
        %>
             
        
                            
        <div id="tabla">
            
            <form>
                Nombre Apellido: 
                <input type="text" name="buscarNombreApellido" value="" />
            </form>
            
            <%
                //for(Cliente c: cr.getAll()) out.println(c+"<br>");
                out.println(
                        new HtmlTable<ClienteDireccion>().getTable(
                                cdr.getLikeNombre(
                                        request.getParameter("buscarNombreApellido")),
                                "ClientesDAODelete.jsp"));
            %>
        </div>
    </body>
</html>
