package com.ecobarn.model;

public class Contact {

	private String ticketID;
	private String username;
	private String name;
	private String email;
	private String phone;
	private String concern;
	private String status;
	
	
	public Contact() {

		this.ticketID = "";
		this.username = "";
		this.name = "";
		this.email = "";
		this.phone = "";
		this.concern = "";
		this.status = "";
	}
	
	
	
	
	public Contact(String ticketID, String username, String name, String email, String phone, String concern,
			String status) {

		this.ticketID = ticketID;
		this.username = username;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.concern = concern;
		this.status = status;
	}




	public String getTicketID() {
		return ticketID;
	}




	public String getUsername() {
		return username;
	}




	public String getName() {
		return name;
	}




	public String getEmail() {
		return email;
	}




	public String getPhone() {
		return phone;
	}




	public String getConcern() {
		return concern;
	}




	public String getStatus() {
		return status;
	}




	public void setTicketID(String ticketID) {
		this.ticketID = ticketID;
	}




	public void setUsername(String username) {
		this.username = username;
	}




	public void setName(String name) {
		this.name = name;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public void setPhone(String phone) {
		this.phone = phone;
	}




	public void setConcern(String concern) {
		this.concern = concern;
	}




	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	
	
}
