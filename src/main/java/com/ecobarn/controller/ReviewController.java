package com.ecobarn.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.ecobarn.util.DBConnection;

public class ReviewController {

    public static boolean insertReview(String name, String comment, int rating, String imagePath) {
        boolean isInserted = false;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO reviews (name, comment, rating, image_path) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, comment);
            ps.setInt(3, rating);
            ps.setString(4, imagePath);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                isInserted = true;
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isInserted;
    }
}
