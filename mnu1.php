<?php
// Include the database configuration file
 require 'database.php';

function categoryTree($parent_id = 0, $sub_mark = ''){
    global $conn;
    $query = $conn->prepare("SELECT * FROM operaciones WHERE operaciones_padre = $parent_id ORDER BY operaciones_desc ASC");
    $query->execute();

    if (count($query) > 0){
        while($row = $query->fetch(PDO::FETCH_ASSOC)){
            echo '<option value="'.$row['idoperaciones'].'">'.$sub_mark.$row['operaciones_desc'].'</option>';
            categoryTree($row['idoperaciones'], $sub_mark.'---');
        }
    }
}

?>
<select name="category">
    <?php categoryTree(); ?>

</select>
