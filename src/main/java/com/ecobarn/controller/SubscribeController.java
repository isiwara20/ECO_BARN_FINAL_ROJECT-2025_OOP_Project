package com.ecobarn.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.ecobarn.util.DBConnection;

public class SubscribeController {

	
	 // Creating DB
    private static boolean isSuccess;
    private static Connection con = null;
    
    // Insert Data function
    public static boolean insertData(String email , String date) throws Exception {
        isSuccess = false;
        
        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO subscribe (email, date) VALUES (?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, email);
            stmt.setString(2, date);
            
            
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
}
