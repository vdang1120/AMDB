<?php

require './Database.php';
require './viewer.php';

class Service {

    function fetchViewers() {
		
		$dbObject = new Database();
		$dbConnection = $dbObject->getDatabaseConnection();

        $sql = "SELECT * FROM viewer";

		$stmt = $dbConnection->prepare($sql);
		$stmt->setFetchMode(PDO::FETCH_CLASS, 'viewer');

		if ($stmt->execute()){
			return $stmt->fetchAll();
		} else{
			return 'Failed';
		}
	}

    function addViewer() {
        $ViewerId = $_POST['ViewerId'];
        $Name = $_POST['name'];
        $Sex = $_POST['sex'];
        $EMAIL = $_POST['email'];
        $Age = $_POST['age'];
        $CITY = $_POST['city'];
        $StateAb = $_POST['state'];

        $dbObject = new Database();
		$dbConnection = $dbObject->getDatabaseConnection();

        // Check if ID already exists
        $checkSql = "SELECT ViewerId FROM viewer WHERE ViewerId = ?";
        $checkStmt = $dbConnection->prepare($checkSql);
        $checkStmt->execute([$ViewerId]);
        
        if ($checkStmt->fetch()) {
            echo "Error: Viewer ID $ViewerId already exists!";
            return;
        }

        $sql = "INSERT INTO viewer (`ViewerId`,`Name`,`Sex`,`EMAIL`,`Age`,`CITY`,`StateAb`) VALUES (?,?,?,?,?,?,?)";

		$stmt = $dbConnection->prepare($sql);
        if ($stmt->execute([$ViewerId, $Name, $Sex, $EMAIL, $Age, $CITY, $StateAb])) {
            // The primary key value will be auto-incremented by the database
        } else {
            return 'Failed';
        }
        header("Location:");
    }

    function deleteViewer() {
        $ViewerId = $_POST['ViewerId'];

        $dbObject = new Database();
		$dbConnection = $dbObject->getDatabaseConnection();

        $sql = "DELETE FROM viewer WHERE ViewerId=" .$ViewerId;
        $stmt = $dbConnection->query($sql);
        
        header("Location:");
    }

    function updateViewer() {
        $ViewerId = $_POST['ViewerId'];
        $name = $_POST['name'];

        $dbObject = new Database();
		$dbConnection = $dbObject->getDatabaseConnection();

        $sql = "UPDATE viewer SET Name='" . $name ."' WHERE ViewerId=". $ViewerId;
        $stmt = $dbConnection->query($sql); 

        header("Location:");
    }

    function searchViewer() {
        $dbObject = new Database();
		$dbConnection = $dbObject->getDatabaseConnection();

        if (!empty($_POST['ViewerId'])) {
            $sql = "SELECT * FROM viewer WHERE ViewerId = ?";
            $stmt = $dbConnection->prepare($sql);
            $stmt->execute([$_POST['ViewerId']]);
        } else {
            $sql = "SELECT * FROM viewer WHERE Name = ?";
            $stmt = $dbConnection->prepare($sql);
            $stmt->execute([$_POST['Name']]);
        }
        
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}

