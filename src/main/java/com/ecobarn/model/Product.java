//IT23600584 Indievarie H. C

package com.ecobarn.model;

public class Product {
    private int id;
    private String name;
    private double price;
    private String imagePath;
    private String category;
    private String description;//added
    private int stock;//added

    
    public Product() {
    }

    // (Optional) Constructor with parameters if you want
    public Product(int id, String name, double price, String imagePath, String category , String description , int quantity ) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.imagePath = imagePath;
        this.category = category;
        this.description = description;
        this.stock = quantity;
    }

    public String getDescription() {
		return description;
	}

	public int getStock() {
		return stock;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	// Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
}
