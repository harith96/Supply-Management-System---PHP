<?php
	include_once('db.php');	
	
	$emp = $_GET['emp'];
	$weekno = $_GET['weekno'];
	$workhours = $_GET['workhours'];
	

	$result=mysqli_query($db,"INSERT INTO employee_work_data (employee_id ,week_no,workhours) values ('$emp','$weekno','$workhours');");
	
	if ($result){
		echo "Succesfully Saved";
	}else{
		echo "Error occured";
	}
	
?>