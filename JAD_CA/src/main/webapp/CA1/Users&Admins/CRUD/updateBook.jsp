<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Book</title>
</head>
<body>

	<%@ include file="/CA1/header.jsp"%>

	<h2>Create New Book</h2>
	<form action="/JAD_CA/CreateBookServlet" method="post">
		<label for="bookID">Book ID:</label> <input type="text" id="bookID"
			name="bookID" required><br> <br> <label for="title">Title:</label>
		<input type="text" id="title" name="title" required><br>
		<br> <label for="author">Author:</label> <input type="text"
			id="author" name="author" required><br> <br> <label
			for="publisher">Publisher:</label> <input type="text" id="publisher"
			name="publisher" required><br> <br> <label
			for="quantity">Quantity:</label> <input type="number" id="quantity"
			name="quantity" required><br> <br> <label
			for="price">Price:</label> <input type="number" id="price"
			name="price" step="0.01" required><br> <br> <label
			for="category">Category:</label> <select id="category"
			name="category" required>
			<option value="1">Comedy</option>
			<option value="2">Thriller</option>
			<option value="3">Action</option>
		</select><br> <br> <input type="submit" value="Create Book">
	</form>
	<%
	Integer record = (Integer) request.getAttribute("record");
	if (record != null) {
		if (record != 0) {
			out.print("Successfully inserted user!");
		} else {
			out.print("<br>Some error occured!");
		}
	}
	%>
	
	
	<a href="<%=request.getContextPath()%>/CA1/Users&Admins/profile">Go back to profile</a>
	
</body>
</html>