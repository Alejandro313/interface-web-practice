<%-- 
    Document   : Clientes
    Created on : 1 oct. 2021, 12:43:07
    Author     : Ralu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="ar.org.centro8.curso.java.web.interfaces.connectors.Connector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
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
                        <a href="Clientes.jsp" class="nav-link">Clientes</a>
                    </li>
    
                    <li class="nav-menu-item">
                        <a href="Articulos.jsp" class="nav-link">Articulos</a>
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
                                <option value="DNI" >DNI </option>
                                <option value="LC"  >LC  </option>
                                <option value="LE"  >LE  </option>
                                <option value="CI"  >CI  </option>
                                <option value="PASS">PASS</option>
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
            String tipoDocumento=request.getParameter("tipoDocumento");               //required
            String numeroDocumento=request.getParameter("numeroDocumento");             //required
            String telefono=request.getParameter("telefono");
            String email=request.getParameter("email");
            String comentarios=request.getParameter("comentarios");
            
            String sqlDireccion="insert into direcciones (calle,numero,piso,depto,torre,codigoPostal,ciudad,provincia,pais) values (?,?,?,?,?,?,?,?,?)";
            String sqlCliente="insert into clientes (nombre,apellido,fenaci,tipoDocumento,numeroDocumento,telefono,email,idDireccion,comentarios) values (?,?,?,?,?,?,?,?,?)";
            
            if(nombre!=null && apellido!=null && calle!=null && piso!=null){

                try (Connection conn=Connector.getConnection()){
                    PreparedStatement psDir=conn.prepareStatement(sqlDireccion,PreparedStatement.RETURN_GENERATED_KEYS);
                    psDir.setString(1, calle);
                    psDir.setInt(2, numero);
                    psDir.setString(3, piso);
                    psDir.setString(4, departamento);
                    psDir.setString(5, torre);
                    psDir.setString(6, codigoPostal);
                    psDir.setString(7, ciudad);
                    psDir.setString(8, provincia);
                    psDir.setString(9, pais);
                    psDir.execute();
                    int idDir=0;
                    ResultSet rs=psDir.getGeneratedKeys();
                    if(rs.next()) idDir=rs.getInt(1);
                    //System.out.println(idDir);

                    PreparedStatement psCli=conn.prepareStatement(sqlCliente,PreparedStatement.RETURN_GENERATED_KEYS);
                    psCli.setString(1,nombre);
                    psCli.setString(2,apellido);
                    psCli.setString(3,fenaci);
                    psCli.setString(4,tipoDocumento);
                    psCli.setString(5,numeroDocumento);
                    psCli.setString(6,telefono);
                    psCli.setString(7,email);
                    psCli.setInt(8,idDir);
                    psCli.setString(9,comentarios);
                    psCli.execute();
                    int idCli=0;
                    rs=psCli.getGeneratedKeys();
                    if(rs.next()) idCli=rs.getInt(1);
                    if(idCli!=0){
                        out.println("<div class='info'>se pudo guardar un cliente id="+idCli+"!</div>");  
                    }else{
                        out.println("<div class='error'>Debe completar todos los parametros!</div>");  
                    }

                } catch (Exception e) {
                    System.out.println(e);
                    out.println("<div class='error'>No se pudo guardar!</div>");
                }
            }else{
                out.println("<div class='error'>Debe completar todos los parametros!</div>");  
            }
        %>
       
       <!-- Tabla que nos muestre el cliente de la base de datos -->
        <div id="tabla">
            <!-- Creamos un formulario de busqueda que pueda buscar un apellido -->
            <form>
                Apellido: <input type="text" name="buscarApellido" value=""/>
            </form>
            
            <table>
                <!--Agregamos la tabla y sus variables-->
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Fecha Nacimiento</th>
                    <th>Tipo Documento</th>
                    <th>Numero Documento</th>
                    <th>Telefono</th>
                    <th>Email</th>
                    <th>Dirección</th>
                    <th>Comentarios</th>
                </tr>
                
                <%
                    String buscarApellido=request.getParameter("buscarApellido");
                    //Creamos un rs que va contener el connector y una consulta sql
                    try (ResultSet rs=Connector
                            .getConnection()
                            .createStatement()
                            .executeQuery("select * from clientes where apellido like '%"+buscarApellido+"%'")
                    ){
                        //Recorremos la tabla con un while
                        while(rs.next()){
                            out.println("<tr>");
                            out.println("<td>"+rs.getInt("id")+"</td>");
                            out.println("<td>"+rs.getString("nombre")+"</td>");
                            out.println("<td>"+rs.getString("apellido")+"</td>");
                            out.println("<td>"+rs.getString("fenaci")+"</td>");
                            out.println("<td>"+rs.getString("tipoDocumento")+"</td>");
                            out.println("<td>"+rs.getString("numeroDocumento")+"</td>");
                            out.println("<td>"+rs.getString("telefono")+"</td>");
                            out.println("<td>"+rs.getString("email")+"</td>");
                            out.println("<td>"+rs.getString("direccion")+"</td>");
                            out.println("<td>"+rs.getString("comentarios")+"</td>");
                            out.println("</tr>");
                        }
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                %>
            </table>
        </div>
    </body>
    </body>
</html>
