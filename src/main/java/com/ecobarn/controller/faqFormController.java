package com.ecobarn.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.ecobarn.util.DBConnection;

public class faqFormController {

    private static boolean isSuccess;
    private static Connection con = null;

    public static boolean insertData(String name, String email, String phonenumber, String nic, String question) throws Exception {
        isSuccess = false;

        try {
            con = DBConnection.getConnection();

            String sql = "INSERT INTO faq (name, email, phonenumber, nic, question, date) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phonenumber);
            stmt.setString(4, nic);
            stmt.setString(5, question);
            stmt.setTimestamp(6, Timestamp.valueOf(LocalDateTime.now()));

            int rowsAffected = stmt.executeUpdate();

            isSuccess = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
}
