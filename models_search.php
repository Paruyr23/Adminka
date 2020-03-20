<?php
include "includes/connect.php";

if(isset($_POST['query'])){
    $inputText = $_POST['query'];
    $query = "SELECT `models`.* FROM `models` WHERE `models_name` LIKE '%$inputText%'";
    $result = $conn->query($query);
    $row = $result->fetchAll(PDO::FETCH_ASSOC);

    echo "<thead>
<tr>
    <th>#</th>
    <th>Name</th>
    <th>Categories Name</th>
    <th>Publication Time</th>
    <th>Update Time</th>
    <th>Action</th>
</tr>
</thead>";
    foreach ($row as $key => $value){
        ?>
        <?php include "includes/models_table_search.php" ?>
        <?php
    }

}
?>