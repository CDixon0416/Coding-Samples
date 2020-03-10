<head>
	<title>Swiper.Space - Register</title>
	<link rel="stylesheet" type="text/css" href="default.css">
</head>
<body>
	<div id="content">
		<div id = "logo">
			<img src="images/logo.png" alt="Why hello there" height = 8%>
		</div>
		<?php
			if ($_GET["err"] == "conn") {
				echo '<p id="error">Could not connect to the database!</p>';
			} elseif ($_GET["err"] == "inuse") {
				echo '<p id="error">Email is in use!</p>';
			} elseif ($_GET["err"] == "pass") {
				echo '<p id="error">Passwords do not match!</p>';
			}
		?>
		<div id = "form">
			<form action="register_finish.php" method="post">
				First Name: <br /><input type="text" pattern=".{1,}" name="first_name" placeholder="John"><br />
				Last Name: <br /><input type="text" pattern=".{1,}" name="last_name" placeholder="Doe"><br />
				E-mail: <br /><input type="email" name="email" placeholder="sample@email.domain"><br />
				Phone: <br /><input type="tel" name="phone" placeholder="XXX-XXX-XXXX"><br />
				Type of phone:
				<br /><select name="type">
					<option value="Mobile">Mobile</option>
					<option value="Home">Home</option>
					<option value="Work">Work</option>
				</select><br />
				Preferred Contact method:
				<br /><select name="contact">
					<option value="Phone - by text">Phone, by text</option>
					<option value="Phone - by call">Phone, by call</option>
					<option value="E-mail">E-mail</option>
					<option value="No Preference">No Preference</option>
				</select><br />
				Password: <br /><input type="password" name="password" placeholder="Avoid reusing passwords"><br />
				Confirm Password: <br /><input type="password" name="confirm"><br />
				Zip Code: <br /><input type="zip" name="zip"placeholder="XXXXX"><br />
				Distance to look:<br />
				<input type="range" min="1" max="100" value="25" name="distance"><br />
				<button type="submit" value="submit">Submit</button>
			</form>
		</div>
	</div>
</body>
