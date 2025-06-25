package com.ecobarn.model;

public class OrderPlace {

	private String order_id;
	private String email;
	private String status;
	private String date;
	
	
	public OrderPlace() {
		super();
		this.order_id = "";
		this.email = "";
		this.status = "";
		this.date = "";
	}
	
	public OrderPlace(String order_id, String email, String status , String date) {
		super();
		this.order_id = order_id;
		this.email = email;
		this.status = status;
		this.date = date;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getOrder_id() {
		return order_id;
	}

	public String getEmail() {
		return email;
	}

	public String getStatus() {
		return status;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
