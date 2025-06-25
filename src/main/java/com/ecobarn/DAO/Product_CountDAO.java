package com.ecobarn.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecobarn.util.DBConnection;

public class Product_CountDAO {

	
	private static boolean isSuccess;
    private static Connection con = null;
    
    public static int getFruitCount() throws Exception {


	 int fuitCount = 0;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;    	
	
 try {
     con = DBConnection.getConnection();
     
     String sql = "SELECT COUNT(*) AS fuitCount FROM tbl_fruitsitem";
     
     stmt = con.prepareStatement(sql);
     
     
   
     
     rs = stmt.executeQuery();
     
     
     if(rs.next()) {
    	 fuitCount = rs.getInt("fuitCount");
 
     }
     
     
 } catch (SQLException e) {
     e.printStackTrace();
 }
 
 return fuitCount;
}
    
    
    
    
    
    
    
    public static int getLeadyItemCount() throws Exception {


   	 int LeadyItemCount = 0;
   	    PreparedStatement stmt = null;
   	    ResultSet rs = null;    	
   	
    try {
        con = DBConnection.getConnection();
        
        String sql = "SELECT COUNT(*) AS LeadyItemCount FROM tbl_leafyitem";
        
        stmt = con.prepareStatement(sql);
        
        
      
        
        rs = stmt.executeQuery();
        
        
        if(rs.next()) {
        	LeadyItemCount = rs.getInt("LeadyItemCount");
    
        }
        
        
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return LeadyItemCount;
   }
    
    

    
    public static int getNutItemCount() throws Exception {


   	 int count = 0;
   	    PreparedStatement stmt = null;
   	    ResultSet rs = null;    	
   	
    try {
        con = DBConnection.getConnection();
        
        String sql = "SELECT COUNT(*) AS NutItemCount FROM tbl_nutsitem";
        
        stmt = con.prepareStatement(sql);
        
        
      
        
        rs = stmt.executeQuery();
        
        
        if(rs.next()) {
        	count = rs.getInt("NutItemCount");
    
        }
        
        
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return count;
   }
    
    

    public static int getRootItemCount() throws Exception {


   	 int count = 0;
   	    PreparedStatement stmt = null;
   	    ResultSet rs = null;    	
   	
    try {
        con = DBConnection.getConnection();
        
        String sql = "SELECT COUNT(*) AS RootItemCount FROM tbl_rootsitem";
        
        stmt = con.prepareStatement(sql);
        
        
      
        
        rs = stmt.executeQuery();
        
        
        if(rs.next()) {
        	count = rs.getInt("RootItemCount");
    
        }
        
        
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return count;
   }
    
    
    
    public static int getVegetableCount() throws Exception {


      	 int count = 0;
      	    PreparedStatement stmt = null;
      	    ResultSet rs = null;    	
      	
       try {
           con = DBConnection.getConnection();
           
           String sql = "SELECT COUNT(*) AS VegetableCount FROM tbl_vegetablesitem";
           
           stmt = con.prepareStatement(sql);
           
           
         
           
           rs = stmt.executeQuery();
           
           
           if(rs.next()) {
           	count = rs.getInt("VegetableCount");
       
           }
           
           
       } catch (SQLException e) {
           e.printStackTrace();
       }
       
       return count;
      }
    
    
    
}
