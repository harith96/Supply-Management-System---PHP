<?php
/**
 * Created by PhpStorm.
 * User: Harith
 * Date: 11/28/2018
 * Time: 1:40 PM
 */
session_start();

if(isset($_POST['email']) && isset($_POST['password'])) {
    $email = trim($_POST['email']);
    $password = $_POST['password'];

    require_once("../inc/connection.inc.php");
    $pdo = getConnection("root","");

    if ((!(empty($email) || empty($password)) && filter_var($email, FILTER_VALIDATE_EMAIL))) {
        $hashed_password = sha1($password);
        try{
        $sql = "SELECT * FROM user WHERE email = ':email' and password = $hashed_password";
        $stmt = $pdo->prepare($sql);
        $stmt->execute(array(
            ":email" => $email
        ));
        } catch(PDOException $e){
            $stmt->errorInfo()[2];
        }
        $result = $stmt->rowCount();
        if (mysqli_num_rows($result)) {
            $array = mysqli_fetch_assoc($result);
            $_SESSION['uid'] = $array['uid'];
            $_SESSION['type'] = $array['acc_type'];
            $_SESSION['email'] = $array['email'];
            if (isset($_POST['remember'])) {
                setcookie('uid', $array['uid'], time() + 60 * 60 * 24 * 30, "/");
                setcookie('type', $array['acc_type'], time() + 60 * 60 * 24 * 30, "/");
            }
            if (!$array['pass_changed']) {
                header("Location: changepassword-front.php");
                exit;
            }
            switch ($array['acc_type']) {
                CASE 'parent':
                    $_SESSION['parent'] = new KinderParent($_SESSION['uid']);
                    header("Location: ../parent");
                    break;

                CASE 'admin':
                    $_SESSION['admin'] = new KinderAdmin($_SESSION['uid']);
                    header("Location: ../admin");
                    break;

                CASE 'teacher':
                    $_SESSION['teacher'] = new KinderTeacher($_SESSION['uid']);
                    header("Location: ../teacher");
                    break;
            }
        } else {
            $_SESSION['login'] = 'error';
            header("Location: form.php");
        }
    } else {
        $_SESSION['login'] = 'invalidemail';
        header("Location: form.php");
    }
}


?>