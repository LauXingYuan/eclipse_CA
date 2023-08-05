<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User"%>



<!DOCTYPE html>
<html>
<head>
<title>Bookstore - Profile</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/CA1/style.css">

</head>
<body>
	<script>
function submitForm() {
	  var form = document.createElement('form');
	  form.method = "get";
	  form.action = '<%=request.getContextPath()%>
	/BookServlet';

		// Add any additional form fields if needed

		document.body.appendChild(form);
		form.submit();
	}
</script>
	<%
	String role = "user";
	User user = (User) request.getAttribute("user");
	if (user != null) {
		int userID = user.getUserId();
		String username = user.getUsername();
		String email = user.getEmail();
		int roleID = user.getUserRole();
		if (roleID == 1) {
			role = "admin";
		} else {
			role = "user";
		}
		session.setAttribute("loggedInUser", "logged in");
		session.setAttribute("role", role);
		session.setAttribute("username", username);
		session.setAttribute("email", email);
	}
	%>
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
			<form action="/JAD_CA/LogoutServlet" method="get">
				<button type="submit">Logout</button>
			</form>
			Welcome,
			<%=session.getAttribute("username")%>
			Your role is:
			<%=role%>


			<%
			if (role.equals("admin")) {
			%>
			<div>
				<form action="/JAD_CA/ReadBookServlet" method="GET">
					<button type="submit" class="admin-buttons">Read Books</button>
				</form>

				<form action="<%=request.getContextPath()%>/CA1/Users&Admins/CRUD/createBook.jsp">
					<button type="submit" class="admin-buttons">Create Books</button>
				</form>

				<form action="<%=request.getContextPath()%>/CA1/Users&Admins/CRUD/updateBook.jsp">
					<button type="submit" class="admin-buttons">Update Books</button>
				</form>

				<form action="<%=request.getContextPath()%>/CA1/Users&Admins/CRUD/deleteBook.jsp">
					<button type="submit" class="admin-buttons">Delete Books</button>
				</form>
			</div>
			<%
			}
			}
			%>
		</div>
	</div>
</body>
</html>