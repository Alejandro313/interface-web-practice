<%@page import="trabajo.dao.repositories.jdbc.ArticuloRepository"%>
<%@page import="trabajo.dao.repositories.interfaces.I_ArticuloRepository"%>
<%@page import="trabajo.dao.interfaces.utils.html.HtmlTable"%>
<%@page import="trabajo.dao.interfaces.connectors.Connector"%>
<%@page import="trabajo.dao.entities.Articulo"%>
<%@page import="trabajo.dao.enums.EspecieRecomendada"%>
<%@page import="trabajo.dao.enums.Tipo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% I_ArticuloRepository ar=new ArticuloRepository(Connector.getConnection());%>
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
                        <a href="ClientesDAO.jsp" class="nav-link">Clientes</a>
                    </li>
    
                    <li class="nav-menu-item">
                        <a href="ArticulosDAO.jsp" class="nav-link">Articulos</a>
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
                                <% 
                                    for(Tipo t: Tipo.values()){
                                        out.println("<option value='"+t+"' >"+t+"</option>");
                                    }
                                %>
                            </select>
                        </td>
                        <td>Stock: </td><td><input id="caja" name="stock" type="number" required style="width: 30%;"></td>
                    </tr>
                    <tr>
                        <td>Descripción:</td><td><input id="caja" name="descripcion" type="text" required/></td>
                        <td>Especie:</td><td>
                            <select name="especieRecomendada" style="width: 90%;" >
                                <% 
                                    for(EspecieRecomendada e: EspecieRecomendada.values()){
                                        out.println("<option value='"+e+"' >"+e+"</option>");
                                    }
                                %>
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
            try {
                    //Articulos
                    String nombre=request.getParameter("nombre");
                    String descripcion=request.getParameter("descripcion");
                    Tipo tipo=Tipo.valueOf(request.getParameter("tipo"));
                    EspecieRecomendada especieRecomendada=EspecieRecomendada.valueOf(request.getParameter("especieRecomendada"));
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
                    boolean activo=Boolean.valueOf(request.getParameter("activo"));
                
                    Articulo articulo = new Articulo(nombre, descripcion, tipo, especieRecomendada, costo, precio, stock, stockMinimo, stockMaximo, comentarios, activo);
                    
                    ar.save(articulo);
                    if(articulo.getId()!=0){
                        out.println("<div class='info'>se pudo guardar un cliente id="+articulo.getId()+"!</div>");  
                    }else{
                        out.println("<div class='error'>No se pudo guardar!</div>"); 
                    }   
            } catch (Exception e) {
                    out.println("<div class='error'>Debe completar todos los parametros!</div>");  
                }
        %>
        
        <div>
            <form>
                Nombre del Articulo: <input type="text" name="buscarArticulo" value=""/> 
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
            out.println(
                        new HtmlTable<Articulo>().getTable(
                                ar.getLikeNombre(
                                        request.getParameter("buscarArticulo")),
                                "ArticulosDAODelete.jsp"));
        %>
             </table>
        <</div>
    </body>
</html>
