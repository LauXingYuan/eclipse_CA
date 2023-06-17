package model;

public class Book {
    private int BookID;
    private String Title;
    private String Author;
    private String Publisher;
    private int Quantity;
    private double Price;
    private String Category;

    public Book(int BookID, String title, String author, String publisher, int quantity, double price, String category) {
        this.BookID = BookID;
        this.Title = title;
        this.Author = author;
        this.Publisher = publisher;
        this.Quantity = quantity;
        this.Price = price;
        this.Category = category;
    }

	public int getBookID() {
		return BookID;
	}

	public void setBookID(int BookID) {
		this.BookID = BookID;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getAuthor() {
		return Author;
	}

	public void setAuthor(String author) {
		Author = author;
	}

	public String getPublisher() {
		return Publisher;
	}

	public void setPublisher(String publisher) {
		Publisher = publisher;
	}

	public int getQuantity() {
		return Quantity;
	}

	public void setQuantity(int quantity) {
		Quantity = quantity;
	}

	public double getPrice() {
		return Price;
	}

	public void setPrice(double price) {
		Price = price;
	}
	
	public String getCategory() {
		return Category;
	}

	public void setCategory(String category) {
		Category = category;
	}

}