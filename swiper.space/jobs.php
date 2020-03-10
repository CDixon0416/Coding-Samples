<?php
	
?>
<head>
	<title>Swiper.Space - Jobs List</title>
	<link rel="stylesheet" type="text/css" href="default.css">
</head>
<body>
	<div id = "logo">
		<img src="images/logo.png" alt="Why hello there" height = 8%>
	</div>
	<!--<div id="job">	
		<h2>Position Title</h2>
		<h2>Field</h2>
		<h3>Location (address)</h3>
		<h3>type</h3>
		<p>Minimum Education</p>
		<p>description<br />this job fuckin sucks dicks</p>
		<p>requirements<br />a penis</p>
	</div>
	<div id="job">	
		<h2>Software Engineer</h2>
		<h2>Computer Science</h2>
		<h3>1234 bing bong place, Lakeland, FL 33805</h3>
		<h3>Full-Time</h3>
		<p>Minimum Education: Bachelors</p>
		<p>We need someone to code out app, pls</p>
		<p>Requirements:<br />Know how to code PHP, JS, Python</p>
	</div>-->
	<div>
		<input type="button" value="Hide Job Listing" onclick="window.location.href = '/?type=seeker'" id="jobbutton" /><br />
		<input type="button" value="Remove Job Listing" onclick="window.location.href = '/?type=seeker'" id="jobbutton" /><br />
		<input type="button" value="Show Job Listing" onclick="window.location.href = '/?type=seeker'" id="jobbutton" /><br />
		<input type="button" value="Go Back" onclick="window.location.href = '/?type=seeker'" id="jobbutton" /><br />

		<div id = "form">
			<h2>Name</h2>
			<h3>Preferred Field</h3>
			<p>Description</p>
			<input type="button" value="View Resume" onclick="window.location.href = '/?type=seeker'" id="button" /><br />
			<p>Date Applied</p>
		</div>
		<div id = "form">
			<h2>John Doe</h2>
			<h3>Social Sciences</h3>
			<p>I like to cook and make memes</p>
			<input type="button" value="View Resume" onclick="window.location.href = '/?type=seeker'" id="button" /><br />
			<p>Applied: 01/26/2020</p>
		</div>
	</div>
</body>
