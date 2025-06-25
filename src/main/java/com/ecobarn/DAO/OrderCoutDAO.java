package com.ecobarn.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecobarn.model.User;
import com.ecobarn.util.DBConnection;

public class OrderCoutDAO {

	
	 	private static boolean isSuccess;
	    private static Connection con = null;
	    
	 public static int getOrdersCountToday(String date) throws Exception {
	    	
		 int ordersToday = 0;
    	    PreparedStatement stmt = null;
    	    ResultSet rs = null;    	
    	
        try {
            con = DBConnection.getConnection();
            
            String sql = "SELECT COUNT(*) AS orders_today FROM trackorder WHERE date = ?";
            
            stmt = con.prepareStatement(sql);
            stmt.setString(1, date);
            
          
            
            rs = stmt.executeQuery();
            
            
            if(rs.next()) {
            	ordersToday = rs.getInt("orders_today");
        
            }
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return ordersToday;
    }
    
    
}
