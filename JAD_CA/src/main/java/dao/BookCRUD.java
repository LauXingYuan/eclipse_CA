package dao;

import java.sql.*;

import java.util.List;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Book;

public class BookCRUD {

	public List<Book> getAllBooks() {
		List<Book> books = new ArrayList<>();
		Book book = null;
		Connection conn = null;

		try {
			conn = DBConnection.getConnection();
			String sqlStr = "SELECT * FROM book";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sqlStr);

			// Step 6: Process Result
			while (rs.next()) {
				int bookID = rs.getInt("bookID");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String publisher = rs.getString("publisher");
				int quantity = rs.getInt("quantity");
				double price = rs.getDouble("price");
				int category = rs.getInt("categoryID");
				String imageUrl = rs.getString("imageUrl");

				// Create a new book using the service layer
				book = new Book(bookID, title, author, publisher, quantity, price, category, imageUrl);
				books.add(book);
			}
			// Step 7: Close connection
			conn.close();
		} catch (Exception e) {
			System.out.println("Error: " + e);
		}
		return books;
	}

	public int addBook(Book book) {
	    int rec = 0;
	    Connection conn = null;

	    try {
	        conn = DBConnection.getConnection();
	        String sqlStr = "INSERT INTO book (bookID, title, author, publisher, quantity, price, categoryID, imageUrl) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	        PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	        pstmt.setInt(1, book.getBookID());
	        pstmt.setString(2, book.getTitle());
	        pstmt.setString(3, book.getAuthor());
	        pstmt.setString(4, book.getPublisher());
	        pstmt.setInt(5, book.getQuantity());
	        pstmt.setDouble(6, book.getPrice());
	        pstmt.setInt(7, book.getCategory());
	        pstmt.setString(8, book.getImageUrl());

	        rec = pstmt.executeUpdate();

	        conn.close();
	    } catch (Exception e) {
	        System.err.println("Error at userDAO :" + e);
	    }

	    return rec;
	}

	public void updateBook(Book book) {
		// Your implementation to update a book in the database
	}

	public void deleteBook(String title) {
		// Your implementation to delete a book from the database
	}

	public Book getBookByTitle(String title) {
		Book book = null;

		try {
			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");
			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost:3306/jad_ca?user=root&password=ubuntu&serverTimezone=UTC";
			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
			// Step 4: Create Statement object + Step 5: Execute SQL Command
			String sqlStr = "SELECT * FROM book WHERE bookName=?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setString(1, title);

			ResultSet rs = pstmt.executeQuery();

			// Step 6: Process Result
			if (rs.next()) {
				int bookID = rs.getInt("bookID");
				String author = rs.getString("author");
				String publisher = rs.getString("publisher");
				int quantity = rs.getInt("quantity");
				double price = rs.getDouble("price");
				int category = rs.getInt("categoryID");
				String imageUrl = rs.getString("imageUrl");

				// Create a new book using the service layer
				book = new Book(bookID, title, author, publisher, quantity, price, category, imageUrl);
			} else {
				// No book found with the given name
				return null;
			}
			// Step 7: Close connection
			conn.close();
		} catch (Exception e) {
			System.out.println("Error: " + e);
		}
		return book;
	}
}