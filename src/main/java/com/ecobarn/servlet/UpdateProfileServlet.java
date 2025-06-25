package com.ecobarn.servlet;

import com.ecobarn.model.User;
import com.ecobarn.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

//@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    // Method to update the profile details
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("userName");
        
        // Get the form data from the request
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String birthday = request.getParameter("birthday");
        String email = request.getParameter("email"); // Optional: Use email if needed
        
        // Call the updateProfile method
        boolean isUpdated = false;
		try {
			isUpdated = updateProfile(phone, address, birthday, username);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        if (isUpdated) {
            // Redirect to profile page with success message
            response.sendRedirect("myprofile.jsp?updateSuccess=true");
        } else {
            // Redirect to profile page with failure message
            response.sendRedirect("myprofile.jsp?updateSuccess=false");
        }
    }

    // Method to update profile in the database
    private boolean updateProfile(String phone, String address, String birthday, String username) throws Exception {
        boolean isSuccess = false;
        Connection con = null;
        
        try {
            con = DBConnection.getConnection();
            String sql = "UPDATE users SET phone = ?, address = ?, birthday = ? WHERE username = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, phone);
            stmt.setString(2, address);
            stmt.setString(3, birthday);
            stmt.setString(4, username);
            
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        
        return isSuccess;
    }
}
