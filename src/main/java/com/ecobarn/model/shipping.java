package com.ecobarn.model;

public class shipping {
	
	private String fullname;
	private String phone;
	private String houseNo;
	private String province;
	private String district;
	private String city;
	private String address;
	private  String username;
	
	
	public shipping( String fullname, String phone, String houseNo, String province, String district,
			String city, String address ,  String username) {
		super();
		this.fullname = fullname;
		this.phone = phone;
		this.houseNo = houseNo;
		this.province = province;
		this.district = district;
		this.city = city;
		this.address = address;
		this.username =   username;
	}
	
	
	public shipping() {
		
		this.fullname = "";
		this.phone = "";
		this.houseNo = "";
		this.province = "";
		this.district = "";
		this.city = "";
		this.address = "";
	}




	public String getFullname() {
		return fullname;
	}


	public String getPhone() {
		return phone;
	}


	public String getHouseNo() {
		return houseNo;
	}


	public String getProvince() {
		return province;
	}


	public String getDistrict() {
		return district;
	}


	public String getCity() {
		return city;
	}


	public String getAddress() {
		return address;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}





	public void setFullname(String fullname) {
		this.fullname = fullname;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}


	public void setProvince(String province) {
		this.province = province;
	}


	public void setDistrict(String district) {
		this.district = district;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public void setAddress(String address) {
		this.address = address;
	}
	
	

}
