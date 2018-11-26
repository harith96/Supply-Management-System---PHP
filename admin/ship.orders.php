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
    $ship_check = [];
    foreach ($_POST as $key => $value) {
        if (!array_search($value, $ship_check)) {
            $sql = "SELECT * FROM shipments WHERE train_id = ?";
            $stmt = $pdo->prepare($sql);
            $stmt->execute(array($value));

            $sql = "SELECT _day FROM train_schedule";
            if (!$stmt->rowCount()) {
                $sql = "INSERT INTO shipments (shipment_id,train_id,_date,status,capacity_left) VALUES ()";
            }
        }
    }
}