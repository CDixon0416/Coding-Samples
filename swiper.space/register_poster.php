<head>
	<title>Swiper.Space - Register Poster</title>
	<link rel="stylesheet" type="text/css" href="default.css">
</head>
<body>
	<?php
		if ($_GET["err"] == "conn") {
			echo '<p id="error">Could not connect to the database!</p>';
		} elseif ($_GET["err"] == "inuse") {
			echo '<p id="error">Email is in use!</p>';
		} elseif ($_GET["err"] == "pass") {
			echo '<p id="error">Passwords do not match!</p>';
		}
	?>
	<div id = "logo">
			<img src="images/logo.png" alt="Why hello there" height = 8%>
	</div>
	<div id = "form">
	<form action="register_finish_poster.php" method="post">
		Company : <input type="text" pattern=".{1,}" name="company"><br />
		E-mail: <input type="email" name="email"><br />
		Password: <input type="password" name="password"><br />
		Confirm Password: <input type="password" name="confirm"><br />
		<button type="submit" value="submit">Submit</button>
	</form>
	</div>
</body>
