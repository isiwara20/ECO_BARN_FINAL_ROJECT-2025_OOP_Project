package com.ecobarn.DAO;

import com.ecobarn.model.DealModel;
import com.ecobarn.model.shipping;
import com.ecobarn.util.DBConnection;

import java.sql.*;
import java.util.*;

public class DealDAO {
   
	
	
	
	private static boolean isSuccess;
    private static Connection con = null;
	
    public static List<DealModel> getAllDeals() throws Exception {
        
    	
    	List<DealModel> list = new ArrayList<>();
        
    	PreparedStatement stmt = null;
        ResultSet rs = null;
        Connection con = null;

        
        
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT deals_id, title, description, price, discount , image_url FROM deals";
            stmt = con.prepareStatement(sql);
            
            
            rs = stmt.executeQuery();

            while (rs.next()) {
            	DealModel deal = new DealModel();
            	
            	deal.setDeals_id(rs.getString("deals_id"));
            	deal.setTitle(rs.getString("title"));
            	deal.setDescription(rs.getString("description"));
            	deal.setPrice(rs.getDouble("price"));
            	
            	deal.setDiscount(rs.getDouble("discount"));
            	deal.setImageUrl(rs.getString("image_url"));
            	
            	
            	list.add(deal);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        }

        return list;
    }
    
    
    
    
    
/*
    public static DealModel getDealById(String id) {
        DealModel deal = null;
        try (Connection con = getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM deals WHERE deals_id=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                deal = new DealModel(
                    rs.getString("deals_id"),
                    rs.getString("title"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getDouble("discount"),
                    rs.getString("image_url")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return deal;
    }*/
}
