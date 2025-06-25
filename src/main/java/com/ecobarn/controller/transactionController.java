package com.ecobarn.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.ecobarn.util.DBConnection;

public class transactionController {

	
	   // Creating DB
    private static boolean isSuccess;
    private static Connection con = null;
    
    // Insert Data function
    public static boolean insertTransaction(String orderID, String date, String amount) throws Exception {
        isSuccess = false;
        
        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO transactions (orderid, amount, date) VALUES (?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, orderID);
            stmt.setString(2, amount);
            stmt.setString(3, date);
           
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
