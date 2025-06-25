package com.ecobarn.model;

public class Transaction {

	private String orderid;
	private double amount;
	private String date;
	
	public Transaction() {
		super();
		this.orderid = "";
		this.amount = 0;
		this.date = "";
	}
	
	
	public String getOrderid() {
		return orderid;
	}


	public double getAmount() {
		return amount;
	}


	public String getDate() {
		return date;
	}


	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}


	public void setAmount(double amount) {
		this.amount = amount;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public Transaction(String orderid, double amount, String date) {
		super();
		this.orderid = orderid;
		this.amount = amount;
		this.date = date;
	}
	
	
	
}
