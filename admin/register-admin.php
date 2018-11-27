<?php
/**
 * Created by PhpStorm.
 * User: Harith
 * Date: 11/27/2018
 * Time: 7:36 PM
 */
require_once ("Inc/connection.inc.php");

session_start();

if (isset($_POST['submit'])) {
    $fname = $_POST['fname'];
    $lname = $_POST['lname'];
    $nic = $_POST['nic'];
    $email = $_POST['email'];
    $add_no = $_POST['add_no'];
    $street = $_POST['street'];
    $city1 = $_POST['city1'];
    $city2 = $_POST['city2'];
    $zip = $_POST['zip'];
    $password = $_POST['password'];

    if (empty($fname) or empty($ini_name) or empty($nic) or empty($email) or empty($address) or empty($tele_no) or empty($mobile_no)) {
        $_SESSION['admin_reg'] = 'empty';
        header("Location: registration.admin.php");
    }

    else if(!(filter_var($email,FILTER_VALIDATE_EMAIL))){
        autofill($salutation,$full_name,$ini_name,$nic,$email,$address,$tele_no,$mobile_no);
        $_SESSION['admin_reg'] = 'invalidemail';
        header("Location: registration.admin.php");

    }else if((1 === preg_match('~[0-9]~', $full_name)) or (1 === preg_match('~[0-9]~', $ini_name))){
        autofill($salutation,$full_name,$ini_name,$nic,$email,$address,$tele_no,$mobile_no);
        $_SESSION['admin_reg'] = 'invalidname';
        header("Location: registration.admin.php");

    }
    else{
        $query = "SELECT * FROM admin_db WHERE email='{$email}'";
        $result = mysqli_query($connection,$query);
        if(!mysqli_num_rows($result)){
            $query = "SELECT * FROM super_table WHERE email='{$email}' and password='{$password}'";
            $result_set = mysqli_query($connection,$query);

            if(!(mysqli_num_rows($result_set))){

                $query = "INSERT INTO admin_db (salutation,full_name,ini_name,nic,email,address,tele_no,mobile_no) VALUES('{$salutation}','{$full_name}','{$ini_name}','{$nic}','{$email}','{$address}','{$tele_no}','{$mobile_no}')";

                $result = mysqli_query($connection,$query);

                if (!($result)) {
                    echo "<h1>Registration Failed!</h1>";
                }
                else{
                    $query = "SELECT id FROM admin_db where email = '{$email}'";
                    $result = mysqli_query($connection,$query);
                    $row = mysqli_fetch_assoc($result);

                    $query = "INSERT INTO super_table (email,password,uid,acc_type) VALUES ('{$email}','{$password}','{$row["id"]}','admin')";
                    $result = mysqli_query($connection,$query);
                    $_SESSION['admin_reg'] = 'successful';
                    header("Location: registration.admin.php?");
                }
            }
            else{
                $_SESSION['admin_reg'] = 'error';
                header("Location: registration.admin.php?");
            }
        }
        else{
            $_SESSION['admin_reg'] = 'email';
            header("Location: registration.admin.php?");
        }
    }
}
?>