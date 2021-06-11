<%-- 
    Document   : Admin
    Created on : 1/05/2021, 01:29:35 AM
    Author     : JUAN
--%>

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
        <title>Administracion</title>
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
         
            String nivel = "2";
            String nivelus = "1";
            if(sesion.getAttribute("user")!=null && nivel.equals(sesion.getAttribute("nivel"))){
                usuer = sesion.getAttribute("user").toString();
                
            out.print("<a href='IniciarSesion.jsp?cerrar=true'><p>Cerrar Sesion de Administrador</p> </a>");
               
                    
                
                
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
   
    
         <section class = "inicioadmin">
             
             <br>
             <h1>Bienvenido Administrador</h1>
             <br>
             <img src="./Contenido/ice.png" width="700" height="900">



        
    </section>
    <footer class = "footer">
       <p class="bottom-footer-paragraph">Ben&Jerrys © 2021 Derechos Reservados.</p>
       <p class="bottom-footer-paragraph">Coronado Segundo Juan Yael</p>
       
    </footer>
    </body>
</html>