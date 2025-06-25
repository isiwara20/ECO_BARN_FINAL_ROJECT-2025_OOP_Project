package com.ecobarn.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecobarn.util.DBConnection;

public class Admin_CountDAO {
	
	private static boolean isSuccess;
    private static Connection con = null;
    
    public static int getAdminCount() throws Exception {


	 int admincount = 0;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;    	
	
 try {
     con = DBConnection.getConnection();
     
     String sql = "SELECT COUNT(*) AS admincount FROM admin";
     
     stmt = con.prepareStatement(sql);
     
     
   
     
     rs = stmt.executeQuery();
     
     
     if(rs.next()) {
    	 admincount = rs.getInt("admincount");
 
     }
     
     
 } catch (SQLException e) {
     e.printStackTrace();
 }
 
 return admincount;
}
}
