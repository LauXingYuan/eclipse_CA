<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>Bookstore - Home</title>
  <link rel="stylesheet" href="../style.css">
  
</head>
<body>
	<%@ include file="/CA1/header.jsp"%>
  <div class="container">
    <h1>Welcome to the Bookstore</h1>
    <% 
      try {
        Class.forName("com.mysql.jdbc.Driver");
        
        String connURL = "jdbc:mysql://localhost:3306/jad_ca?user=root&password=ubuntu&serverTimeZone=UTC";
        Connection conn = DriverManager.getConnection(connURL);

        // Query to retrieve book data
        Statement stmt = conn.createStatement();
        String sqlStr = "SELECT * FROM book";
        Statement statement = conn.createStatement();
        ResultSet rs = statement.executeQuery(sqlStr);

        // Iterate over the result set and display book data
        while (rs.next()) {
          String title = rs.getString("title");
          String author = rs.getString("author");
          double price = rs.getDouble("price");
          // ... retrieve other book data

          // Display the book information
          out.println("<h3>" + title + "</h3>");
          out.println("<p>Author: " + author + "</p>");
          out.println("<p>Price: $" + price + "</p>");
          out.println("<hr>");
        }

        // Close the result set, statement, and connection
        rs.close();
        statement.close();
        conn.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    %>
  </div>
</body>
</html>