<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%@page import="org.json.JSONObject"%>
	<%@page import="org.json.JSONArray"%>

	<%
		String s1 = "";

		JSONObject jsonObject = new JSONObject(s1.substring(1));
		String[] names = JSONObject.getNames(jsonObject);
		JSONArray jsonArray = jsonObject.toJSONArray(new JSONArray(names));

		out.print(Arrays.toString(names));
	%>
</body>
</html>