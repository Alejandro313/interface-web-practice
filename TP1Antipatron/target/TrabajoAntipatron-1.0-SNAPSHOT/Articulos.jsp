<%-- 
    Document   : Articulos
    Created on : 1 oct. 2021, 13:43:46
    Author     : Ralu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ar.org.centro8.curso.java.web.interfaces.connectors.Connector"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Articulos</title>
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

        <div id="form" method="GET">
            <form>
                <table>
                    <tr>
                        <td>Nombre: </td><td><input id="caja" name="nombre" type="text" required minlength="5" maxlength="50"/></td>
                        <td id="tipo">Tipo:</td><td>
                            <select name="tipo" style="width: 90%;" >
                                <option value="PRENDA" >Prenda </option>
                                <option value="JUGUETE"  >Juguetes </option>
                                <option value="ALIMENTO"  >Alimento </option>
                                <option value="SNACK"  >Snack </option>
                                <option value="ACCESORIO">Accesorio </option>
                                <option value="CORREAS">Correa </option>
                                <option value="MEDICAMENTOS">Medicamentos </option>
                            </select>
                        </td>
                        <td>Stock: </td><td><input id="caja" name="stock" type="number" required style="width: 30%;"></td>
                    </tr>
                    <tr>
                        <td>Descripción:</td><td><input id="caja" name="descripcion" type="text" required/></td>
                        <td>Especie:</td><td>
                            <select name="especieRecomendada" style="width: 90%;" >
                                <option value="CANINO" >Canino </option>
                                <option value="FELINO"  >Felino </option>
                                <option value="AVE"  >Ave </option>
                                <option value="PEZ"  >Pez </option>
                                <option value="ROEDOR">Roedor </option>
                            </select>
                        </td>
                        <td>Stock Minimo: </td><td><input id="caja" name="stockMinimo" type="number" required style="width: 30%;"></td>
                        
                    </tr>
                    <tr>
                        <td>Costo:</td><td><input id="caja" name="costo" type="number"required  style="width: 30%;"></td>
                        <td>Precio</td><td><input id="caja" name="precio" type="number" required style="width: 30%;"></td>
                        <td>Stock Maximo: </td><td><input id="caja" name="stockMaximo" type="number" required style="width: 30%;"></td> 
                         
                    </tr>
                    <tr>
                        <td>Activo:</td>
                        <td>
                            <select name="activo" type="text">
                                <option value="true">Si</option>
                                <option value="false">No</option>
                             </select>
                        </td>  
                        <td>Comentarios: </td><td><input name="comentarios" type="text"></td>
                    </tr>
                    <tr>
                        <td><input type="reset"  value="Limpiar" class="boton"/></td>
                        <td><input type="submit" value="Enviar"  class="boton"/></td>
                    </tr>
                </table>
            </form>
        </div>
        
        <% 
        //Articulos
        String nombre=request.getParameter("nombre");
        String descripcion=request.getParameter("descripcion");
        String tipo=request.getParameter("tipo");
        String especieRecomendada=request.getParameter("especieRecomendada");
        double costo=0;
        if(request.getParameter("costo")!= null)costo=Double.parseDouble(request.getParameter("costo"));
        double precio=0;
        if(request.getParameter("precio")!= null)precio=Double.parseDouble(request.getParameter("precio"));
        int stock=0;
        if(request.getParameter("stock")!= null)stock=Integer.parseInt(request.getParameter("stock"));
        int stockMinimo=0;
        if(request.getParameter("stockMinimo")!= null)stockMinimo=Integer.parseInt(request.getParameter("stockMinimo"));
        int stockMaximo=0;
        if(request.getParameter("stockMaximo")!= null)stockMaximo=Integer.parseInt(request.getParameter("stockMaximo"));
        String comentarios=request.getParameter("comentarios");
        String activo=request.getParameter("activo");
        
        String sqlArticulos="insert into articulos (nombre,descripcion,tipo,especieRecomendada,costo,precio,stock,stockMinimo,stockMaximo,comentarios,activo) values (?,?,?,?,?,?,?,?,?,?,?)";
            
       // if (nombre!=null && descripcion!=null && tipo!=null && especieRecomendada!=null && costo!=null && precio!=null && stock!=null && stockMinimo!=null && stockMaximo!=null){
        
       // }
        
        try (Connection conn=Connector.getConnection()){
                PreparedStatement psArt=conn.prepareStatement(sqlArticulos,PreparedStatement.RETURN_GENERATED_KEYS);
                psArt.setString(1, nombre);
                psArt.setString(2, descripcion);
                psArt.setString(3, tipo);
                psArt.setString(4, especieRecomendada);
                psArt.setDouble(5, costo);
                psArt.setDouble(6, precio);
                psArt.setInt(7, stock);
                psArt.setInt(8, stockMinimo);
                psArt.setInt(9, stockMaximo);
                psArt.setString(10, comentarios);
                psArt.setBoolean(11, Boolean.parseBoolean(activo));
                psArt.execute();
                int idArt=0;
                    ResultSet rs=psArt.getGeneratedKeys();
                    if(rs.next()) idArt=rs.getInt(1);
                    if(idArt!=0){
                        out.println("<div class='info'>se pudo guardar un articulo id="+idArt+"!</div>");  
                    }else{
                        out.println("<div class='error'>Debe completar todos los parametros!</div>");  
                    }
            } catch (Exception e) {
                System.out.println(e);
            }
        %>
   
        <div>
            <form>
                Articulo: <input type="text" name="buscarArticulo" value=""/> 
            </form>
            
            <table>
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Descripcion</th>
                    <th>Tipo</th>
                    <th>Especie Recomendada</th>
                    <th>Costo</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th>Stock Minimo</th>
                    <th>Stock Maximo</th>
                    <th>Comentarios</th>
                    <th>Activo</th>
                </tr>
       
        
        <% 
            String buscarArticulo = request.getParameter("buscarArticulo");
            try (ResultSet rs=Connector.getConnection().
                    createStatement().
                    executeQuery("select * from articulos where nombre like '%"+buscarArticulo+"%'")){
                    while (rs.next()) {
                           out.println("<tr>");
                            out.println("<td>"+rs.getInt("id")+"</td>");
                            out.println("<td>"+rs.getString("nombre")+"</td>");
                            out.println("<td>"+rs.getString("descripcion")+"</td>");
                            out.println("<td>"+rs.getString("tipo")+"</td>");
                            out.println("<td>"+rs.getString("especieRecomendada")+"</td>");
                            out.println("<td>"+rs.getDouble("costo")+"</td>");
                            out.println("<td>"+rs.getDouble("precio")+"</td>");
                            out.println("<td>"+rs.getInt("stock")+"</td>");
                            out.println("<td>"+rs.getInt("stockMinimo")+"</td>");
                            out.println("<td>"+rs.getInt("stockMaximo")+"</td>");
                            out.println("<td>"+rs.getString("comentarios")+"</td>");
                            out.println("<td>"+rs.getBoolean("activo")+"</td>");
                            out.println("</tr>");
                        }
                } catch (Exception e) {
                    System.out.println(e);
                }
        %>
             </table>
        <</div>
   </body>
</html>
