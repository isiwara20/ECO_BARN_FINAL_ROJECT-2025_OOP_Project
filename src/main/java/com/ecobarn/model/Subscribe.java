package com.ecobarn.model;



public class Subscribe {

	private String email;
	private String date;
	public Subscribe(String email, String date) {
		
		this.email = email;
		this.date = date;
	}
	public String getEmail() {
		return email;
	}
	public String getDate() {
		return date;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}
