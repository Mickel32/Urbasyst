<!DOCTYPE html>

<html>

<head>
  <title>Hello!</title>
</head>

<body>

<?php

$code_art = $_GET["code"] ;
$seccion = $_GET["secc_tipo"] ;
$nomb_art = $_GET["name_art"] ;
$precio = $_GET["precio_art"] ;
$fecha = $_GET["fecha_art"] ;
$importado = $_GET["import_art"] ;
$pais = $_GET["pais_art"] ;
//$foto = $_GET["pic_art"] ;






  /*En este código que reutilizamos de buscador.php eliminamos la función que
 encapsulaba todo el código
  y eliminamos el while que utilizábamos para iterar por todos los 
registros.*/


 require("conexion.php");

$connexion = mysqli_connect($db_host,$db_usuario,$db_contra);

if( mysqli_connect_errno())
  {

      echo "Hubo un problema con la base de datos error al conectar";

      exit() ;
  }

  mysqli_select_db($connexion,$db_nombre) or die ("No se encuentra la Base de 
 datos");

  mysqli_set_charset($connexion,"utf8");


    /* Vamos trasladar mediante el uso de variables los valores que nos va a
 enviar el formulario */
  /* $instruccion_SQL = "INSERT INTO productos (codigoarticulo, seccion, 
nombrearticulo, precio, fecha, importado,paisdeorigen)
                             VALUES ('arte-01','artezania','jarron',30,'01/01
/2020','si','Ecuador')  ";*/
    /*Lo de arriba es un ejemplo que les puse para que practicaran con la 
consola SQL y no se puede dejar así porque
    se repetiría el mismo artículo una y otra vez*/

      $instruccion_SQL = "INSERT INTO productos (codigoarticulo, seccion, 
nombrearticulo, precio, fecha, importado,paisdeorigen)
                             VALUES ('$code_art','$seccion','$nomb_art',$precio,'$fecha','$importado','$pais')";



   $resultado = mysqli_query($connexion,$instruccion_SQL);


   /*Comprobamos al menos que $resultado se ejecutó satisfactoriamente hay 
muchos otros métodos más seguros
   de saber si lo que enviamos realmente se insertó en la base de datos pero 
todo a su paso*/
   if($resultado == FALSE)
   {
       echo "error en la consulta";
   }  else
   {
       echo "Registro guardado<br><br>";
       echo "<table><tr><td>Código:$code_art</td></tr>";
       echo "<tr><td>Sección:$seccion</td></tr>" ;
        echo "<tr><td>Nombre del articulo:$nomb_art</td></tr>" ;
         echo "<tr><td>Precio:$precio</td></tr>" ;
          echo "<tr><td>Fecha:$fecha</td></tr>" ;
           echo "<tr><td>Importado:$importado</td></tr>" ;
            echo "<tr><td>País de origen:$pais</td> </tr></table>" ;

   }



            mysqli_close($connexion);




?>

</body>
</html>
