package dao;

import model.User;

public class UserDAO {
	private UserCRUD userCRUD; // BookCRUD instance for database operations

    public UserDAO() {
        userCRUD = new UserCRUD();
    }
    
    public User verifyUser(String username, String email, String password) {
    	User user = userCRUD.verifyUser(username, email, password);
        return user;
    }

	public void addUser(User user) {
		// TODO Auto-generated method stub
		
	}

}
