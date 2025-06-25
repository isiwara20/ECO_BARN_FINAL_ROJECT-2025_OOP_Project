package com.ecobarn.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecobarn.model.User;
import com.ecobarn.util.DBConnection;

//akindu new
public class UserProfileController {

    private static boolean isSuccess;
    private static Connection con = null;

    public static User profiledetails(String credentials) throws Exception {
    	
    	 User user = null;
    	    PreparedStatement stmt = null;
    	    ResultSet rs = null;    	
    	
        try {
            con = DBConnection.getConnection();
            
            String sql = "SELECT username  , fname, phone , email  FROM users WHERE username = ?  ";
            
            stmt = con.prepareStatement(sql);
            stmt.setString(1, credentials);
     
          
            
            rs = stmt.executeQuery();
            
            
            if(rs.next()) {
            	user = new User();
            	user.setUsername(rs.getString("username"));
            	user.setFname(rs.getString("fname"));
            	user.setPhone(rs.getString("phone"));
            	user.setEmail(rs.getString("email"));
            	
            }
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return user;
    }
	
	
}
