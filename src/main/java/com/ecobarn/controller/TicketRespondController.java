package com.ecobarn.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.ecobarn.model.Contact;
import com.ecobarn.util.DBConnection;

public class TicketRespondController {

	 
    private static boolean isSuccess;
    private static Connection con = null;
    
    
    
	
	  public static LinkedList <Contact> getTicketArraised() throws Exception {
	        
		  	LinkedList<Contact> ticketsArraised = new LinkedList<>();
	        PreparedStatement stmt = null;
	        ResultSet rs = null;
	        Connection con = null;
	        String status = "Pending";

	        try {
	            con = DBConnection.getConnection();
	            String sql = "SELECT ticketID, username, name, email, phone, concern FROM contact WHERE status = ?";
	            stmt = con.prepareStatement(sql);
	            stmt.setString(1, status);
	            rs = stmt.executeQuery();

	            while (rs.next()) {
	            	Contact concerns = new Contact();
	            	
	            	concerns.setTicketID(rs.getString("ticketID"));
	            	concerns.setUsername(rs.getString("username"));
	            	concerns.setName(rs.getString("name"));
	            	concerns.setEmail(rs.getString("email"));
	            	concerns.setPhone(rs.getString("phone"));
	            	concerns.setConcern(rs.getString("concern"));
	            	
	            	ticketsArraised.add(concerns);
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	            if (con != null) con.close();
	        }

	        return ticketsArraised;
	    }
	   
	  
	  
	  
	  

	    public static boolean respondToConcern(String ticketID,String respondreply) throws Exception {
	        isSuccess = false;
	        String status = "Responded";
	        
	        try {
	            con = DBConnection.getConnection();
	            String sql = "UPDATE contact SET respond = ? , status = ? WHERE ticketID = ?";
	            PreparedStatement stmt = con.prepareStatement(sql);
	            
	            stmt.setString(1, respondreply);
	            stmt.setString(2, status);
	            stmt.setString(3, ticketID);
	          
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
