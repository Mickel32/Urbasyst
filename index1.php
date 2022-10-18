<?php

  session_start();



  require 'database.php';


 

  if (isset($_SESSION['user_id'])) {

    $records = $conn->prepare('SELECT idusuario, usuario_nombre, usuario_pass FROM usuario WHERE idusuario = :idusuario');

    $records->bindParam(':idusuario', $_SESSION['user_id']);

    $records->execute();

    $results = $records->fetch(PDO::FETCH_ASSOC);


 $user = null;



    if (count($results) > 0) {

      $user = $results;

    }

  }

?>



<!DOCTYPE html>

<html>

  <head>

    <meta charset="utf-8">

   <title>Welcome to you WebApp</title>

    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">

    <link rel="stylesheet" href="assets/css/style.css">

 

  <body>

    <?php require 'partials/header.php' ?> 


    <?php if(!empty($user)): ?>

      <br> Welcome. <?= $user['usuario_nombre']; ?>

      <br>You are Successfully Logged In

      <a href="logout.php">

        Logout

      </a>

    <?php else: ?>

      <h1>Please Login or SignUp </h1>



      <a href="login.php">Login</a> or

      <a href="signup.php">SignUp</a>

    <?php endif; ?>
<footer>

        <div class="container">
            <p class="copy">Copyrigth &copy 2019</p>
        </div>
        <div class="social">
             <a class = "icon-facebook" href="https://www.facebook.com/Syst-100858474749385/"></a>
             <a class = "icon-instagram"href="https://www.instagram.com/syst_s.a/"></a>
             <a class = "icon-youtube" href="https://www.youtube.com/channel/UCDlLeZbHaztglm9PX7WFYow"></a>
        </div>
    </footer>


  </body>
</html>