<?php
/**
 * Created by PhpStorm.
 * User: Harith
 * Date: 11/27/2018
 * Time: 9:59 PM
 */
$servername = "localhost";
$username = "customer";
$password = "customer123";

try {
    $conn = new PDO("mysql:host=$servername;dbname=sms", $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected Successfully";
}
catch(PDOException $e)
{
    echo "Connection Failed: " . $e->getMessage();
}
?>