package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;
import model.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserService userService;

	public void init() {
		userService = new UserService();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Extract request parameters
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");

		// Verify user using the service layer
		User user = userService.verifyUser(username, email, password);
		request.setAttribute("user", user);
		// Set the attributes in the request object
		request.getRequestDispatcher("/CA1/Users&Admins/profile.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Extract request parameters
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		;

		// Create a new user using the service layer
		User newUser = new User(username, password, email);
		userService.addUser(newUser);

		// Redirect back to the user listing page
		response.sendRedirect(request.getContextPath() + "/CA1/book/home.jsp");
	}
}
