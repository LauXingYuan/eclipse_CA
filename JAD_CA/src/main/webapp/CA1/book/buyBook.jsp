<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bookstore - buyBook</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CA1/style.css">
</head>
<body>
	<%@ include file="/CA1/header.jsp"%>
	<div class="container">
		<h1>Buy Book</h1>

		<form action="add2Cart.jsp" method="post">
			<label for="bookID">Book ID:</label> <input type="text" id="bookID"
				name="bookID" required><br> <br>
			<br> <label for="title">Title:</label> <input type="text"
				id="title" name="title" required><br> <br>
			<br> <label for="author">Author:</label> <input type="text"
				id="author" name="author" required><br> <br>
			<br> <label for="publisher">Publisher:</label> <input
				type="text" id="publisher" name="publisher" required><br>
			<br>
			<br> <label for="quantity">Quantity:</label> <input
				type="number" id="quantity" name="quantity" required><br>
			<br>
			<br> <label for="price">Price:</label> <input type="number"
				id="price" name="price" step="0.01" required><br> <br>
			<br> <label for="categoryID">Category ID:</label> <input
				type="text" id="price" name="categoryID" required><br>
			<br>
			<br> <input type="submit" value="Create">
		</form>
	</div>
</body>
</html>