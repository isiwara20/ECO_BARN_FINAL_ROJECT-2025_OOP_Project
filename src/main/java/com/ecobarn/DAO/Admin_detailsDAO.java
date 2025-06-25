package com.ecobarn.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecobarn.model.Admin;
import com.ecobarn.util.DBConnection;

public class Admin_detailsDAO {

	
	 private static boolean isSuccess;
	    private static Connection con = null;
	    
	public static Admin checkAdminLogincredentials(String credentials,String password)  {
	    Admin admin = null;
	    Connection con = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        con = DBConnection.getConnection();
            String sql = "SELECT username , email , password , fname, image  FROM admin WHERE (username = ? OR email = ?) AND password = ?";
            
            stmt = con.prepareStatement(sql);
            stmt.setString(1, credentials);
            stmt.setString(2, credentials);
            stmt.setString(3, password);
            
            rs = stmt.executeQuery();

          
	        if (rs.next()) {
	            admin = new Admin();
	            admin.setUsername(rs.getString("username"));
	            admin.setEmail(rs.getString("email"));
	            admin.setPassword(rs.getString("password"));
	            admin.setFname(rs.getString("fname"));
	            admin.setImage(rs.getString("image"));
	            
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); // or log
	   

	   
	}
	    return admin;

}}
