package com.ecobarn.model;

public class Admin extends User{

	private String lastLoginDate;
	private String lastLoginTime;
	
	
	public Admin() {
		super("", "", "", "", "", "","");
		this.lastLoginDate = "";
		this.lastLoginTime = "";
	}
	
	
	
	public Admin(String fname, String lname, String email, String phone, String password, String username,
			String image) {
		super(fname, lname, email, phone, password, username,image);
		this.lastLoginDate = "";
		this.lastLoginTime = "";
	}



	public String getLastLoginDate() {
		return lastLoginDate;
	}



	public String getLastLoginTime() {
		return lastLoginTime;
	}



	public void setLastLoginDate(String lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}



	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	
	
	
	
}
