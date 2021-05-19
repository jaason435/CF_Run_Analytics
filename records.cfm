<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" crossorigin="anonymous">
	<!---<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>--->
	<title>JRRA|Records</title>
</head>

<cfquery name="all_runs" datasource="runs">
       SELECT *
       FROM all_run_data
</cfquery>

<body>
	<div class="banner"></div>
	
	<div class="nav-background">
		<nav class="navbar navbar-expand-lg navbar-light">
		  <a class="navbar-brand" href="#" style="margin-right: 2.5em;">
			<img class="logo" src="logo-cropped.svg"></img>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Running Analysis
		  </a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		  </button>

		  <div class="collapse navbar-collapse" id="navbarSupportedContent" >
			<ul class="navbar-nav mr-auto">
			  <li class="nav-item active">
				<button type="button" class="btn  btn-md btn-block purple-btn" onclick="window.parent.location.href = window.location.origin + '/index.cfm'" >All Runs</button>
			  </li>&nbsp;
			  <li class="nav-item">
				<button type="button" class="btn  btn-md btn-block purple-btn" onclick="window.parent.location.href = window.location.origin + '/details.cfm'" >Run Details</button>
			  </li>&nbsp;
			  <li class="nav-item">
				<button type="button" class="btn  btn-md btn-block purple-btn" onclick="window.parent.location.href = window.location.origin + '/perWeek.cfm'">Per Week</button>
			  </li>&nbsp;
			  <li class="nav-item">
				<button type="button" class="btn  btn-md btn-block purple-btn" onclick="window.parent.location.href = window.location.origin + '/perMonth.cfm'">Per Month</button>
			  </li>&nbsp;
			  <li class="nav-item">
				<button type="button" class="btn  btn-md btn-block purple-btn purple-btn-active" onclick="window.parent.location.href = window.location.origin + '/records.cfm'">Records</button>
			  </li>&nbsp;
			</ul>
			<form class="form-inline my-2 my-lg-0">
			  <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
			  <button class="btn  btn-md purple-btn" type="submit" onclick="alert('Run search functionality coming soon!')";>Search</button>
			</form>
		  </div>
		</nav>
	</div>
	
	<div class="hero-content">
		<h1>Personal Records</h1>
	</div>	
	
	
	<div class="container">
		<div class="row">
			<div class="details-container">
				<div class="card border-purple mb-3" style="float:left;">
				  <div class="card-body text-primary" style="background-color:#989898">
				    <h5 class="card-title">1 Mile: 4:37</h5>
					<h5 class="card-title">2 Mile: 10:10</h5>
					<h5 class="card-title">5k: 17:30</h5>
					<h5 class="card-title">10k: 42:43</h5>
					<h5 class="card-title">Half Marathon: 1:37:33</h5>
					<h5 class="card-title">Full Marathon: 3:54:56</h5>
				  </div>
			</div>
		</div>
	</div>
</body>


					
<style>
body {background-color:#0F0418;}

.banner {
	background: url('https://pixy.org/src/479/4799927.jpg');
	background-position:center;
	background-size: 100vw;
	background-repeat: no-repeat;
	height: 32em;
	position: absolute;
	top:0;
	right: 0;
	left:0;
	bottom:0;
	z-index:-1;
}

.purple-btn {
	color: #fff;
    background-color: #7951A8;
    border-color: #7951A8;
}

.logo {
	height: 3.5em;
	width: 3.5em;
}

.nav-background {
	background: rgba(152,152,152, 0.6);
}

.hero-content {
	margin: 2em auto;
	max-width: 30em;
	min-height: 10em;
	background: rgba(101, 101, 101, 0.8);
	text-align: center;
}


.hero-content h1 {
	color: #fff; 
	padding: 1.5em 1.5em;
}

.hero-content h1:after{
	background-color: #f1b434;
	margin-top: .25em;
	height: .1875em;
	content: "";
	border-radius: .25em;
}

.purple-btn-active {
	color: #fff;
    background-color: #69369E;
    border-color: #69369E;
}

.table-dark-custom {
	background-color:#656565;
	
	color: #fff;
}

td,th {
	text-align:center;	
}

.card-title {
	color: #69369E;
}

.border-purple {
	border-color: #69369E;
}

.card-header {
	background-color:#656565;
	color:white;
}

.details-container {
	margin: 2em auto;
	float:left;
}
</style>



	
