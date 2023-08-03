<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Book"%>
<%@ page import="java.util.List"%>



<!DOCTYPE html>
<html>
<head>
<title>Bookstore - Profile</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/CA1/style.css">

</head>
<body>
	<%@ include file="/CA1/header.jsp"%>

	<%
	String role = "user";
	System.out.println(request.getAttribute("books").getClass().getName());
	List<Book> books = (List<Book>) request.getAttribute("books");
	if (books != null) {
	%>
	<div>
		<table>
			<thead>
				<tr>
					<th>Book ID</th>
					<th>Title</th>
					<th>Author</th>
					<th>Publisher</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Category</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (int i = 0; i < books.size(); i++) {
					Book book = books.get(i);
				%>
				<tr>
					<td><%=book.getBookID()%></td>
					<td><%=book.getTitle()%></td>
					<td><%=book.getAuthor()%></td>
					<td><%=book.getPublisher()%></td>
					<td><%=book.getQuantity()%></td>
					<td><%=book.getPrice()%></td>
					<td><%=book.getCategory()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>


	<%
	} else {
	out.println("This means that books is null");
	}
	%>


	<a href="/CA1/Users&Admins/profile">Go back to profile</a>
</body>
</html>