<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Book"%>
<%@ page import="java.util.List"%>


<!DOCTYPE html>
<html>
<head>
  <title>Bookstore - Cart</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CA1/style.css">
</head>
<body>
	<%@ include file="/CA1/header.jsp"%>
  <div class="container">
    <h1>Cart</h1>
	<table>
		<tr>
			<th>Book ID</th>
			<th>Title</th>
			<th>Author</th>
			<th>Publisher</th>
			<th>Quantity</th>
			<th>Price</th>
			<th>Category ID</th>
		</tr>

		<%
		
		// Retrieve the ArrayList from the session
		List<Book> bookList = (List<Book>) session.getAttribute("book");

		// Display the book details --

		for (Book book : bookList) {
		%>
		<tr>
			<td><%=book.getBookID()%></td>
			<td><%=book.getTitle()%></td>
			<td><%=book.getAuthor()%></td>
			<td><%=book.getPublisher()%></td>
			<td><%=book.getQuantity()%></td>
			<td><%=book.getPrice()%></td>
			<td><%=book.getCategory() %></td>
		</tr>
		<%
		}
		%>
	</table>
	<br>
	<a href="buyBook.jsp">Add more books</a>
  </div>

</body>
</html>