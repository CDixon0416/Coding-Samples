<?php
	$loggedin = false;
	$username = "";
	if (session_status() !== PHP_SESSION_ACTIVE && isset($_COOKIE["logincode"])) {
		$connection = new mysqli("localhost", "slaughtered", "e3FSNdZjY4", "slaughtered_swiper");
		$logincodestored = hash("sha256", $_COOKIE["logincode"], false);
		$startsess = $connection->prepare("select seeker_id from login_seeker where id=?;");
		$startsess->bind_param("s", $logincodestored);
		$startsess->execute();
		$namedata = $startsess->get_result()->fetch_array(MYSQLI_NUM)[0];
		if (isset($namedata)) {
			session_start();
			$_SESSION["logincode"] = $_COOKIE["logincode"];
			$startsess2 = $connection->prepare("select first_name from seekers where id=?;");
			$startsess2->bind_param("i", $namedata);
			$startsess2->execute();
			$_SESSION["name"] = $startsess2->get_result()->fetch_array(MYSQLI_NUM)[0];
		}
	}
?>
<head>
	<title>Swiper.Space</title>
	<style>
		*
		{
			font-family:coolvetica;
		}
		body
		{	
			background-color:#094511;
		}
		#form 
		{	
			margin-top:2%;
			margin-left:35%;
			width:30%;
			text-align:center;
			font-size:30px;
			background-color:white;
			border-radius:10px;
			align:center;
		}
		@font-face
		{
			font-family:coolvetica;
			src:url("coolvetica rg.ttf");
		}
		#logo
		{
			width:100%;
			background-color:gray;
			border-radius:10px;
			img-align:center;
		}
		#button
		{
			font-size:18px;
			height:50px;
			width:100px;
			margin-top:2%;
			margin-bottom:2%;
		}
	</style>
</head>
<body>
	<div id = "logo">
		<img src="images/logo.png" alt="Why hello there" height = 8%>
	</div>
	<?php
		if (session_status() === PHP_SESSION_ACTIVE) {
			echo "Hello, ".$_SESSION["name"].", welcome back!";
		} elseif ($_GET["type"] == "seeker") {
			echo "<br /><div id = \"form\"><h2>Welcome!</h2><input type=\"button\" value=\"Log in\" onclick=\"window.location.href = '/login.php'\" id=\"button\"/><br />
			<input type=\"button\" value=\"Register\" onclick=\"window.location.href = '/register.php'\" id=\"button\"/>";
		} elseif ($_GET["type"] == "poster") {
			echo "<br /><div id = \"form\"><h2>Welcome!</h2><input type=\"button\" value=\"Log in\" onclick=\"window.location.href = '/login_post.php'\" id=\"button\"/><br />
			<input type=\"button\" value=\"Register\" onclick=\"window.location.href = '/register_post.php'\" id=\"button\" />";
		} else {
			echo "<br /><div id = \"form\"><h2>Welcome! <br />Are you a job...</h2>
			<input type=\"button\" value=\"Seeker\" onclick=\"window.location.href = '/?type=seeker'\" id=\"button\" /><br />
			<input type=\"button\" value=\"Poster\" onclick=\"window.location.href = '/?type=poster'\"id=\"button\" /></div>";
		}
	?>
	<?php

	?>
	
</body>
