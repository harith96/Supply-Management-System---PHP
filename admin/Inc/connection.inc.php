<?php
/**
 * Created by PhpStorm.
 * User: Harith
 * Date: 11/27/2018
 * Time: 7:37 PM
 */
	$connection = mysqli_connect('localhost','root','','kindersmart');
	if(mysqli_connect_errno()){
        echo "Connection failed! ". mysqli_connect_error();
        die();
    }

 ?>