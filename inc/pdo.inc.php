<?php
/**
 * Created by PhpStorm.
 * User: Harith
 * Date: 11/28/2018
 * Time: 1:43 PM
 */

function getConnection($user,$pass){
    $servername = "5ab0aac0.ngrok.io";
    $username = $user;
    $password = $pass;

    try {
        $pdo = new PDO("mysql:host=$servername;dbname=sms", $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    }
    catch(PDOException $e) {
        return "Connection failed: " . $pdo->errorInfo(2);
    }
}