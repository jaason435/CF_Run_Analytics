<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" crossorigin="anonymous">
	<!---<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>--->
	<title>JRRA|PerMonth</title>
</head>

<cfquery name="all_runs" datasource="runs">
       SELECT *
       FROM all_run_data
</cfquery>

<cfquery name="this_run" datasource="runs">
       SELECT *
       FROM all_run_data
       WHERE dateString = "May 17, 2021, 12:30:33 PM"
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
				<button type="button" class="btn  btn-md btn-block purple-btn  purple-btn-active" onclick="window.parent.location.href = window.location.origin + '/perMonth.cfm'">Per Month</button>
			  </li>&nbsp;
			  <li class="nav-item">
				<button type="button" class="btn  btn-md btn-block purple-btn" onclick="window.parent.location.href = window.location.origin + '/records.cfm'">Records</button>
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
		<h1>Monthly Mileage</h1>
	</div>	
	
	<div class="container">
		<div class="row">
			<div class="details-container">
								
				<div class="row">
				    <div class="col-2">
				    	<h5 style="color:#898989;">Select Year</h5>
					    <div class="select">
					      <select>
					        <option>2020</option>
					      </select>
					      <div class="select__arrow"></div>
					    </div>
				    </div>
				    
					
					<div class="col-2">
						<h5 style="color:#898989;">Select Month</h5>
						<div class="select">
					      <select>
					        <option>December</option>
					      </select>
					      <div class="select__arrow"></div>
					    </div>
					</div>
					
					<div class="col-5">
						
					</div>
					
					<div class="col-3">
						<h5 style="color:#898989; text-align:center;margin-top:0.35em;">Number of Runs</h5>
						<h2 style="color:#69369E; text-align:center;"><b><cfOutput >#count-1#</cfOutput></b></h2>
						
					</div>
				</div>
				
				<!-- A crazy method of getting a newline character for use within writeOutput, etc.
				     Utilizes Java to create a new system object -->
				<cfset NL = CreateObject("java", "java.lang.System").getProperty("line.separator")>
				
				<cfscript>
				   // Get running data for cfchart
					
				   // Initialize variables
			       numOfRuns = all_runs.recordcount;
			       dec2020runs = [];
			       dec2020miles = [];
			       count = 1;
			       
			       // Get all dates for December 2020
			       // TODO: Replace month/year below with custom date value from dropdown.
			       //       To allow for custom month / year value
			       //
			       for ( i=1; i<=numOfRuns ; i++){
			       		rawDate = all_runs["DATESTRING"][i];
			       		dateObj = getDateObject(rawDate);
			       		if (Month(dateObj) == 12) {
			       			if (Year(dateObj) == "2020") {
			       				// Found a run with correct date/month!
			       				// Format the data and add to array for the chart
			       				dec2020runs[count] = dateFormat(dateObj, "DD"); 
			       				dec2020miles[count] = numberFormat(all_runs["DISTANCE"][i] * 0.621371, '__.00');		       				
			       				count = count + 1;
			       			}
			       		}
			       }
				</cfscript>

				<div class="center">
				<cfchart format="jpg" chartwidth="950" chartheight="500" title="Mileage for December 2020" foregroundcolor="000000" backgroundcolor="7951A8" >
					<cfchartseries type="Line" seriescolor="purple" serieslabel="Miles">
				       <cfloop index="i" from="#count-1#" to="1" step="-1">
				        <cfchartdata item="#dec2020runs[i]#" value="#dec2020miles[i]#">
				      </cfloop>
				      </cfchartseries>   
				</cfchart>
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

.center {
	margin:0em auto;
	text-align:center;
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




.select-custom {
	max-width:8em;
}
.dropdown-box {
	float:left;
}
.dropdown-month {
	margin-left:15em;
}




.select {
  position: relative;
  display: inline-block;
  margin-bottom: 15px;
  width: 100%;
}
.select select {
  display: inline-block;
  width: 100%;
  cursor: pointer;
  padding: 10px 15px;
  outline: 0;
  border: 0;
  border-radius: 0;
  background: #989898;
  color: #000000;
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
}
.select select::-ms-expand {
  display: none;
}
.select select:hover,
.select select:focus {
  color: black;
  background: grey;
}
.select select:disabled {
  opacity: 0.5;
  pointer-events: none;
}
.select__arrow {
  position: absolute;
  top: 16px;
  right: 15px;
  width: 0;
  height: 0;
  pointer-events: none;
  border-style: solid;
  border-width: 8px 5px 0 5px;
  border-color: #69369E transparent transparent transparent;
}
.select select:hover ~ .select__arrow,
.select select:focus ~ .select__arrow {
  border-top-color: #7951A8;
}
.select select:disabled ~ .select__arrow {
  border-top-color: grey;
}

</style>

<cfscript>

		function getDateObject(strDate) {
			
			firstSpace = find(" ", strDate)
			firstComma = find(",", strDate)
			
			mm = getMonthNumber(left(strDate, 3));
			dd = mid(strDate, firstSpace + 1, (firstComma - firstSpace) - 1);
			yyyy = mid(strDate, firstComma + 2, 4);

			dateObj = createDate(yyyy, mm, dd);
			
			return dateObj;
		};
		
		function getMonthNumber(mon) {
			switch (mon) {
				case "Jan":
					return 1;
					break;
				case "Feb":
					return 2;
					break;
				case "Mar":
					return 3;
					break;
				case "Apr":
					return 4;
					break;
				case "May":
					return 5;
					break;
				case "Jun":
					return 6;
					break;
				case "Jul":
					return 7;
					break;
				case "Aug":
					return 8;
					break;
				case "Sep":
					return 9;
					break;
				case "Oct":
					return 10;
					break;
				case "Nov":
					return 11;
					break;
				case "Dec":
					return 12;
					break;
				default:
					return 1;
					break;
			}
		}
	
	  
</cfscript>




	
