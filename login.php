<?php



  //session_start();

 if (isset($_SESSION['user_id'])) {

   header('Location: login.php');

  }

  require 'database.php';



  if (!empty($_POST['usuario_nombre']) && !empty($_POST['usuario_pass'])) {

    $records = $conn->prepare('SELECT idusuario, usuario_nombre, usuario_pass, idtipo_usu FROM usuario WHERE usuario_nombre = :usuario_nombre');

    $records->bindParam(':usuario_nombre', $_POST['usuario_nombre']);

    $records->execute();

    $results = $records->fetch(PDO::FETCH_ASSOC);
    

    $message = '';



    if (count($results) > 0 && $results['idtipo_usu']=1 && password_verify($_POST['usuario_pass'], $results['usuario_pass'])) {
            $_SESSION['user_id'] = $results['idusuario'];
            header("Location: prueba.php");

         } else {
      //:header("Location: login.php");
      $message = 'Lo siento, usuario o contraseña incorrecta';
      echo '<script language="javascript">alert("Error de autentificacion");window.location.href="login.php"</script>';

    }

  }



?>



<!DOCTYPE html>

<html>

  <head>

    <meta charset="utf-8">

    <title>Login</title>

    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">

 
  </head>

  <body>

   <?php require 'partials/header.php' ?>


  <!-- <link rel="stylesheet" href="assets/css/style.css">-->

    <?php if(!empty($message)): ?>

      <p> <?= $message ?></p>

    <?php endif; ?>
 <section id="banner">
            <!--<img src="img/conjunto.png">-->

            <img src="img/admin.png">
            <div class="container">
                <h2>Conjunto Habitacional Mi Casa</h2>
            </div>
        </section>
<section id="servicios">

    <h3>Usuario Administrador</h3>

    <!--<span>or <a href="signup.php">SignUp</a></span>-->



    <form action="login.php" method="POST">

      <input name="usuario_nombre" type="text" placeholder="Ingrese su usuario">

      <input name="usuario_pass" type="password" placeholder="Ingrese su password">

      <input type="submit" value="Ingresar">

    </form>
</section>
  </body>

</html>