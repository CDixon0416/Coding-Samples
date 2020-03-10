<?php
	session_start();
	if (isset($_POST["email"])) {
		$connection = new mysqli("localhost", "slaughtered", "e3FSNdZjY4", "slaughtered_swiper");
		$getsalt = $connection->prepare("select salt, password, id from posters where email=?;");
		$getsalt->bind_param("s", $_POST["email"]);
		$getsalt->execute();
		$result = $getsalt->get_result()->fetch_array(MYSQLI_NUM);
		$salt = $result[0];
		$password = hash("sha256", $_POST["password"].$salt, false);
		if ($password == $result[1]) {
			$logincode = hash("sha256", microtime(), false);
			$logincodestored = hash("sha256", $logincode, false);
			$alc = $connection->prepare("insert into login_poster (id, poster_id, expires) values (?,?, ADDTIME(NOW(), '336:0:0.0'));");
			$alc->bind_param("si", $logincodestored, $result[2]);
			$alc->execute();
			$_SESSION["logincode"] = $logincode;
			if (isset($_POST["stayloggedin"])) {
				setcookie("logincode", $logincode, time() + (86400*14), "/");
			}
			echo "Logged in successfully";
		} else {
			echo "E-mail or password does not exist on the server";
		}
	}
?>
<head>
	<title>Swiper.Space - Login</title>
	<link rel="stylesheet" type="text/css" href="default.css">
	
</head>
<body>
	<div id = "logo">
		<img src="images/logo.png" alt="Why hello there" height = 8%>
	</div>
	<div id = "form">
		<form action="login_poster.php" method="post">
			E-mail: <input type="email" name="email"><br />
			Password: <input type="password" name="password"><br />
			Stay logged in? <input type="checkbox" name="stayloggedin" value="1" id="login"><br />
			<button type="submit" value="submit">Submit</button>
		</form>
	</div>
</body>
