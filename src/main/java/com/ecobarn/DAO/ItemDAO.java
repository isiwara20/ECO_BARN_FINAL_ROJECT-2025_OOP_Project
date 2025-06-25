package com.ecobarn.DAO;

import com.ecobarn.model.ItemDetails;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ItemDAO {

    public List<ItemDetails> getItemsByCategory(String category) throws Exception {
        String table = "";
        switch (category) {
            case "vegetables": table = "tbl_vegetablesitem"; break;
            case "fruits": table = "tbl_fruitsitem"; break;
            case "freshnuts": table = "tbl_nutsitem"; break;
            case "leafygreen": table = "tbl_leafyitem"; break;
            case "root": table = "tbl_rootsitem"; break;
        }

        List<ItemDetails> itemList = new ArrayList<>();

        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecobarn", "root", "oslocc123")) {
            String sql = "SELECT * FROM " + table;
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ItemDetails item = new ItemDetails(
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getString("image"),
                    rs.getDouble("price"),
                    rs.getInt("stock")
                );
                itemList.add(item);
            }
            rs.close();
            stmt.close();
        }

        return itemList;
    }

    public ItemDetails getItemByName(String name, String category) throws Exception {
        String table = switch (category) {
            case "vegetables" -> "tbl_vegetablesitem";
            case "fruits" -> "tbl_fruitsitem";
            case "freshnuts" -> "tbl_nutsitem";
            case "leafygreen" -> "tbl_leafyitem";
            case "root" -> "tbl_rootsitem";
            default -> throw new IllegalArgumentException("Invalid category: " + category);
        };

        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ecobarn", "root", "oslocc123")) {
            String sql = "SELECT * FROM " + table + " WHERE name=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new ItemDetails(
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getString("image"),
                    rs.getDouble("price"),
                    rs.getInt("stock")
                );
            }
        }

        return null;
    }

}
