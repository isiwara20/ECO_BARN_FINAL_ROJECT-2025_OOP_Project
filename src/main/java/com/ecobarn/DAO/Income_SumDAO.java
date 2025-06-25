package com.ecobarn.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecobarn.util.DBConnection;

public class Income_SumDAO {

	
	private static boolean isSuccess;
    private static Connection con = null;
    
    public static double getTodayIncome(String date) throws Exception {


	 double income = 0;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;    	
	
 try {
     con = DBConnection.getConnection();
     
     String sql = "SELECT SUM(amount) AS income FROM transactions where date =  ?";
     
     stmt = con.prepareStatement(sql);
     stmt.setString(1, date);

     
   
     
     rs = stmt.executeQuery();
     
     
     if(rs.next()) {
    	 income = rs.getInt("income");
 
     }
     
     
 } catch (SQLException e) {
     e.printStackTrace();
 }
 
 return income;
}
}
