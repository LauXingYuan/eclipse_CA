package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import model.User;

public class UserCRUD {

	public User verifyUser(String username, String email, String password) {
		// Implement the database query to fetch a user by username
		User user = null;
		boolean verified = false;

		try {
			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");
			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/jad_ca1?user=root&password=ubuntu&serverTimezone=UTC";
			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
			// Step 4: Create Statement object
			Statement stmt = conn.createStatement();
			// Step 5: Execute SQL Command
			// String sqlStr = "SELECT * FROM member WHERE name=? and password=?";
			// out.print(sqlStr);
			String sqlStr = "SELECT * FROM users WHERE email=?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setString(1, email);
			// pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			// Step 6: Process Result
			while (rs.next()) {
				int userID = rs.getInt("userID");
				String userPassword = rs.getString("password");

				// Check if password matches
				if (password.equals(userPassword)) {
					// Perform another SQL query to get user role
					verified = true;
					String roleSql = "SELECT RoleID FROM user_userrole WHERE UserID=?";
					PreparedStatement roleStmt = conn.prepareStatement(roleSql);
					roleStmt.setInt(1, userID);
					ResultSet roleRs = roleStmt.executeQuery();

					int roleId = 2; // default value if no role is found
					if (roleRs.next()) {
						roleId = roleRs.getInt("roleId");
						user = new User(userID, username, email, password, roleId);

					}
				}
			}

			// Step 7: Close connection
			conn.close();
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}
		// and create a User object based on the retrieved data
		// Return the user
		return user;
	}

	public void addUser(User user) {
		// Implement the database query to add a new user
		// using the provided User object
	}

	public void updateUser(User user) {
		// Implement the database query to update an existing user
		// using the provided User object
	}

}