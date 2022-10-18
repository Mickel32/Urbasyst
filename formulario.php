<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8" >
    <title>Formulario de registros</title>

    <!-- Algo de CSS para darle un poco de vista -->
    <style>

    h1{
        text-align: center;
        color: #000FF;
        border-bottom: #CC955A ;
        width: 50 %;
        margin: auto;
    }

    table {
        border: 1px solid #CCA633 ;
        padding: 20px 50px;
        margin-top: 50px;
    }

    body{
      background-color: #87CCC1;
    }

    </style>



</head>

<body>

  <h1> Registro de productos</h1>

  <form action="insert_registro.php" name="formulario1" method="get"

 >

  <!-- Recuerden que mediante el atributo action indicamos al 
formulario el archivo que se va a enviar la informacion '
  para que esta sea procesada -->

  <table border="0" align="center">
  <tr>
      <td>
          Código Articulo
      </td>
      <td><label for="code"></label>
      <input type="text" name="code" id="code" /></td>
  </tr>
   <tr>
      <td>
          Sección
      </td>
      <td><label for="secc_tipo"></label>
      <input type="text" name="secc_tipo" id="secc_tipo" /></td>
  </tr>
   <tr>
      <td>
          Nombre artículo
      </td>
      <td><label for="name_art"></label>
      <input type="text" name="name_art" id="name_art" /></td>
  </tr>
   <tr>
      <td>
          Precio
      </td>
      <td><label for="precio_art"></label>
      <input type="text" name="precio_art" id="precio_art" /></td>

  </tr>
   <tr>
      <td>
          Fecha
      </td>
      <td><label for="fecha_art"></label>
      <input type="text" name="fecha_art" id="fecha_art" /></td>
  </tr>
   <tr>
      <td>
          Importado
      </td>
      <td><label for="import_art"></label>
      <input type="text" name="import_art" id="import_art" /></td>

  </tr>
   <tr>
      <td>
          País de Origen
      </td>
      <td><label for="pais_art"></label>
      <input type="text" name="pais_art" id="pais_art" /></td>
  </tr>
   <tr>
      <td>
          Foto
      </td>
      <td><label for="pic_art"></label>
      <input type="text" disabled="disabled" name="pic_art" 
id="pic_art" /></td>
      <!-- El campo de la foto no lo vamos a usar por ahora -->

  </tr>
  <tr>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
      </tr>

      <tr>
      <td align="center "> <input type="reset" name="Borrar" 
id="Borrar" value="Borrar" /></td>
      <td align="center"> <input type="submit" name="enviar" 
id="enviar" value="Enviar" /></td>


      </tr>


  </table>

  </form>

</body>
</html>