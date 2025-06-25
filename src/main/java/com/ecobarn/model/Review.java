package com.ecobarn.model;

public class Review {
    private String name;
    private String comment;
    private int rating;
    private String imagePath;
	private int id;

    public Review() {}

    public Review(String name, String comment, int rating, String imagePath,int id) {
        this.name = name;
        this.comment = comment;
        this.rating = rating;
        this.imagePath = imagePath;
        this.id=id;
    }
    
    public void setId(int id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public String getComment() {
        return comment;
    }

    public int getId() {
        return id;
    }

    public int getRating() {
        return rating;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
}
