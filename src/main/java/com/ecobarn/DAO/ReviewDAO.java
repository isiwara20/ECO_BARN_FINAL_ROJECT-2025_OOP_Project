package com.ecobarn.DAO;

import com.ecobarn.model.Review;
import com.ecobarn.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {
    public static List<Review> getAllReviews() {
        List<Review> reviews = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM reviews";  // your table name
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Review review = new Review();
                review.setId(rs.getInt("id"));
                review.setName(rs.getString("name"));
                review.setComment(rs.getString("comment"));
                review.setRating(rs.getInt("rating"));
                review.setImagePath(rs.getString("image_path"));
                reviews.add(review);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reviews;
    }
}
