<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Bookstore - Genre</title>
<link rel="stylesheet" href="../style.css">

</head>
<body>
	<%@ include file="/CA1/header.jsp"%>

	<div class="container">
		<h1>Genre Page</h1>

		<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost:3306/jad_ca?user=root&password=ubuntu&serverTimeZone=UTC";
			Connection conn = DriverManager.getConnection(connURL);

			// Query to retrieve genre data
			Statement stmt = conn.createStatement();
			String sqlStr = "SELECT * FROM category";
			ResultSet rs = stmt.executeQuery(sqlStr);

			// Iterate over the result set and display genre data
			while (rs.next()) {
				String categoryName = rs.getString("categoryName");
				// ... retrieve other genre data

				// Display the genre information
				out.println("<h3>" + categoryName + "</h3>");
				// ... display other genre information
				out.println("<hr>");
			}

			// Close the result set, statement, and connection
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		%>
	</div>
</body>
</html>