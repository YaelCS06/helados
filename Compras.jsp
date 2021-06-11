<%-- 
    Document   : Compras
    Created on : 30/04/2021, 04:32:11 PM
    Author     : JUAN
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
        <title>Productos</title>
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
                    <li><a href="Index.jsp"> <span>Inicio</span>
                        <span><i class="fas fa-ice-cream" aria-hidden="true"></i>
                        </span>
                             </a>
                    </li>
                    <li><a href="Comprar.jsp"> <span>Comprar</span>
                        <span><i class="fas fa-shopping-bag" aria-hidden="true"></i>
                        </span>    
                         </a>
                    </li>
                    <li><a href="Carro.jsp"><i class="fas fa-shopping-cart"></i></a></li>
                    <li>      
             <%
            HttpSession sesion = request.getSession();
            String usuer;
            String id;
            String nivel = "1";
            if(sesion.getAttribute("user")!=null && nivel.equals(sesion.getAttribute("nivel"))){
                usuer = sesion.getAttribute("user").toString();
                
            out.print("<a href='IniciarSesion.jsp?cerrar=true'><p>Cerrar Sesion de "+usuer+"</p> </a>");
               
                    
                
                
            }else{
                out.print("<script>location.replace('IniciarSesion.jsp');</script>");
        }     
        %>
                    
                    </li>
                    <%
           
            
                    
                
             
        %>
                  </li>
                    
                </ul>
            </nav>
        </div> 
   
       <section>
             
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
                    set = con.createStatement();
                    
                    String usuario,q;
                    int vainil,choc,frs;
                    
                    usuario = sesion.getAttribute("user").toString();
                    
                    vainil = Integer.parseInt(request.getParameter("vaini"));
                    choc = Integer.parseInt(request.getParameter("choco"));
                    frs = Integer.parseInt(request.getParameter("fresa"));
                   
                    
                    q = q = "insert into pedidos "
                        + "(usuario, Lvainilla, Lchoco, Lfresa) "
                        + "values "
                        + "('"+usuario+"', '"+vainil+"', '"+choc+"', '"+frs+"')";
                    int pedidos = set.executeUpdate(q);
                    %>
                    <hr>
                    <h2 class="notificacion">Se ha guardado su pedido en el carro</h2>
                    <hr>
                    <%
                    set.close();
                }catch(SQLException ed){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(ed.getMessage());
                    %>
                    <hr>
                    <h2  class="notificacion">Pedido no exitoso vuelva a intentarlo</h2>
                    <hr>
                    <%
                }
                con.close();
            }catch(Exception e){
                System.out.println("Error al conectar a bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
                %>
                <h2>Sitio en construccion</h2>
                <%
            }
            
            %>
        

   
             <br>
             <br>
        <form method="post" action="Compras.jsp">
            <table class="form" align="center" border="0">
            <tr>
                <td><h2>  </h2></td>
                <td><h2>Eliga un sabor:</h2></td>
                <td><h2>  </h2></td>
                
            </tr>
            <tr>
                <td><h2>Vainilla</h2></td>
                <td><h2>Chocolate</h2></td>
                <td><h2>Fresa</h2></td>
                
            </tr>
            <tr>
                <td><img src="./Contenido/Vainilla.png" width="300px" height="300px"  > </td>
                <td><img src="./Contenido/Choco.png" width="300px" height="300px"  > </td>
                <td><img src="./Contenido/Fresa.png" width="300px" height="300px"  > </td>
                
            </tr>
            <tr>
                <td></td>
                <td><h3>Litros a comprar:</h3> </td>
                <td></td>
                
            </tr>
            <tr>
                <td><input type="number" name="vaini" min="0" max="50" value="0" required></td>
                <td><input type="number" name="choco" min="0" max="50" value="0" required></td>
                <td><input type="number" name="fresa" min="0" max="50" value="0" required></td>
                
            </tr>
            <tr>
                 <td></td>
                <td><input type="submit" name="pedido" value="Añadir al Carro" ><input type="reset" value="Borrar" > </td>
                <td></td>
                
            </tr>
        </table>

    </form>
             
        <br><br>
    </section>
    <footer class = "footer">
       <p class="bottom-footer-paragraph">Ben&Jerrys © 2021 Derechos Reservados.</p>
       <p class="bottom-footer-paragraph">Coronado Segundo Juan Yael</p>
       
    </footer>
    </body>
</html>