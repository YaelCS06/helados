<%-- 
    Document   : Index
    Created on : 30/04/2021, 09:06:46 PM
    Author     : JUAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Ben&Jerry's</title>
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
                    
                </ul>
            </nav>
        </div> 
          
   <section class="caja">
          
        <h1>
            <hr>
            Bienvenido a Ben&Jerry's
            <hr>
        </h1>
        <p class="imginic">
        <img src="./Contenido/Inicio.jpg" width="100%" height="800px">
        </p>
    
    
                <h1>
                    <hr>
                    !!CONTAMOS CON TRES DELICIOSOS SABORES¡¡
                    <hr>
                </h1>
            
          <div class="boxx">
      
            <div class="columna">
              <h2>Fresa</h2><img src="./Contenido/f.jpg" width="250">
              
              <p>Nuestro helado de fresa es realmente dulce e incluso aveces tenemos de fresa con crema </p>
            </div>
            <div class="columna">
              <h2>Vainilla</h2><img src="./Contenido/va.jpg" width="250">
              <p>El helado de vainilla es el mejor ta exquisito fijate</p><a class="bcomprar" href="Comprar.jsp"><h1>!!QUIERO UNO¡¡</h1></a>
            </div>
            <div class="columna">
              <h2>Chocolate</h2>
              <img src="./Contenido/cho.jpg" width="250">
              <p>Si quieres algo muy rico prueba nuestrohelado de chocolate que no es amargo ni tampoco muy dulce</p>
            </div>
          </div>
                 
                <h1>
                    <hr>
                    SUCURSALES
                    <hr>
                </h1>
                
               <div class="boxx2">
      
            <div class="columna">
              <img src="./Contenido/helados.jpg" width="600">
              
            </div>
                   
            <div class="columnasucu" width="200" >
            
              <p>Por ahora solo tenemos una sucursal en Mexico que esperas para encontrarnos y disfrutar de los mejores helados. Estamos frente al metro Popotla, Calz México-Tacuba, Popotla, Miguel Hidalgo, 11310 Ciudad de México, CDMX  </p>
              <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d940.5159488535635!2d-99.17618767076367!3d19.452816099179554!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85d1f8bda5cb206b%3A0x99cdcb44f886987d!2sMitel!5e0!3m2!1ses!2smx!4v1620006160973!5m2!1ses!2smx" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
              
            </div>
          </div>
      
                <div class="nosotros">
    <div class="dark-image section">
        <h3 class="h3-head-white">Acerca de Nosotros</h3>
        <blockquote class="quote-container w-container">
          <h2 data-w-id="3608198b-03e9-db99-3670-1fc0f3e8c0a9" class="section-title negative"><br>Una marca de primera al mejor precio</h2>
          <p>
              <span>
              Somos una marca que no solo hace helados de calidad tambien el servicio es de calidad con instalaciones de primera en las que hasta comer un simple helado te hara sentir una experiencia totalmente diferente
              </span>
          </p>
        </blockquote>
        <br>
      </div>
      </div>              

    </section>
    <footer class = "footer">
       <p class="bottom-footer-paragraph">Ben&Jerrys © 2021 Derechos Reservados.</p>
       <p class="bottom-footer-paragraph">Coronado Segundo Juan Yael</p>
       
    </footer>
    </body>
</html>