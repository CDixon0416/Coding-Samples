<head>
	<title>Swiper.Space - Activation</title>
	<link rel="stylesheet" type="text/css" href="default.css">
	<?php
		$connection = new mysqli("localhost", "slaughtered", "e3FSNdZjY4", "slaughtered_swiper");
		if ($connection->connect_error) {
			echo "error";
			exit();
		}
		$getactivation = $connection->prepare("select seeker_id from activation_seeker where id=?;");
		$getactivation->bind_param("i", $_GET["id"]);
		$getactivation->execute();
		$id = $getactivation->get_result()->fetch_array(MYSQLI_NUM)[0];
		
		$activate = $connection->prepare("update seekers set status='activated' where id=? and status='unactivated';");
		$activate->bind_param("i", $id);
		$activate->execute();
	?>
</head>

<body>
	<div id = "logo">
		<img src="images/logo.png" alt="Why hello there" height = 8%>
	</div>
	<h1 id = "message">
		<a href="/login.php">You have successfully registered.</a>
	</h1>
</body>