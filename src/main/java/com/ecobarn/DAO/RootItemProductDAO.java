package com.ecobarn.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.ecobarn.model.Product;
import com.ecobarn.util.DBConnection;

public class RootItemProductDAO implements AddProductDAO{

	 private static boolean isSuccess;
	 private static Connection con = null;
	    
	
	public boolean inserProduct(Product Product) throws Exception {
		
		isSuccess = false;
       
       try {
           con = DBConnection.getConnection();
           String sql = "INSERT INTO tbl_rootsitem (name, description, image, price, stock ) VALUES (?, ?, ?, ?,?)";
           PreparedStatement stmt = con.prepareStatement(sql);
           
           stmt.setString(1, Product.getName());
           stmt.setString(2, Product.getDescription());
           stmt.setString(3, Product.getImagePath());
           stmt.setDouble(4, Product.getPrice());
           stmt.setInt(5, Product.getStock());
           
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
