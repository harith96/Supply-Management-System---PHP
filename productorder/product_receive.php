<?php
	include_once('db.php');	

	$result=mysqli_query($db,"SELECT * FROM products");
	
	$rows = array();

	while ($r = mysqli_fetch_assoc($result)) {
		array_push($rows,$r);
	}

	echo json_encode($rows);
	
?>