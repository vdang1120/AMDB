<?php
require './Service.php';
$service = new Service();

if ($_SERVER["REQUEST_METHOD"] == "POST"){
    if (isset($_POST['Delete'])) {
        $service->deleteViewer();
    } elseif (isset($_POST['Add'])) {
        $service->addViewer();
    } elseif (isset($_POST['Update'])) {
        $service->updateViewer();
    } elseif (isset($_POST['Search'])) {
        $service->searchViewer();
    }
}

$Viewers = $service->fetchViewers();
?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AMDBs</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../static/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
        integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
        crossorigin="anonymous" />
    <style>
    .forms-container {
        display: flex;
    }

    form {
        flex: 1;
    }

    fieldset {
        height: 100%;
    }

    table,
    th,
    td {
        border: 1px solid black;
    }
    </style>
</head>

<body>
    <h1>AMDB - Viewers</h1>
    <table>
        <thead>
            <tr>
                <th>ViewerId</th>
                <th>Name</th>
                <th>Sex</th>
                <th>Email</th>
                <th>Age</th>
                <th>City</th>
                <th>State</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($Viewers as $viewer) : ?>
            <tr>
                <td><?= htmlspecialchars($viewer->ViewerId); ?></td>
                <td><?= htmlspecialchars($viewer->Name); ?></td>
                <td><?= htmlspecialchars($viewer->Sex); ?></td>
                <td><?= htmlspecialchars($viewer->EMAIL); ?></td>
                <td><?= htmlspecialchars($viewer->Age); ?></td>
                <td><?= htmlspecialchars($viewer->CITY); ?></td>
                <td><?= htmlspecialchars($viewer->StateAb); ?></td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <!-- <?php foreach ($Viewers as $viewer) : ?>
        
        <p><?= htmlspecialchars($viewer->Name); ?></p>
    <?php endforeach; ?> -->
    <br>
    <div class="forms-container">
        <form method="post">
            <fieldset>
                <legend>Add Viewer</legend>
                <input type="text" name="ViewerId" placeholder="ID" required><br>
                <input type="text" name="name" placeholder="Name" required><br>
                <input type="text" name="sex" placeholder="Sex" required><br>
                <input type="email" name="email" placeholder="Email" required><br>
                <input type="number" name="age" placeholder="Age" required><br>
                <input type="text" name="city" placeholder="City" required><br>
                <input type="text" name="state" placeholder="State" required><br>
                <input type="submit" name="Add" value="Add Viewer">
            </fieldset>
        </form>

        <form method="post">
            <fieldset>
                <legend>Delete Viewer</legend>
                <input type="number" name="ViewerId" placeholder="ID"><br>
                <input type="text" name="Name" placeholder="Name"><br>
                <input type="submit" name="Delete" value="Delete">
            </fieldset>
        </form>

        <form method="post">
            <fieldset>
                <legend>Update Viewer</legend>
                <input type="number" name="ViewerId" placeholder="ID" required><br>
                <input type="text" name="Name" placeholder="New Name" required><br>
                <input type="submit" name="Update" value="Update">
            </fieldset>
        </form>

        <form method="post">
            <fieldset>
                <legend>Search Viewer</legend>
                <input type="number" name="ViewerId" placeholder="ID"><br>
                <input type="text" name="Name" placeholder="Name"><br>
                <input type="submit" name="Search" value="Search">
                <br>
                <?php if (isset($_POST['Search'])):
                    $results = $service->searchViewer();
                    if ($results):
                        foreach ($results as $result): ?>
                <br>
                <div>
                    <b>ID:</b> <?= $result['ViewerId'] ?><br>
                    <b>Name:</b> <?= $result['Name'] ?><br>
                    <b>Sex:</b> <?= $result['Sex'] ?><br>
                    <b>Email:</b> <?= $result['EMAIL'] ?><br>
                    <b>Age:</b> <?= $result['Age'] ?><br>
                    <b>City:</b> <?= $result['CITY'] ?><br>
                    <b>State:</b> <?= $result['StateAb'] ?>
                </div>
                <?php endforeach; ?>
                <?php else: ?>
                <br>
                <div>Viewer not found</div>
                <?php endif; ?>
                <?php endif; ?>
            </fieldset>
        </form>

    </div>
</body>

</html>