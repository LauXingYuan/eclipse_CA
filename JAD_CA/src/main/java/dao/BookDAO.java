package dao;

import java.util.ArrayList;
import java.util.List;

import model.Book;

public class BookDAO {
    private BookCRUD bookCRUD; // BookCRUD instance for database operations

    public BookDAO() {
        bookCRUD = new BookCRUD();
    }

    public List<Book> getAllBooks() {
        return bookCRUD.getAllBooks();
    }

    public Book getBookByTitle(String title) {
        return bookCRUD.getBookByTitle(title);
    }

    public void addBook(Book book) {
        bookCRUD.addBook(book);
    }

    public void updateBook(Book book) {
        bookCRUD.updateBook(book);
    }

    public void deleteBook(String bookName) {
        bookCRUD.deleteBook(bookName);
    }
}
