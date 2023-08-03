package service;

import java.util.List;
import dao.UserDAO;
import dao.UserCRUD;
import model.User;

public class UserService {
    private UserDAO userDAO;

    public UserService() {
        userDAO = new UserDAO();
    }


    public User verifyUser(String username, String email, String password) {
    	User user = userDAO.verifyUser(username, email, password);
        return user;
    }

    public void addUser(User user) {
        userDAO.addUser(user);
    }
//
//    public void updateUser(User user) {
//        userDAO.updateUser(user);
//    }

}