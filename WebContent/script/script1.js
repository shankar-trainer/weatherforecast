function timer1(){
	console.log("timer called ")
x=10;
setInterval(() => {
document.getElementById('id1').innerHTML=--x;	
}, 1000);

}



function validate() {
		var id = document.getElementById('id').value
		var pass = document.getElementById('pass').value
		var repass = document.getElementById('repass').value
		var name = document.getElementById('name').value
		var email = document.getElementById('email').value
		var age = document.getElementById('age').value
		var country = document.getElementById('country').value
		var gender = document.getElementsByName('gender');

		var status = false;

		if (gender[0].checked)
			status = true;
		if (gender[1].checked)
			status = true;

		console.log("gender length " + gender.length)
		console.log("@ in email " + email.indexOf("@"))

		if (id == "") {
			document.getElementById('err_id').innerHTML = "id is blank"
			return false;
		} else if (!id.startsWith("accu_emp_")) {
			document.getElementById('err_id').innerHTML = "id doesn not start with accu_emp_"
			return false;
		}

		else if (id.match("^\\w+$") == null) {
			console.log('error in id')
			document.getElementById('err_id').innerHTML = "id cannot have special char except _"
			return false;
		}

		else if (name == "") {
			document.getElementById('err_name').innerHTML = "name is blank"
			return false;
		}

		else if (name.length < 9) {
			document.getElementById('err_name').innerHTML = "name can not be less than 8 chars"
			return false;
		}

		else if (!/([a-z]|[A-Z]+)\s([a-z]|[A-Z]+)/.test(name)) {
			document.getElementById('err_name').innerHTML = "name must be of two words"
			return false;
		} else if (status == false) {
			document.getElementById('err_gender').innerHTML = "select the gender"
			return false;
		} else if (pass == "") {
			document.getElementById('err_pass').innerHTML = "pass is blank"
			return false;
		}
		// ^[A-Za-z]\w{7,15}$
		else if (pass.match("^[A-Za-z]\\w{7,15}$") == null) {
			document.getElementById('err_pass').innerHTML = "pass must start with alphabet of length 7 to 15 and can have alphabets and numbers with _ "
			return false;
		}

		else if (repass == "") {
			document.getElementById('err_repass').innerHTML = "repass is blank"
			return false;
		} else if (pass != repass) {
			document.getElementById('err_repass').innerHTML = "password not  matching repassword "
			return false;
		}

		else if (email == "") {
			document.getElementById('err_email').innerHTML = "email is blank"
			return false;
		}

		else if (!email.endsWith(".com")) {
			document.getElementById('err_email').innerHTML = "email must ends with .com"
			return false;
		}

		else if (!(email.indexOf("@") >= 0)) {
			document.getElementById('err_email').innerHTML = "email must have  @ sign"
			return false;
		}

		else if (age == "") {
			document.getElementById('err_age').innerHTML = "age is blank"
			return false;
		} else if (!(/[0-9]+/.test(age))) {
			document.getElementById('err_age').innerHTML = "age must be numeric "
			return false;
		}

		else if (country == "") {
			document.getElementById('err_country').innerHTML = "country is blank"
			return false;
			//([a-z]|[A-Z]+)/.test("india")
		} else if (!/([a-z]|[A-Z]+)/.test(country)) {
			document.getElementById('err_country').innerHTML = "country  can not contain  numeric value"
			return false;
		} else
			return true;
	}


function Unix_timestamp(t) {
        // make a new date based on unix time and add 12 hours to it
        var dt = new Date((t * 1000) + (12 * 3600));
        // set the month (add one since index starts at 0)
        var month = dt.getMonth() + 1;
        // set the day
        var day = dt.getDate();
        // set the full year
        var year = dt.getFullYear();

        // return the string that I want
        return (`${month}/${day}/${year}`);  
    }


