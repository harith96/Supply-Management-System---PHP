<?php
/**
 * Created by PhpStorm.
 * User: Harith
 * Date: 11/29/2018
 * Time: 1:17 AM
 */
require_once("../inc/pdo.inc.php");

if(isset($_POST['submit'])) {
    unset($_POST['submit']);
    foreach ($_POST as $key => $value) {
        $ship_check = [];
        if (!array_search($value, $ship_check)) {
            $sql = "SELECT * FROM shipments WHERE train_id = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->execute(array($value));
            if (!$stmt->rowCount()) {
                $sql = "INSERT INTO shipments () VALUES ()";
            }
        }
    }
}