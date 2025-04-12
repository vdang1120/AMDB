<?php

require './Service.php';

$service = new Service();

if ($_SERVER["REQUEST_METHOD"] == "POST"){
    $result = $service->updateViewer(); 
}
?>

<!DOCTYPE html>
<html>
<head>
<title> Update Viewer </title>
    </head>
    <body>
        <form method="post">
        <fieldset>
            <legend> Update Viewer</legend>

            <input type="text" name="ViewerId" placeholder="ID"></br>

            <input type="text" name="name" placeholder="Name" ></br>

            <input id="button" type="submit" name="submit">
        </fieldset>
        <!-- <?= htmlspecialchars($result); ?> -->
    </body>

</html>