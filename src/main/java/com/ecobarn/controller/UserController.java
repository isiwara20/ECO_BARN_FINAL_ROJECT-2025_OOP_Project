package com.ecobarn.controller;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ecobarn.model.User;
import com.ecobarn.util.DBConnection;

public class UserController {

    // Creating DB
    private static boolean isSuccess;
    private static Connection con = null;
    
    // Insert Data function
    public static boolean insertData(String fname, String lname, String email, String phone, String password , String username) throws Exception {
        isSuccess = false;
        
        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO users (fname, lname, email, phone, password , username) VALUES (?, ?, ?, ?, ?,?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, fname);
            stmt.setString(2, lname);
            stmt.setString(3, email);
            stmt.setString(4, phone);
            stmt.setString(5, password);
            stmt.setString(6, username);
            
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
    
    
    
    
    public static boolean updatephonenumber(String phone,String username) throws Exception {
        isSuccess = false;
        
        try {
            con = DBConnection.getConnection();
            String sql = "UPDATE users SET phone = ? WHERE (username = ? OR email = ?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, phone);
            stmt.setString(2, username);
            stmt.setString(3, username);

          
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
    
    
    
    
    
    public static User checksignincredentials(String credentials,String password) throws Exception {
    	
    	 User user = null;
    	    PreparedStatement stmt = null;
    	    ResultSet rs = null;    	
    	
        try {
            con = DBConnection.getConnection();
            
            String sql = "SELECT username , email , password , fname  FROM users WHERE (username = ? OR email = ?) AND password = ?";
            
            stmt = con.prepareStatement(sql);
            stmt.setString(1, credentials);
            stmt.setString(2, credentials);
            stmt.setString(3, password);
          
            
            rs = stmt.executeQuery();
            
            
            if(rs.next()) {
            	user = new User();
            	user.setUsername(rs.getString("username"));
            	user.setEmail(rs.getString("email"));
            	user.setPassword(rs.getString("password"));
            	user.setFname(rs.getString("fname"));
            }
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
    
    

    
    public static User checkresetpasswordCredentials(String credentials) throws Exception {
    	
    	 User user = null;
    	    PreparedStatement stmt = null;
    	    ResultSet rs = null;    	
    	
        try {
            con = DBConnection.getConnection();
            
            String sql = "SELECT username , email , password , fname , phone  FROM users WHERE (username = ? OR email = ?)";
            
            stmt = con.prepareStatement(sql);
            stmt.setString(1, credentials);
            stmt.setString(2, credentials);
          
            
            rs = stmt.executeQuery();
            
            
            if(rs.next()) {
            	user = new User();
            	user.setUsername(rs.getString("username"));
            	user.setEmail(rs.getString("email"));
            	user.setPassword(rs.getString("password"));
            	user.setFname(rs.getString("fname"));
            	user.setPhone(rs.getString("phone"));
            }
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
    
    
    

    public static boolean deleteUserAccount(String username) throws Exception {
        isSuccess = false;
        
        try {
            con = DBConnection.getConnection();
            String sql = "delete from users WHERE username = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, username);
          
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
    
    
    

    
    public static boolean updateUserPhone(String newphone , String phone,String username) throws Exception {
        isSuccess = false;
        
        try {
            con = DBConnection.getConnection();
            String sql = "UPDATE users SET phone = ? WHERE username = ? AND phone = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, newphone);
            stmt.setString(2, username);
            stmt.setString(3, phone);

          
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
    
    
    

    public static boolean updateUserPassword(String password,String username) throws Exception {
        isSuccess = false;
        
        try {
            con = DBConnection.getConnection();
            String sql = "UPDATE users SET password = ? WHERE username = ? ";
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, password);
            stmt.setString(2, username);
       

          
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
