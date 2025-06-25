package com.ecobarn.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecobarn.util.DBConnection;

public class User_CountDAO {
	private static boolean isSuccess;
    private static Connection con = null;
    
 public static int getUserCount() throws Exception {
    	
	 int usercount = 0;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;    	
	
    try {
        con = DBConnection.getConnection();
        
        String sql = "SELECT COUNT(*) AS usercount FROM users";
        
        stmt = con.prepareStatement(sql);
        
        
      
        
        rs = stmt.executeQuery();
        
        
        if(rs.next()) {
        	usercount = rs.getInt("usercount");
    
        }
        
        
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return usercount;
}
}
