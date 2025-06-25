package com.ecobarn.model;


public class Address {
    private int addressId;
    private String address;
    private String city;
    private String country;

    public Address(String address, String city, String country) {
        this.address = address;
        this.city = city;
        this.country = country;
    }

    // Getters and setters
    public int getAddressId() {
    	return addressId; 
    	}
    public void setAddressId(int addressId) {
    	this.addressId = addressId; 
    	}
  
    public String getAddress() {
    	return address; 
    	}
    public void setAddress(String address) {
    	this.address = address; 
    	}
    public String getCity() {
    	return city; 
    	}
    public void setCity(String city) {
    	this.city = city; 
    	}
    public String getCountry() {
    	return country;
    	}
    public void setCountry(String country) {
    	this.country = country; 
    	}
}