var getJSON = function(url) {

		var xhr = new XMLHttpRequest();
		xhr.open('GET', url, true)
		xhr.responseType = 'json'
		
		xhr.onload = function() {
			var status = xhr.status
			if (status == 200) {
				console.log("called..")
				data = xhr.response

				var weatherIcon = `https://openweathermap.org/img/wn/${data.weather[0].icon}@2x.png`
				document.getElementById('current-weather-div').style.display = "block"
				var myDate = new Date(data.dt * 1000);
				document.getElementById('weather-icon').src = weatherIcon
				document.getElementById('description').innerHTML = data.weather[0].description
				document.getElementById('city-header').innerHTML = data.name
						+ " " + `${myDate.toDateString()}`

				document.getElementById('city-temp').innerHTML = data.main.temp+" "+'&deg;C;'
				
				document.getElementById('city-humidity').innerHTML = data.main.humidity
				document.getElementById('city-wind-speed').innerHTML = data.wind.speed

				// ==================== uv idex
				var lat = data.coord.lat
				var lon = data.coord.lon
               	 
				var url1 = "http://api.openweathermap.org/data/2.5/uvi?APPID=9497495fcb2dd582affb661398fb07ad&lat="
						+ lat + "&lon=" + lon

				var xhreq = new XMLHttpRequest();
				xhreq.open('GET', url1, true)
				xhreq.onreadystatechange = function() {
					if (xhreq.readyState == 4 && xhreq.status == 200) {
						data = xhreq.responseText
						var obj = JSON.parse(data)

						document.getElementById("city-UV").innerHTML = obj.value
						// document.getElementById("city-UV").style.color
						// ="#ffffff"
					}
				};
				xhreq.send(null)
				// ===============================end of uvi

				// ==========================start forecast
				    document.getElementById("forecast").innerHTML=""
				
				const proxyurl = "https://cors-anywhere.herokuapp.com/";
				const url2 = "http://localhost:9090/Ajax/notused/hello.html"; // site
																				// that
				fetch(proxyurl + url2) // https://cors-anywhere.herokuapp.com/https://example.com
				.then(response => response.text())
				.then(contents => console.log(contents))
				.catch(() => console.log("Can’t access " + url2 + " response. Blocked by browser?"))

				
				 // header.append('Access-Control-Allow-Origin','http://localhost:3000');
                // header.append('Access-Control-Allow-Credentials', 'true');
				// --
				// header('Access-Control-Allow-Headers: *');
               // header('Access-Control-Allow-Headers: Origin, Content-Type,
				// X-Auth-Token');


				url3 = "https://api.openweathermap.org/data/2.5/forecast?q="+data.name+"&units=imperial&appid=f4465c08026d2de3e9ae72cb65313ea1"
			console.log("city is "+data.name)
					var xhreq1 = new XMLHttpRequest();
					xhreq1.open('GET', url3, true)
					xhreq1.onreadystatechange = function() {
						if (xhreq1.readyState == 4 && xhreq1.status == 200) {
							data1 = xhreq1.responseText
							var data = JSON.parse(data1)
							document.getElementById('weather-forecast-div').style.display = "block"
						
								 console.log("forecast called  "+data.list.dt)
								
				                var dayIndex = 6;
				                
			                for (var i = 0; i < 5; i++) {
				                    // set a current day variable
				                    var curDay;

				                    // if the dayIndex gets higher than 38
				                    if (dayIndex >= 39) {
				                        // then set curDay to the list's 39
										// index value
				                        curDay = data.list[39]
				                    } else {
				                        // if not, then set the index to what
										// dayIndex is at this iteration
				                        curDay = data.list[dayIndex];
				                    };

				                    // set the date variable using the selected
									// day's unix time via my Unix_timestamp
									// function
				                    var date = Unix_timestamp(curDay.dt);
				                    console.log
				                    // set the weatherIcon src url
				                    var weatherIcon1 = `https://openweathermap.org/img/wn/${curDay.weather[0].icon}@2x.png`;
				    
				                    // set the HTML to append
				                    var dateHTML = `
				                    <div class="col-sm card bg-primary text-white m-2">
				                    <strong>${date}</strong>
				                    <img src="${weatherIcon1}" alt="${curDay.weather[0].main}" width="50px" />
				                    <p>Temp: ${curDay.main.temp}\xB0 F</p>
				                    <p>Humidity: ${curDay.main.humidity}%</p>
				                    </div>
				                    `;
				               
				                    
				    document.getElementById("forecast").innerHTML+=dateHTML
				                    // increment the dayIndex
				                    dayIndex += 8;
				                }
						}
					};
					xhreq1.send(null)
			// ================================= end of
			// forecast=======================
			}
		};
		xhr.send()
	};
	
	function disp() {
		var city = document.getElementById('city').value
		console.log("city is "+city)
		if (city == "")
			document.getElementById('city_err').innerHTML = "City is blank"
		else {
			document.getElementById('city_err').innerHTML = ""

			url = "http://api.openweathermap.org/data/2.5/weather?q=" + city
					+ "&APPID=9497495fcb2dd582affb661398fb07ad&units=metric"
			getJSON(url);
		}
	}