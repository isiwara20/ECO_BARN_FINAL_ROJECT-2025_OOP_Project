package com.ecobarn.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.ecobarn.util.DBConnection;

public class OrderPlaceController {

	 // Creating DB
    private static boolean isSuccess;
    private static Connection con = null;
    
    
    

    // Insert Data function
    public static boolean insertData(String order_id, String email, String status, String date) throws Exception {
        isSuccess = false;
        
        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO trackorder ( order_id, email, status, date) VALUES (?, ?, ?,?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            
           
            stmt.setString(1, order_id);
            stmt.setString(2, email);
            stmt.setString(3, status);
            stmt.setString(4, date);
          

            
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
    
    
    
    
    

    
    public static boolean updateOrderStatus(String orderId , String status) throws Exception {
        isSuccess = false;
        
        try {
            con = DBConnection.getConnection();
            
            String sql = "UPDATE trackorder SET status = ? WHERE order_id = ? ";
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, status);
            stmt.setString(2, orderId);
         

          
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
