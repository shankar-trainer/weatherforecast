<!DOCTYPE html>
<%@page import="java.util.Arrays"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
<link rel="stylesheet" href="../css/style.css" type="text/css">
<title>Weather App</title>

<!-- <script type="text/javascript" src="../script/script1.js">
 -->
<script type="text/javascript">
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

	let data = "";
	let data1 = "";

	url3 = "https://api.openweathermap.org/data/2.5/forecast?q=delhi&units=imperial&appid=f4465c08026d2de3e9ae72cb65313ea1"
	var xhreq1 = new XMLHttpRequest();
	xhreq1.open('GET', url3,false)
	//xhreq1.responseType = 'json'
		
	
	xhreq1.onreadystatechange = function() {
		if (xhreq1.readyState == 4 && xhreq1.status == 200) {

			data1 = xhreq1.responseText
	//		console.log("data1......"+data1)
			data = JSON.parse(data1)
//			console.log("data......" + data)
		}
	};
	xhreq1.send(null)
		//console.log("........... data1......  "+data1)
		//console.log("........... data......  "+data)
//=====================================================
	var p=JSON.stringify(data1)
	
	url4 = "test33.jsp?q=data"+p
			
	var xhreq2 = new XMLHttpRequest();
	xhreq2.open('GET', url4, false)
	//xhreq2.responseType = 'json'
	
	//console.log(JSON.stringify(data1))
			//console.log("url 4 called  "+data1)
	
	xhreq2.onreadystatechange = function() {
		if (xhreq2.readyState == 4 && xhreq2.status == 200) {

			 var s=xhreq2.responseText
			console.log("data1......inside "+data1)
			//data = JSON.parse(data1)
		}
	};
	//xhreq2.send(null)
	
	
	
	
</script>
</head>

<body>

	<section class="card border-0 my-2 hide" id="weather-forecast-div">
		<!-- Forecast Title -->
		<h3 class="card-title">5-Day Forecast:</h3>
		<div class="card-body">
			<!-- Div row to append the forecast -->
			<div class="row" id="forecast"></div>
		</div>
	</section>
	
	<%@page import="org.json.JSONObject"%>
	<%@page import="org.json.JSONArray"%>
	<%
/* 		String s1 = "<script>document.write(data1)</script>";
		String s2 = "<script>document.write(data)</script>";
				//s1.substring(beginIndex)
				System.out.print(s1.substring(23,27));
			out.print(s1.substring(23,28));
				for(int x=0;x<=30;x++)
					out.print("<br>"+x+"  "+s1.charAt(x));

				
				
				out.print("<br><hr>"); */
				//out.print(s1);
				//out.print(s1.substring(1));
		//	out.print(s2);
/* 
	 	JSONObject jsonObject = new JSONObject(s1.substring(1));
		String[] names = JSONObject.getNames(jsonObject);
		JSONArray jsonArray = jsonObject.toJSONArray(new JSONArray(names));

		out.print(Arrays.toString(names));    */
	%>
</body>
</html>