<?php
	session_start();
	if (isset($_GET["submit"])) {
		$connection = new mysqli("localhost", "slaughtered", "e3FSNdZjY4", "slaughtered_swiper");
		$logincodestored = hash("sha256", $_SESSION["logincode"], false);

		$getposterid = $connection->prepare("select poster_id from login_poster where id=?;");
		$getposterid->bind_param("s", $logincodestored);
		$getposterid->execute();
		$posterid = $getposterid->get_result()->fetch_array(MYSQLI_NUM)[0];

		$getcompany = $connection->prepare("select company from posters where id=?;");
		$getcompany->bind_param("i", $posterid);
		$getcompany->execute();
		$company = $getcompany->get_result()->fetch_array(MYSQLI_NUM)[0];

		$addjob = $connection->prepare("insert into jobs (posted_date, title, company_title, location, minimum_education, description, requirements, field, type, poster_id, status) values (NOW(),?,?,?,?,?,?,?,?,?,'active');");
		$addjob->bind_param("ssssssssi", $_POST["title"], $company, $_POST["location"], $_POST["education"], $_POST["description"], $_POST["requirements"], $_POST["field"], $_POST["type"], $posterid);
		$addjob->execute();
		header("Location: jobs.php");
	}
?>
<head>
	<title>Swiper.Space - Add Job</title>
	<link rel="stylesheet" type="text/css" href="default.css">
</head>
<body>
	<div id = "logo">
		<img src="images/logo.png" alt="Why hello there" height = 8%>
	</div>
	<div id = "form" >
	<form action="addjob.php?submit=true" method="post">
		Job Title: <input type="text" name="title"><br />
		Location: <input type="text" name="location"><br />
		Field: <input type="text" name="field"><br />
		Type:<br />
		<select name="type">
			<option value="Full-time">Full-time</option>
			<option value="Part-time">Part-time</option>
			<option value="Seasonal">Seasonal</option>
			<option value="Internship">Internship</option>
			<option value="Contractor">Contractor</option>
		</select><br />
		Minimum Education:<br />
		<select name="education">
			<option value="None">None</option>
			<option value="High School/GED">High School/GED</option>
			<option value="Associates">Associate's Degree</option>
			<option value="Bachelors">Bachelor's Degree</option>
			<option value="Masters">Master's Degree</option>
			<option value="Doctorate">Doctorate</option>
		</select><br />
		Description:<br />
		<textarea name="description"></textarea><br />
		Requirements:<br />
		<textarea name="requirements"></textarea><br />
		Tags: <input type="text" name="tags">
		<button type="submit" value="Submit">Submit</button>
	</form>
	</div>
</body>
