<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	function disp() {
		console.log("called")
		var name = document.getElementById("name").value
		//if (name != " ")
		{
			url3 = "city2.jsp?name=" + name;
			var xhreq1 = new XMLHttpRequest();
			xhreq1.open('GET', url3, false)
			xhreq1.onreadystatechange = function() {
				if (xhreq1.readyState == 4 && xhreq1.status == 200) {
					console.log("called  ......")
					data1 = xhreq1.responseText
					document.getElementById("id2").innerHTML = data1
				};
			}
				xhreq1.send(null);
		}
	}
</script>

</head>
<body>

	<form>
		<input name="name" id="name" placeholder="enter name"> <br>
		<input type="button" value="send" onclick="disp()">
	</form>
	<br>
	<br>
	<br>
	<br>

	<%
		String name = (String) session.getAttribute("name");

		if (name != null)
			out.print("name is ...." + name);
	%>
	<br>

	<div id="id2"></div>
</body>
</html>