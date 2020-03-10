<?php
	if ($_POST["password"] != $_POST["confirm"]) {
		header("Location: register.php?err=pass");
		exit();
	}
	$connection = new mysqli("localhost", "slaughtered", "e3FSNdZjY4", "slaughtered_swiper");
	if ($connection->connect_error) {
		header("Location: register.php?err=conn");
		exit();
	}
	$testem = $connection->prepare("select email from seekers where email = ?;");
	$testem->bind_param("s", $_POST["email"]);

	$testem->execute();
	$testem2 = $testem->get_result();
	if ($testem2->num_rows > 0) {
		header("Location: register.php?err=inuse&");
		exit();
	}
	$salt = substr(md5(microtime()),rand(0,26),7);
	$password = hash("sha256", $_POST["password"].$salt, false);
	$insert = $connection->prepare("insert into seekers (first_name, last_name, distance, email, password, salt, preferred_contact, zip) values (?,?,?,?,?,?,?,?);");
	$insert->bind_param("ssissssi", $_POST["first_name"], $_POST["last_name"], $_POST["distance"], $_POST["email"], $password, $salt, $_POST["contact"], $_POST["zip"]);
	$insert->execute();
	echo $insert->error;
	$getid = $connection->prepare("select id from seekers where email = ?");
	$getid->bind_param("s", $_POST["email"]);
	$getid->execute();
	$activation = $getid->get_result()->fetch_array(MYSQLI_NUM)[0];
	
	$insert2 = $connection->prepare("insert into activation_seeker (seeker_id) values (?)");
	$insert2->bind_param("i", $activation);
	$insert2->execute();

	$getid2 = $connection->prepare("select id from activation_seeker where seeker_id = ?");
	$getid2->bind_param("s", $activation);
	$getid2->execute();
	$activation2 = $getid2->get_result()->fetch_array(MYSQLI_NUM)[0];

	$ret = mail($_POST["email"], "Swipe.Space activation", "Activation address: http://www.swipe.space/activation?id=".$activation2, "From: noreply@swipe.space");
	echo $ret;
?>
<head>
	<title>Swiper.Space - Register Finish</title>
	<link rel="stylesheet" type="text/css" href="default.css">
</head>
<body>
	<div id = "logo">
		<img src="images/logo.png" alt="Why hello there" height = 8%>
	</div>
	<h1 id = "message">
		<a href="/login.php">Please check your email for activation code.</a>
	</h1>
</body>