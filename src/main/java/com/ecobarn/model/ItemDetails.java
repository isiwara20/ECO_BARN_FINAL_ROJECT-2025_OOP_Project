package com.ecobarn.model;

public class ItemDetails {
    private String name;
    private String description;
    private String image;
    private double price;
    private int stock;
    private int quantity;  // for cart use

    // Default constructor (required if you use 'new ItemDetails()')
    public ItemDetails() {}

    // All-args constructor (optional if you want quick creation)
    public ItemDetails(String name, String description, String image, double price, int stock) {
        this.name = name;
        this.description = description;
        this.image = image;
        this.price = price;
        this.stock = stock;
    }

    // Getters
    public String getName() { return name; }
    public String getDescription() { return description; }
    public String getImage() { return image; }
    public double getPrice() { return price; }
    public int getStock() { return stock; }
    public int getQuantity() { return quantity; }

    // Setters
    public void setName(String name) { this.name = name; }
    public void setDescription(String description) { this.description = description; }
    public void setImage(String image) { this.image = image; }
    public void setPrice(double price) { this.price = price; }
    public void setStock(int stock) { this.stock = stock; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
}
