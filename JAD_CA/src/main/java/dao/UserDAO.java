package dao;

import model.User;

public class UserDAO {
	private UserCRUD userCRUD; // BookCRUD instance for database operations

    public UserDAO() {
        userCRUD = new UserCRUD();
    }
    
    public User verifyUser(String username, String email, String password) {
        return userCRUD.verifyUser(username, email, password);
    }

}
