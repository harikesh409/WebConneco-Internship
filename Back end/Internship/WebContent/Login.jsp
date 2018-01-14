<%@page import="oracle.jdbc.rowset.OracleCachedRowSet"%>
<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css">
<style type="text/css">
sup {
	color: red;
}
</style>
</head>
<body class="text-center">
	<h2>Login</h2>
	<form action="Login.jsp" method="post">
		<div class="form-group">
			<label for="uname">Username:<sup>*</sup></label> <input type="text"
				name="uname" id="uname" value="${param.uname}" class="form-control"
				required />
		</div>
		<div class="form-group">
			<label for="pass">Password:<sup>*</sup></label> <input
				type="password" name="pass" id="pass" class="form-control" required />
		</div>
		<input type="submit" value="Login" class="btn btn-primary btn-block" />
	</form>
	<a href="Reg.jsp" target="_blank">Don't have an account?</a>
	<%
		if ((session.getAttribute("uname") == null) || (session.getAttribute("uname") == "")) {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				OracleCachedRowSet crs = new OracleCachedRowSet();
				crs.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
				crs.setUsername("hr");
				crs.setPassword("hr");
				String uname = request.getParameter("uname");
				String pass = request.getParameter("pass");
				crs.setCommand("select * from users where uname=? and pass=?");
				crs.setString(1, uname);
				crs.setString(2, pass);
				crs.execute();
				int c = crs.size();
				if (c == 1) {
					session.setAttribute("uname", uname);
					response.sendRedirect("success.jsp");
					// 				request.setAttribute("Message", "You are successfully logged into your account");
					// 				getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
					// 				out.println("<h2>You are successfully logged into your account");
				} else
					out.println("Please check your username and password");

			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} else {
			response.sendRedirect("success.jsp");
		}
	%>
</body>
</html>