package com.ecobarn.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ecobarn.model.shipping;
import com.ecobarn.util.DBConnection;

public class shipping_detailsController {

	 // Creating DB
    private static boolean isSuccess;
    private static Connection con = null;
    
    
    

    // Insert Data function
    public static boolean insertData(String fullname, String phone, String houseNo, String district, String province , String city, String address, String username) throws Exception {
        isSuccess = false;
        
        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO shipping_details ( fullname, phone, houseNo, province,district, city , address, username) VALUES (?, ?, ?, ?,?,?,?,?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            
           
            stmt.setString(1, fullname);
            stmt.setString(2, phone);
            stmt.setString(3, houseNo);
            stmt.setString(4, province);
            stmt.setString(5, district);
            stmt.setString(6, city);
            stmt.setString(7, address);
            stmt.setString(8, username);

            
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
    
    
    
    
    
    
    
    public static ArrayList<shipping> CheckShipping(String username) throws Exception {
        ArrayList<shipping> shippingDetails = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Connection con = null;

        try {
            con = DBConnection.getConnection();
            String sql = "SELECT fullname, phone, houseNo, province, district, city, address FROM shipping_details WHERE username = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            while (rs.next()) {
                shipping ship = new shipping();
                ship.setFullname(rs.getString("fullname"));
                ship.setPhone(rs.getString("phone"));
                ship.setHouseNo(rs.getString("houseNo"));
                ship.setProvince(rs.getString("province"));
                ship.setDistrict(rs.getString("district"));
                ship.setCity(rs.getString("city"));
                ship.setAddress(rs.getString("address"));

                shippingDetails.add(ship);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        }

        return shippingDetails;
    }
   
   
}
