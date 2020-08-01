<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%   
String name=request.getParameter("name");

session.setAttribute("name", name);
System.out.print("name is "+name);
%>
hello name is <%=name %><br>
hello name is <%=session.getAttribute("name") %>


</body>
</html>