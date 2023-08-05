<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Book"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>



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
	%>
	<form action="" method="get">
		<input type="number" name="minQuantity"
			placeholder="Enter minimum stock quantity">
		<button type="submit">Search</button>
	</form>
	<%
	 int minQuantity = 5; // Default value
    String minQuantityParam = request.getParameter("minQuantity");
    if (minQuantityParam != null && !minQuantityParam.isEmpty()) {
        minQuantity = Integer.parseInt(minQuantityParam);
    }

    List<Book> filteredBooks = new ArrayList<>();
    if (filteredBooks != null) {
        for (int i = 0; i < books.size(); i++) {
            if (books.get(i).getQuantity() < minQuantity) {
            	Book book = books.get(i);
                filteredBooks.add(book);
            }
        }
    }
    %>
	<% if (!filteredBooks.isEmpty()) { %>
	<div style="margin-top: 20px;">
		<h3>
			Books with Low Stock (Less than
			<%= minQuantity %>
			quantity)
		</h3>
		<ul>
			<%
            for (Book book : filteredBooks) {
            %>
			<li><%= book.getTitle() %> (<%=book.getQuantity() %> left)</li>
			<%
            }
            %>
		</ul>
	</div>
	<% } else { %>
	<div style="margin-top: 20px;">
		<h3>No books with low stock found.</h3>
	</div>
	<% } %>
	
	<%
	if (books != null) { %>
	<div>
		<table style="border-collapse: collapse; width: 100%;">
			<thead>
				<tr>
					<th style="border: 1px solid black;">Book Cover</th>
					<th style="border: 1px solid black;">Book ID</th>
					<th style="border: 1px solid black;">Title</th>
					<th style="border: 1px solid black;">Author</th>
					<th style="border: 1px solid black;">Publisher</th>
					<th style="border: 1px solid black;">Quantity</th>
					<th style="border: 1px solid black;">Price</th>
					<th style="border: 1px solid black;">Category</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (int i = 0; i < books.size(); i++) {
					Book book = books.get(i);
				%>
				<tr>
					<td
						style="border: 1px solid black; text-align: center; vertical-align: middle; display: flex; justify-content: center; align-items: center;"><img
						src="<%=book.getImageUrl()%>" alt="Book Cover"
						style="max-width: 100px; height: auto;"></td>
					<td style="border: 1px solid black;"><%=book.getBookID()%></td>
					<td style="border: 1px solid black;"><%=book.getTitle()%></td>
					<td style="border: 1px solid black;"><%=book.getAuthor()%></td>
					<td style="border: 1px solid black;"><%=book.getPublisher()%></td>
					<td style="border: 1px solid black;"><%=book.getQuantity()%></td>
					<td style="border: 1px solid black;"><%=book.getPrice()%></td>
					<td style="border: 1px solid black;"><%=book.getCategory()%></td>
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


	<a href="<%=request.getContextPath()%>/CA1/Users&Admins/profile">Go
		back to profile</a>
</body>
</html>