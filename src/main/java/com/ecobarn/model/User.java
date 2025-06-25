package com.ecobarn.model;



public class User {
    private String fname, lname, email, phone, password , username, image;

    
    
   

	public User(String fname, String lname, String email, String phone, String password, String username, String image) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.username = username;
		this.image = image;
	}
    
    public User() {
		super();
		this.fname = "";
		this.lname = "";
		this.email = "";
		this.phone = "";
		this.password = "";
		this.username = "";
		this.image = "";

	}
    
    
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	// Getters and Setters
    public String getFname() { return fname; }
    public void setFname(String fname) { this.fname = fname; }

    public String getLname() { return lname; }
    public void setLname(String lname) { this.lname = lname; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
}
