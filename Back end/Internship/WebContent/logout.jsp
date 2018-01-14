<%
session.setAttribute("uname", null);
session.invalidate();
response.sendRedirect("Login.jsp");
%>