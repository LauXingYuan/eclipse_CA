<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User"%>


<%
User user = (User) request.getAttribute("user");
if (user != null) {
	session.setAttribute("user", user);
	System.out.println(user);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Bookstore - Profile</title>
<link rel="stylesheet" href="../style.css">

</head>
<body>
	<%@ include file="/CA1/header.jsp"%>

	<div class="container">
		<h1>Profile</h1>
		<div class="profile-buttons">
			<%
			if (session.getAttribute("loggedInUser") == null) {
			%>
			<a href="login.jsp" class="button">Login</a> <a href="register.jsp"
				class="button">Register</a>
			<%
			} else {
			%>
			<a href="logout.jsp" class="button">Logout</a>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>