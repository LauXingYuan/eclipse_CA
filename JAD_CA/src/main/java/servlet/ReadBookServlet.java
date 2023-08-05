package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import service.BookService;
import model.Book;

@WebServlet("/ReadBookServlet")
public class ReadBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReadBookServlet() {
		super();
	}

	private BookService bookService;

	public void init() {
		bookService = new BookService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Extract request parameters
		String title = request.getParameter("title");

		// To differentiate whether request was for getAllBooks or getBookByTitle
		if (title == null) {
			// Retrieve books using the service layer
			List<Book> books = bookService.getAllBooks();

			// Forward the books for presenting
			request.setAttribute("books", books);
			request.getRequestDispatcher("/CA1/Users&Admins/CRUD/readBook.jsp").forward(request, response);

		} else {
			// Retrieve book using the service layer
			Book book = bookService.getBookByName(title);

			// Forward the book for presenting
			request.setAttribute("book", book);
			request.getRequestDispatcher("books.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}