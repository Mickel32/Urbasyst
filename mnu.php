<!DOCTYPE html>

<html>
<head>

    <meta charset="utf-8">

   <title>UrbaSyst</title>
   
	<link rel="shortcut icon" href="img/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">

     <link rel="stylesheet" href="css/fontello.css">
   <link rel="stylesheet" href="css/estilos.css">
 </head>
<body>
	
<header>
        <div class="container">
             
            <h1> <img src="img/favicon.png"> UrbaSyst</h1>

            <input type="checkbox" id="menu-bar">
            <label class="icon-menu" for="menu-bar"></label>
            <nav class="menus">
                <ul id="menus">
                    <li><a href="index.php">Inicio</a></li>
                    
                                        
                </ul>

        </div>
    </header>

	 <main class="main">
        <section id="banner">
            <img src="img/conjunto.png">
            <div class="container">
                <h2>Conjunto Habitacional Mi Casa</h2>
                </div>
   </section>

    

     <section id="servicios">
            <h4>Menú Administración</h4>
            
         
      
  <?php



  require 'database.php';
  

$sql = $conn->prepare("SELECT idoperaciones, operaciones_desc, operaciones_link, operaciones_padre FROM operaciones ORDER BY operaciones_padre, idoperaciones");




    $sql->execute();

   
// Create an array to conatin a list of items and parents
$menus = array(
        'items' => array(),
        'parents' => array()
);
// Builds the array lists with data from the SQL result
while ($items =$sql->fetch(PDO::FETCH_ASSOC)) {
        // Create current menus item id into array
        $menus['items'][$items['idoperaciones']] = $items;
        // Creates list of all items with children
        $menus['parents'][$items['operaciones_padre']][] = $items['idoperaciones'];
}
// Print all tree view menus 
echo createTreeView(0, $menus);

?>

<?php
// function to create dynamic treeview menus
function createTreeView($parent, $menu) {
   $html = "";
   if (isset($menu['parents'][$parent])) {
      $html .= "
      <ol class='tree'>";
       foreach ($menu['parents'][$parent] as $itemId) {
          if(!isset($menu['parents'][$itemId])) {
             $html .= "<li>
><a href='".$menu['items'][$itemId]['operaciones_link']."'>"
.$menu['items'][$itemId]['operaciones_desc']."</a>
 <input type='checkbox' name='subfolder2'/></li>";
          }
          if(isset($menu['parents'][$itemId])) {
             $html .= "
             <li><a href='".$menu['items'][$itemId]['operaciones_link']."'>".$menu['items'][$itemId]['operaciones_desc']
."</a><input type='checkbox' name='subfolder2'/>";
             $html .= createTreeView($itemId, $menu);
             $html .= "</li>";
          }
       }
       $html .= "</ol>";
   }
   return $html;
}

?>

</section>
      </main>      
     

    <footer>
        <div class="container">
            <p class="copy">Syst S.C.C</p>

        </div>
        <div class="social">
             <a class = "icon-facebook" href="https://www.facebook.com/Syst-100858474749385/"></a>
             <a class = "icon-instagram"href="https://www.instagram.com/syst_s.a/"></a>
             <a class = "icon-youtube" href="https://www.youtube.com/channel/UCDlLeZbHaztglm9PX7WFYow"></a>
        </div>
    </footer>
</body>


</html>
