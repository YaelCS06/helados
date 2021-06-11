<%-- 
    Document   : IniciarSesion
    Created on : 30/04/2021, 05:41:10 PM
    Author     : JUAN
--%>



<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesion</title>
        <script src="https://kit.fontawesome.com/7dbf9b2dab.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./css/style.css">
        <link rel="shortcut icon" href="./Contenido/icon.png">
        <script src="./js/javascript.js"></script>
    </head>
    <body>
          <%
            HttpSession sesion = request.getSession();
            String usuer;
         
            String nivel = "2";
            String nivelus = "1";
            if(sesion.getAttribute("user")!=null && nivel.equals(sesion.getAttribute("nivel"))){
                usuer = sesion.getAttribute("user").toString();
                
            
                out.print("<script>location.replace('Admin.jsp');</script>");
                
                
            }else{
                if(sesion.getAttribute("user")!=null && nivelus.equals(sesion.getAttribute("nivel"))){
                usuer = sesion.getAttribute("user").toString();
                
                out.print("<script>location.replace('Index.jsp');</script>");

                } 
        }  
        %>
      <div class="cajasup">
            <div class="imge">
                <img src="./Contenido/logo.png">
            </div>    
            
            <nav class = "navigation"> 
                <ul class="menu">
                    <li><a href="index.html"> <span>Inicio</span>
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
                    <li><a href="IniciarSesion.jsp"> <span>Iniciar sesion</span>
                        <span><i class="fas fa-user" aria-hidden="true"></i>
                        </span>    
                         </a>
                    </li>
         
                    
                </ul>
            </nav>
        </div> 
        <section class = "section">
            <hr>
            <h2 class="notificacion">Para acceder a productos y el carro debes iniciar sesión</h2>
            <hr>
        <main class = "main">
        <div class="container" >
            <div class="contenedorRegistro" >
                <form method="post" action="IniciarSesion.jsp">
                    
                    <fieldset>
                        <legend><h1>Iniciar Sesión</h1></legend>
                    <label>Usuario: </label>
                    <br>
                    <input type="text" name="user" pattern="[A-z]+[0-9]{4,10}" title="Deben ser 4 letras y 4 numeros Ejemplo:nombre1234" maxlength="10"  ondrop="return false;" onpaste="return false" required>
                    <br>
                    <label>Contraseña: </label>
                    <br>
                    <input type="password" name="passu" maxlength="20" ondrop="return false;" onpaste="return false" required>
                    <br>
                    <input type="submit" name="btnIngresar" value="Iniciar sesión" >
                    <input type="reset" value="Borrar" > 
                    </fieldset>
                </form>
                
            <%
            
            
            if(request.getParameter("btnIngresar")!=null){
                
               
                   Connection con = null;
                   Statement set = null;
                   ResultSet rs = null;

                   String url, userName, password, driver;

                   url = "jdbc:mysql://localhost:3306/usuariosbyj";             
                   userName = "Yael";
                   password = "Padme01971.,";

                   driver = "com.mysql.cj.jdbc.Driver";
                   String usuar = request.getParameter("user");
                   String contra = request.getParameter("passu");
                    String admin = "admn1234";
                         if(admin.equals(usuar)){
                            sesion.setAttribute("user", usuar);
                            sesion.setAttribute("nivel", "2");
                            response.sendRedirect("Admin.jsp");

                            }else{
                    try{
                       
                        Class.forName(driver);
                        con = DriverManager.getConnection(url, userName, password);
                                
                           
                        
                        try{
                            String q = "select id_usu from registro where user='"+usuar+"' and pass='"+contra+"' ";

                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            while(rs.next()){
                            sesion.setAttribute("user", usuar);
                            sesion.setAttribute("nivel", "1");
                            }
                            rs.close();
                            set.close();
                            response.sendRedirect("Index.jsp");
                        }catch(SQLException ed){
                            System.out.println("No se encontro");
                            System.out.println(ed.getMessage());
                          %>  
       
                        <h3>Usuario o contraseña incorrecto</h3>
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
                    
                    }}
            }if(request.getParameter("cerrar")!=null){
                session.invalidate();
            }
                    %>

            </div>
      
            
            <div class="contenedorRegistro" >
                <form method="post" name="formulario" 
                      action="Guardar.jsp">
                    <fieldset>
                    <legend><h1>Registrarse</h1></legend>
                    <p>Nombre(s): <input type="text" name="nombre" id="nom" maxlength="20" onkeypress="return validarn(event)" ondrop="return false;" onpaste="return false" required></p>
                    <p>Apellido Paterno: <input type="text" name="appat" id="ap" maxlength="20" onkeypress="return validarn(event)" ondrop="return false;" onpaste="return false" required ></p>
                    <p>Apellido Materno: <input type="text" name="apmat" id="am" maxlength="20"  onkeypress="return validarn(event)" ondrop="return false;" onpaste="return false" required ></p>
                    <p>Edad: <input type="number" name="edad"  min="18"  max="90" maxlength="2" required></p>
                    <p>Fecha de nacimiento: <input type="date" name="fecha" ondrop="return false;" onpaste="return false" required></p>
                    <p>Domicilio: <input type="text" name="domi" pattern="[A-z]+[\s]+[A-z]+[\s]+[0-9]{1,30}" title="Deben ser la calle y el numeros Ejemplo:Mi domicilio 123" maxlength="40" ondrop="return false;" onpaste="return false" required></p>
                    <p>Telefono: <input type="text" name="telefono" value="+52" readonly size="1"><input type="text" name="tel" maxlength="10" pattern="[0-9]{10}"  title="El lada es de mexico(+52) ingrese los 10 digitos restantes" ondrop="return false;" onpaste="return false" required></p>
                    <label>Usuario y contraseña con el ingresará:</label>
                    <p>Usuario:<input type="text" name="usuario" pattern="[A-z]+[0-9]{4,10}" title="Deben ser 4 letras y 4 numeros Ejemplo:nombre1234" maxlength="10" ondrop="return false;" onpaste="return false" required ></p>
                    <p>Contraseña:<input type="password" name="pass" id="pass1" maxlength="20" ondrop="return false;" onpaste="return false" required> </p>
                    <p>Confirmar Contraseña:<input type="password" id="pass2"  maxlength="20" ondrop="return false;" onpaste="return false" required> </p>
                    </fieldset>
                    <input style="opacity:2;" type="checkbox" id="boxx" onclick="verificar()" onkeypress="verificar()" required>
                    <p style="color:black;display:inline-flex ">Acepto los<a style="color:blue;" href="./Contenido/Tyc.txt"> Términos y Condiciones</a></p>
                    <br>
                    <input type="submit" value="Registrarme" >
                    <input type="reset" value="Borrar" > 
                     
                </form>
            </div>
            
             
            </div>
        
        </main>
            
            
    </section>
            
    <footer class = "footer">
       <p class="bottom-footer-paragraph">Ben&Jerrys © 2021 Derechos Reservados.</p>
       <p class="bottom-footer-paragraph">Coronado Segundo Juan Yael</p>
       
    </footer>
    
    </body>
</html>