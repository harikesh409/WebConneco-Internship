<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Success</title>
</head>
<body>
	<%
		if ((session.getAttribute("uname") == null) || (session.getAttribute("uname") == "")) {
	%>
	You are not logged in
	<a href="Login.jsp">Please Login</a>
	<%
		} else {
			%>
			Welcome <%=session.getAttribute("uname")%><p/>
			<a href="logout.jsp">Log Out</a>
			<%
		}
	%>


</body>
</html>