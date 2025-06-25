package com.ecobarn.DAO;


import com.ecobarn.model.Product;
import com.ecobarn.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    public static List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM products";  // Use your actual table name
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id")); // assuming your table has column 'id'
                product.setName(rs.getString("name")); // assuming column 'name'
                product.setPrice(rs.getDouble("price")); // assuming column 'price'
                product.setImagePath(rs.getString("image_path")); // assuming column 'image_path'
                product.setCategory(rs.getString("category")); // assuming column 'category'
                products.add(product);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }
}
