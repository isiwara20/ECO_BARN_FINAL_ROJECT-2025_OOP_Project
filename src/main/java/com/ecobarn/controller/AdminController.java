package com.ecobarn.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.ecobarn.model.Admin;
import com.ecobarn.util.DBConnection;

public class AdminController {

	 private static boolean isSuccess;
	    private static Connection con = null;
	
	
	 public static boolean updateLoginTime_Date(String date, String time, String username) throws Exception {
	        isSuccess = false;
	        
	        try {
	            con = DBConnection.getConnection();
	            String sql = "UPDATE admin SET lastLoginDate = ? , lastLoginTime = ? WHERE username = ?";
	            PreparedStatement stmt = con.prepareStatement(sql);
	            
	            stmt.setString(1, date);
	            stmt.setString(2, time);
	            stmt.setString(3, username);

	          
	            int rowsAffected = stmt.executeUpdate();
	            
	            if (rowsAffected > 0) {
	                isSuccess = true;
	            } else {
	                isSuccess = false;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return isSuccess;
	    }
	    
	 
	 
	 
	 
	 public static boolean addAdmin(Admin admin) {
	        boolean isSuccess = false;

	        String sql = "INSERT INTO admin (username , fname, lname, email, phone, password, image) VALUES (?,?, ?, ?, ?, ?, ?)";

	        try (Connection con = DBConnection.getConnection();
	             PreparedStatement stmt = con.prepareStatement(sql)) {
	           
	        	stmt.setString(1, admin.getUsername());

	            stmt.setString(2, admin.getFname());
	            stmt.setString(3, admin.getLname());
	            stmt.setString(4, admin.getEmail());
	            stmt.setString(5, admin.getPhone());
	            stmt.setString(6, admin.getPassword());
	            stmt.setString(7, admin.getImage());

	            int rows = stmt.executeUpdate();
	            isSuccess = (rows > 0);

	        } catch (Exception e) {
	            e.printStackTrace(); // In production, use proper logging
	        }

	        return isSuccess;
	    }
	 
}
