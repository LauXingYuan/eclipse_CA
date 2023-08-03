<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String errCode = request.getParameter("errCode");
if (errCode != null) {
	if (errCode.equals("wrongPass")) {
		out.print("Error! Wrong Password!");
	} else if (errCode.equals("invalidEmail")) {
		out.print("Error! Email does not exist!");
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CA1/style.css">
</head>
<body>
	<%@ include file="/CA1/header.jsp"%>
	<h1>Login</h1>
	<form action="/JAD_CA/UserServlet" method="get">
		<label for="username">Username</label> <input id="username"
			type="text" name="username" required><br> <label
			for="email">Email</label> <input id="email" type="text" name="email"
			required><br> <label for="password">Password</label> <input
			id="password" type="password" name="password" required><br>
		<button type="submit">Login</button>
	</form>
	<p>
		Don't have an account? <a href="./register.jsp">Register </a> one now!
	
</body>
</html>