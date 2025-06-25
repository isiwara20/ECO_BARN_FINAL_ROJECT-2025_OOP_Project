package com.ecobarn.model;

public class DealModel {
    private String deals_id;
    private String title;
    private String description;
    private double price;
    private double discount;
    private String imageUrl; 

    public DealModel() {}

    public DealModel(String deals_id, String title, String description, double price, double discount, String imageUrl) {
        this.deals_id = deals_id;
        this.title = title;
        this.description = description;
        this.price = price;
        this.discount = discount;
        this.imageUrl = imageUrl;
    }

    public String getDeals_id() { 
    	return deals_id; 
    }
    public void setDeals_id(String deals_id) { 
    	this.deals_id = deals_id; 
    }
    public String getTitle() { 
    	return title; 
    }
    public void setTitle(String title) { 
    	this.title = title; 
    }
    public String getDescription() { 
    	return description; 
    }
    public void setDescription(String description) { 
    	this.description = description; 
    }
    public double getPrice() { 
    	return price; 
    }
    public void setPrice(double price) { 
    	this.price = price; 
    }
    public double getDiscount() { 
    	return discount; 
    }
    public void setDiscount(double discount) { 
    	this.discount = discount; 
    }
    public String getImageUrl() { 
    	return imageUrl; 
    }
    public void setImageUrl(String imageUrl) { 
    	this.imageUrl = imageUrl; 
    }

    public double getFinalPrice() {
        return price - (price * discount / 100);
    }
}
