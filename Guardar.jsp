<%-- 
    Document   : Guardar
    Created on : 30/04/2021, 02:58:01 PM
    Author     : JUAN
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar sesion</title>
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
        <h2 class="notificacion">Para acceder a productos y el carro debes iniciar sesión</h2>
        <%
            HttpSession sesion = request.getSession();
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
                    
                    String user, pass, nom, appat, apmat ,domi , tele, q;
                    int edad;
                    
                    nom = request.getParameter("nombre");
                    appat = request.getParameter("appat");
                    apmat = request.getParameter("apmat");
                    edad = Integer.parseInt(request.getParameter("edad"));
                    SimpleDateFormat k = new SimpleDateFormat("yyyy/MM/dd");
                    String fecha = request.getParameter("fecha");
                    domi = request.getParameter("domi");
                    tele = request.getParameter("tel");
                    user = request.getParameter("usuario");
                    pass = request.getParameter("pass");
                    
                    q = q = "insert into registro "
                        + "(user, pass, nom_usu, appat_usu, apmat_usu, edad_usu, fecha, domi, tel) "
                        + "values "
                        + "('"+user+"', '"+pass+"', '"+nom+"', '"+appat+"', '"+apmat+"', "+edad+", '"+fecha+"', '"+domi+"', '"+tele+"')";
                    int registro = set.executeUpdate(q);
                    %>
                    <hr>
                    <h2 class="notificacion">Registro Exitoso ahora puede iniciar sesion</h2>
                    <%
                    set.close();
                }catch(SQLException ed){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(ed.getMessage());
                    %>
                    <h2  class="notificacion">Registro no exitoso vuelva a intentarlo</h2>
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
    
    
        
        <main class = "main">
        <div class="container" >
             <div class="contenedorRegistro" >
                <form method="post" action="Guardar.jsp">
                    
                    <fieldset>
                        <legend><h1>Iniciar sesión</h1></legend>
                    <label>Usuario: </label>
                    <br>
                    <input type="text" name="user" pattern="[A-z]+[0-9]{4,10}" title="Deben ser 4 letras y 4 numeros Ejemplo:nombre1234" maxlength="10" ondrop="return false;" onpaste="return false" required>
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
                            sesion.setAttribute("user", usuar);
                            sesion.setAttribute("nivel", "1");
                            response.sendRedirect("Index.jsp");
                            
                            rs.close();
                            set.close();
                        
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
                    <p>Telefono: <input type="text" name="telefono" value="+52" readonly size="1"><input type="text" name="telefono" maxlength="10" pattern="[0-9]{10}"  title="El lada es de mexico(+52) ingrese los 10 digitos restantes" ondrop="return false;" onpaste="return false" required></p>
                    <label>Usuario y contraseña con el ingresará:</label>
                    <p>Usuario:<input type="text" name="usuario" pattern="[A-z]+[0-9]{4,10}" title="Deben ser 4 letras y 4 numeros Ejemplo:nombre1234" maxlength="10" ondrop="return false;" onpaste="return false" required ></p>
                    <p>Contraseña:<input type="password" name="pass" id="pass1" maxlength="20" ondrop="return false;" onpaste="return false" required> </p>
                    <p>Confirmar Contraseña:<input type="password" id="pass2"  maxlength="20" ondrop="return false;" onpaste="return false" required> </p>
                    </fieldset>
                    <input style="opacity:2;" type="checkbox" id="boxx" onclick="verificar()" onkeypress="verificar()" required>
                    <p style="color:black;display:inline-flex ">Acepto los <a style="color:blue;" href="./Contenido/Tyc.txt">Términos y Condiciones</a></p>
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
