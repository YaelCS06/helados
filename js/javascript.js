function validarn(e){
    var teclado = (document.all) ? e.keyCode : e.which;
    if(teclado == 8)return true;
    if(teclado == 32)return true;
    var patron = /[A-z]/;
    var prueba = String.fromCharCode(teclado);
    return patron.test(prueba);
}
function verificar(){
    var contra = document.formulario.pass1.value;
    var contra1 = document.formulario.pass2.value;
    var nom =document.formulario.nom.value;
    var ap = document.formulario.ap.value;
    var am = document.formulario.am.value;
   
    nom = nom.trim();
    ap = ap.trim();
    am = am.trim();
    if(nom == "" || ap == "" ||am == ""){
        alert("No estas ingresando datos validos en nombre y apellidos");
        document.formulario.boxx.checked = false;
        document.formulario.nom.value = "";
        document.formulario.ap.value = "";
        document.formulario.am.value = "";
    }else{
        if(nom.length<3||ap.length<3||am.length<3){
        alert("No estas ingresando datos validos en nombre y apellidos");
        document.formulario.boxx.checked = false;
        document.formulario.nom.value = "";
        document.formulario.ap.value = "";
        document.formulario.am.value = "";
        }
    }
    
    if(contra.length == contra1.length){
        if(contra==contra1){
            if(contra== ""||contra1==""){
      
            alert("Aun no ingresa la contraseña");
            document.formulario.boxx.checked = false;
            document.formulario.pass1.value = "";
            document.formulario.pass2.value = "";
        
            }else{
            return true;
        }
           
        }else{
              
            alert("Las contraseñas no coinciden");
            document.formulario.boxx.checked = false;
            document.formulario.pass1.value = "";
            document.formulario.pass2.value = "";
        }
        
    }else{
        alert("Las contraseñas no coinciden");
        document.formulario.boxx.checked = false;
        document.formulario.pass1.value = "";
        document.formulario.pass2.value = "";
    }
  
}
