<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	var getJSON = function(url) {

		var xhr = new XMLHttpRequest();
		xhr.open('GET', url, true)
		xhr.responseType = 'json'

		xhr.onload = function() {
			var status = xhr.status
			if (status == 200) {
				data = xhr.response
				document.getElementById('id1').style.visibility = "visible"

				var cord1 = "Longitude " + data.coord.lon + "<br>Latitude"
						+ data.coord.lat
				document.getElementById('cord').innerHTML = cord1

				document.getElementById('city2').innerHTML = data.name

				var weather = "Id " + data.weather[0].id + "<br>Main"
						+ data.weather[0].main + "<br>Description"
						+ data.weather[0].description
				document.getElementById('wea').innerHTML = weather

				var main = "Temperature " + data.main.temp + "&deg;<br>Min "
						+ data.main.temp_min + "&deg;<br>Max "
						+ data.main.temp_max + "&deg;<br>Pressure "
						+ data.main.pressure + "<br>Sea Level "
						+ data.main.sea_level + "<br>Ground Level"
						+ data.main.grnd_level

				document.getElementById('main').innerHTML = main

				var wind = "Speed" + data.wind.speed + "<br>Degree "
						+ data.wind.deg

				document.getElementById('wind').innerHTML = wind

			}

		};
		xhr.send()
	};

	function disp() {
		var city = document.getElementById('city').value
		if (city == "")
			document.getElementById('city_err').innerHTML = "City is blank"
		else {
			url = "http://api.openweathermap.org/data/2.5/weather?q=" + city
					+ "&APPID=9497495fcb2dd582affb661398fb07ad&units=metric"
			getJSON(url);
		}
	}
</script>

</head>
<body>

	<form>
		<input id="city" placeholder="Enter City Name"> <span
			id="city_err"></span> <br> <input type="button" value="search"
			onclick="disp()">
	</form>

	<div id='city1'></div>

	<div id="id1" style="visibility: hidden">

		<h2>City Name</h2>
		<div id='city2'></div>

		<h2>Coordinates</h2>
		<div id="cord"></div>

		<h2>Weather</h2>
		<div id="wea"></div>

		<h2>Main</h2>
		<div id="main"></div>



		<h2>Wind</h2>
		<div id="wind"></div>

		<h2>Rain</h2>

		<div id="wind"></div>
	</div>
</body>
</html>