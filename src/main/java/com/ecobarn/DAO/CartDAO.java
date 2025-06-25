package com.ecobarn.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.ecobarn.model.ItemDetails;
import com.ecobarn.util.DBConnection;

public class CartDAO {
    public static ItemDetails getItemByNameAndCategory(String name, String category) {
        ItemDetails item = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String tableName = getTableNameForCategory(category);
            if (tableName == null) return null;

            String sql = "SELECT * FROM " + tableName + " WHERE name = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            rs = stmt.executeQuery();

            if (rs.next()) {
                item = new ItemDetails();
                item.setName(rs.getString("name"));
                item.setPrice(rs.getInt("price"));
                item.setImage(rs.getString("image"));
                item.setStock(rs.getInt("stock"));
                item.setQuantity(1); // default quantity when adding to cart
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (stmt != null) stmt.close(); } catch (Exception ignored) {}
            try { if (conn != null) conn.close(); } catch (Exception ignored) {}
        }

        return item;
    }

    private static String getTableNameForCategory(String category) {
        switch (category.toLowerCase()) {
            case "vegetables": return "tbl_vegetablesitem";
            case "fruits": return "tbl_fruitsitem";
            case "leafygreen": return "tbl_leafyitem";
            case "root": return "tbl_rootsitem";
            case "freshnuts": return "tbl_nutsitem";
            default: return null;
        }
    }
    
    public static void addToCart(String userEmail, ItemDetails item) {
        try (Connection conn = DBConnection.getConnection()) {
            String sqlCheck = "SELECT * FROM user_cart WHERE user_email = ? AND item_name = ?";
            PreparedStatement checkStmt = conn.prepareStatement(sqlCheck);
            checkStmt.setString(1, userEmail);
            checkStmt.setString(2, item.getName());
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                String sqlUpdate = "UPDATE user_cart SET quantity = quantity + 1 WHERE user_email = ? AND item_name = ?";
                PreparedStatement updateStmt = conn.prepareStatement(sqlUpdate);
                updateStmt.setString(1, userEmail);
                updateStmt.setString(2, item.getName());
                updateStmt.executeUpdate();
            } else {
                String sqlInsert = "INSERT INTO user_cart (user_email, item_name, price, image, quantity) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(sqlInsert);
                insertStmt.setString(1, userEmail);
                insertStmt.setString(2, item.getName());
                insertStmt.setInt(3, (int) item.getPrice());
                insertStmt.setString(4, item.getImage());
                insertStmt.setInt(5, item.getQuantity());
                insertStmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void removeFromCart(String userEmail, String itemName) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM user_cart WHERE user_email = ? AND item_name = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, userEmail);
            stmt.setString(2, itemName);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<ItemDetails> getCartByUser(String userEmail) {
        List<ItemDetails> cart = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM user_cart WHERE user_email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, userEmail);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ItemDetails item = new ItemDetails();
                item.setName(rs.getString("item_name"));
                item.setPrice(rs.getInt("price"));
                item.setImage(rs.getString("image"));
                item.setQuantity(rs.getInt("quantity"));
                cart.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cart;
    }
    

}
