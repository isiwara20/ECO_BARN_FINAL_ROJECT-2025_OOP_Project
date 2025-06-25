package com.ecobarn.controller;

import com.ecobarn.model.Address;
import com.ecobarn.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AddressController {
//insert
	public static boolean insertAddress(String address, String city, String country) throws Exception {
		 try (Connection con = DBConnection.getConnection()) {
		        // Note: Do not insert address_id as it's auto-incremented in the database
		        String sql = "INSERT INTO address (address, city, country) VALUES (?, ?, ?)";
		        try (PreparedStatement stmt = con.prepareStatement(sql)) {
		            stmt.setString(1, address);
		            stmt.setString(2, city);
		            stmt.setString(3, country);

		            int rowsAffected = stmt.executeUpdate();  // This will insert a row and generate address_id automatically
		            if( rowsAffected > 0)
		            { 
		            	return true;// Return true if the insert was successful
		            }
		            else {
		            	return false;
		            }
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		        throw new Exception("Database error during insertion", e);
		    }
	}
	
//read
	public static List<Address> getAllAddresses() throws Exception {
        List<Address> addresses = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM address";
            try (Statement stmt = con.createStatement();
                 ResultSet rs = stmt.executeQuery(sql)) {
                while (rs.next()) {
                    Address address = new Address(
                            rs.getString("address"),
                            rs.getString("city"),
                            rs.getString("country"));
                    address.setAddressId(rs.getInt("address_id"));
                    addresses.add(address);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return addresses;
    }
//update
	
	public static boolean updateAddress(int addressId, String address, String city, String country) throws Exception {
	    try (Connection con = DBConnection.getConnection()) {
	        String sql = "UPDATE address SET address = ?, city = ?, country = ? WHERE address_id = ?";
	        try (PreparedStatement stmt = con.prepareStatement(sql)) {
	            stmt.setString(1, address);
	            stmt.setString(2, city);
	            stmt.setString(3, country);
	            stmt.setInt(4, addressId);
	            int rowsAffected = stmt.executeUpdate();
	            return rowsAffected > 0;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new Exception("Error updating address", e);
	    }
	}

	

    // Delete an Address
    public static boolean deleteAddress(int address_id) throws Exception {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "DELETE FROM address WHERE address_id = ?";
            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setInt(1, address_id);
                int rowsAffected = stmt.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

	