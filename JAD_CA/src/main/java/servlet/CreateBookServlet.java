package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BookService;
import model.Book;

/**
 * Servlet implementation class CreateBookServlet
 */
@WebServlet("/CreateBookServlet")
public class CreateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private BookService bookService;
    
    public void init() {
        bookService = new BookService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Extract request parameters
    	int bookID = Integer.parseInt(request.getParameter("bookID"));
    	String title = request.getParameter("title");
    	String author = request.getParameter("author");
    	String publisher = request.getParameter("publisher");
    	int quantity = Integer.parseInt(request.getParameter("quantity"));
    	double price = Double.parseDouble(request.getParameter("price"));
    	int categoryID = Integer.parseInt(request.getParameter("category"));
    	 String imageUrl = request.getParameter("imageUrl");
        // Create a new book using the service layer
        Book newBook = new Book(bookID, title, author, publisher, quantity, price, categoryID, imageUrl);
        int rec = bookService.addBook(newBook);
        
        // Redirect back to the book listing page
		request.setAttribute("record", rec);
		request.getRequestDispatcher("/CA1/Users&Admins/CRUD/createBook.jsp").forward(request, response);
	}
}
