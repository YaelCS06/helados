<%-- 
    Document   : Borrarpedido
    Created on : 4/05/2021, 08:41:14 PM
    Author     : JUAN
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Compras</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/7dbf9b2dab.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./css/style.css">
        <link rel="shortcut icon" href="./Contenido/icon.png">
        <script src="./js/javascript.js"></script>
    </head>
    <body>
        <div class="cajasup">
            <div class="imge">
                <img src="./Contenido/logo.png">
            </div>    
            
              <nav class = "navigation"> 
                <ul class="menu">
                    
                    <li><a href="Consultausr.jsp"> <span>Consultar usuarios</span>
                        <span><i class="fas fa-users" aria-hidden="true"></i>
                        </span>    
                         </a>
                    </li>
                    <li><a href="Consultacomp.jsp"> <span>Consultar compras</span>
                        <span><i class="fas fa-archive" aria-hidden="true"></i>
                        </span>    
                         </a>
                    </li>
                    <li>       
                       
  
  
         <%
              HttpSession sesion = request.getSession();
            String usuer;
            String id;
            String nivel = "2";
            String nivelus = "1";
            if(sesion.getAttribute("user")!=null && nivel.equals(sesion.getAttribute("nivel"))){
                usuer = sesion.getAttribute("user").toString();
                
            out.print("<a href='IniciarSesion.jsp?cerrar=true'><p style=''>Cerrar Sesion de Administrador</p> </a>");
               
                    
                
                
            }else{
                if(sesion.getAttribute("user")!=null && nivelus.equals(sesion.getAttribute("nivel"))){
                usuer = sesion.getAttribute("user").toString();
                
                out.print("<script>location.replace('Index.jsp');</script>");




                }else{
                    out.print("<script>location.replace('IniciarSesion.jsp');</script>");
                }   
        }  
        %>
                   

                    </li>
                    
                </ul>
            </nav>
        </div> 
   
        
         <section >
             <br>
             
                <h1>
                    <hr>
                    Este es el registro de pedidos de los usuarios
                    <hr>
                </h1>
             <br>
             
        <%
            Connection con = null;
                   Statement set = null;
                   ResultSet rs = null;

                   String url, userName, password, driver;

                   url = "jdbc:mysql://localhost:3306/usuariosbyj";             
                   userName = "Yael";
                   password = "Padme01971.,";

                   driver = "com.mysql.cj.jdbc.Driver";
            try{
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                try{
                    
                    
                    int pedido = Integer.parseInt(request.getParameter("pedido"));
                    String q = "delete from pedidos where pedido="+pedido;
                    set = con.createStatement();
                    
                    int borrar = set.executeUpdate(q);
                    
                    %>
                    
                    <h1>Pedido Borrado con Exito</h1>
                    
                    <%     
                    set.close();    
                
                }catch(SQLException ed){
                    System.out.println("Error al eliminar el dato");
                    System.out.println(ed.getMessage());
                     %>
                    
                    <h1> No es posible borrar el pedido </h1>
                    
                    <% 
                
                }
                con.close();
            
            }catch(Exception e){
                System.out.println("Error al conectar con la bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
                %>
                    
                    <h1>Sitio en construcción</h1>
                    
                    <%
            
            }
            %>
        <table  class = "usuarios" border="1" align="center">
            <thead>
                <tr>
                    <th>No. pedido</th>
                    <th>Usuario</th>
                    <th>L Vainilla</th>
                    <th>L Chocolate</th>
                    <th>L Fresa</th>
                    
                </tr>
            </thead>
            <tbody>
                <%

                    
                    try{
                        Class.forName(driver);
                        con = DriverManager.getConnection(url, userName, password);
                        try{
                            String q = "select * from pedidos order by pedido asc";
                            
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            while(rs.next()){
                            %>
                <tr>
                    <td> <%=rs.getInt("pedido")%> </td>
                    <td> <%=rs.getString("usuario")%> </td>
                    <td> <%=rs.getString("Lvainilla")%> </td>
                    <td> <%=rs.getString("Lchoco")%> </td>
                    <td> <%=rs.getString("Lfresa")%> </td>
                    <td> <a href="Borrarpedido.jsp?id=<%=rs.getInt("pedido")%>" > Borrar </a> </td>

                </tr>            
                            
                            
                            <%
                               
                            }
                            rs.close();
                            set.close();
                        
                        }catch(SQLException ed){
                            System.out.println("Error al consultar la tabla");
                            System.out.println(ed.getMessage());
                            %>
            </tbody>
            <h1>Error el recurso de la consulta no esta disponible</h1>
                            <%
                        
                        }
                        con.close();
                    
                    }catch(Exception e){
                        System.out.println("Error al conectar con la bd");
                        System.out.println(e.getMessage());
                        System.out.println(e.getStackTrace());
                        %>
                    
                    <h1>Sitio en construcción</h1>
                    
                    <%
                    }
                    %>
                
                
            </tbody>
            
            
        </table>
        
    </section>
    <footer class = "footer">
       <p class="bottom-footer-paragraph">Ben&Jerrys © 2021 Derechos Reservados.</p>
       <p class="bottom-footer-paragraph">Coronado Segundo Juan Yael</p>
       
    </footer>
    </body>
</html>