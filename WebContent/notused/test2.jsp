<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		var x = 10;
		alert(x)
	</script>
	<%
		//Gson gson = new Gson();
		URL url = new URL("https://api.openweathermap.org/data/2.5/forecast?q=delhi&units=imperial&appid=f4465c08026d2de3e9ae72cb65313ea1");
		BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
		String str = "";
		while (null != (str = br.readLine())) {
			System.out.println(str);
		}

		//-------------------Converting to JsonObject using Json--------------------------------------------------

		JsonObject jsonObject = new JsonParser().parse(str).getAsJsonObject();

		out.print(jsonObject);
		
		//JsonArray feature = (JsonArray) jsonObject.get("features");

		//				JsonObject jsonObject = new JsonParser().parse(str).getAsJsonObject();

		//("http://localhost/json/product.json"); InputStreamReader reader = new InputStreamReader(url.openStream()); StringBuilder builder = new StringBuilder(); int x; while ((x = reader.read()) != -1) { builder.append((char) x); }
	%>
</body>
</html>