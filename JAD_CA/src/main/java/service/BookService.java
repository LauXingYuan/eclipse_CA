package service;

import java.util.List;

import dao.BookDAO;
import model.Book;

public class BookService {
    private BookDAO bookDAO;

    public BookService() {
        bookDAO = new BookDAO();
    }

    public List<Book> getAllBooks() {
        // Delegate the retrieval of books to the DAO layer
        return bookDAO.getAllBooks();
    }
    
    public Book getBookByName(String title) {
        // Delegate the retrieval of books to the DAO layer
        return bookDAO.getBookByTitle(title);
    }

    public void addBook(Book book) {
        // Delegate the creation of a book to the DAO layer
        bookDAO.addBook(book);
    }
}