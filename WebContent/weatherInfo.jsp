<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link
	href="https://kit-free.fontawesome.com/releases/latest/css/free-v4-shims.min.css"
	media="all" rel="stylesheet">
<link
	href="https://kit-free.fontawesome.com/releases/latest/css/free-v4-font-face.min.css"
	media="all" rel="stylesheet">
<link
	href="https://kit-free.fontawesome.com/releases/latest/css/free.min.css"
	media="all" rel="stylesheet">
<link rel="stylesheet" href="css/style.css" type="text/css">
<title>Weather App</title>

<script type="text/javascript" src="script/script1.js">
	
</script>
<script src="script/Chart.js">
		
</script>

</head>
<body>

	<!-- Main container -->
	<div class="container-fluid">
		<!-- Header -->
		<header class="text-center bg-dark text-white p-3">
			<h1>My Weather App</h1>
		</header>

		<main class="row"> <!-- Search Column -->
		<section class="col-md-4 pr-0 mb-3">
			<div class="card bg-light p-1 border-0">
				<div class="card-body">
					<div class="row">
						<label for="search-input" class="font-weight-bold col-12 pl-0">Search
							for a City</label> <input id="city" type="text"
							class="form-control col-8" placeholder="Delhi"
							aria-label="Recipient's username" aria-describedby="basic-addon2">
						<span id="city_err"></span>
						<button id="search-btn" class="btn btn-primary col-2 p-1"
							onclick="disp()">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>

				<!-- List to render search history -->
				<ul class="list-group list-group-flush border" id="search-history">

				</ul>

				<!-- Loading div -->
				<div id="loading" class="hide">
					<p>Loading...</p>
				</div>
			</div>
		</section>

		<!-- Weather response column -->
		<section class="col-lg-8">
			<!-- Section to display current weather -->
			<section class="card hide p-3" id="current-weather-div">
				<!-- City header -->
				<h2 id="city-header" class="card-title"></h2>

				<span> <img alt="" src="" id="weather-icon" /> <span
					id="description"></span>
				</span>
				<div class="card-body">
					<!-- City temperature -->
					<div>
						Temperature: <span id="city-temp"></span>
					</div>

					<!-- City Humidity -->
					<div>
						Humidity: <span id="city-humidity"></span>%
					</div>

					<!-- City Wind Speed -->
					<div>
						Wind Speed: <span id="city-wind-speed"></span> MPH
					</div>

					<!-- City UV Index -->
					<div>
						UV Index: <span id="city-UV" class="p-1 rounded"
							style="background-color: aqua"></span>
					</div>
				</div>
			</section>

			<!-- Section for 5 Day Forecast -->
			<section class="card border-0 my-2 hide" id="weather-forecast-div">
				<!-- Forecast Title -->
				<h3 class="card-title">5-Day Forecast:</h3>
				<div class="card-body">
					<!-- Div row to append the forecast -->
					<div class="row" id="forecast"></div>
				</div>
			</section>
			
			<section>
			
			<canvas id="bar-chart" width="200" height="250" >
			</canvas>
			</section>
			
						<section>
			<canvas id="bar-chart1" width="200" height="250" >

			</canvas>
			</section>
			
		</section>

		</main>
	</div>
</body>
</html>