<?php



  require 'database.php';


  $message = '';



  if (!empty($_POST['usuario_nombre']) && !empty($_POST['usuario_pass'])) {

    $sql = "INSERT INTO usuario (usuario_nombre, usuario_pass,idtipo_usu) VALUES (:usuario_nombre, :usuario_pass, :idtipo_usu)";

    $stmt = $conn->prepare($sql);

    $stmt->bindParam(':usuario_nombre', $_POST['usuario_nombre']);

    $usuario_pass = password_hash($_POST['usuario_pass'], PASSWORD_BCRYPT);

    $stmt->bindParam(':usuario_pass', $usuario_pass);

    $stmt->bindParam(':idtipo_usu', $_POST['idtipo_usu']);



    if ($stmt->execute()) {

      $message = 'Successfully created new user';

    } else {

      $message = 'Sorry there must have been an issue creating your account';

    }

  }

?>

<!DOCTYPE html>

<html>

  <head>

    <meta charset="utf-8">

    <title>SignUp</title>

    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">

    <link rel="stylesheet" href="assets/css/style.css">

  </head>

  <body>



    <?php //require 'partials/header.php' ?>



    <?php if(!empty($message)): ?>

      <p> <?= $message ?></p>

    <?php endif; ?>



    <h1>SignUp</h1>

    <span>or <a href="login.php">Login</a></span>



    <form action="signup.php" method="POST">

      <input name="usuario_nombre" type="text" placeholder="Enter your user name">
     
      <input name="usuario_pass" type="password" placeholder="Enter your password">
<br>
      <input name="confirm_usuario_pass" type="password" placeholder="Confirm user password">
<br>
    <p>Seleccione tipo usuario:</p>
      <select name="idtipo_usu">
        <option value="0">Seleccione:</option>
        <?php
          $query = $conn->prepare("SELECT * FROM tipo_usu");
          $query->execute();

          while ($valores= $query->fetch(PDO::FETCH_ASSOC)) {
            echo '<option value="'.$valores[idtipo_usu].'">'.$valores[tipo_usu_desc].'</option>';
           }
           ?>
      </select>
<br>

      <input type="submit" value="Submit">

    </form>

 </body>

</html>