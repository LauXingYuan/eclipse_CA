package dao;

import java.sql.*;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Book;

public class BookCRUD {

	public List<Book> getAllBooks() {
		return null;
		// Your implementation to retrieve all books from the database
	}

	public void addBook(Book book) {
		// Your implementation to add a book to the database
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
			String connURL = "jdbc:mysql://localhost:3306/db1?user=root&password=ubuntu&serverTimezone=UTC";
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
			    String category = rs.getString("categoryID");

			    // Create a new book using the service layer
			    book = new Book(bookID, title, author, publisher, quantity, price, category);
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