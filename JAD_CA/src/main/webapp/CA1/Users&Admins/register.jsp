<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%
	String errCode = request.getParameter("errCode");
	if(errCode != null){
		if(errCode.equals("duplicate")){
			out.print("Error! Duplicate Entry");
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../style.css">

</head>
<body>
	<%@ include file="/CA1/header.jsp"%>

<div class="container">
<h1>Register</h1>
<form action="createUser.jsp">
	<label for="email">Email</label>
	<input id="email" type="text" name="email" required><br>
	<label for="username">Username</label>
	<input id="username" type="text" name="username" required><br>
	<label for="password">Password</label>
	<input id="passowrd" type="password" name="password" required><br>
	<button type="submit">Register</button>
</form>
<a href="login.jsp">Back to login</a>
</div>
</body>
</html>