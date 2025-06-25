package com.ecobarn.servlet;

import com.ecobarn.model.trackorderModel;

import com.ecobarn.util.DBConnection;

//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import java.io.IOException;
import java.sql.*;

//@WebServlet("/TrackOrderServlet")
public class TrackOrderServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String orderId = request.getParameter("orderId");
        trackorderModel order = null;

        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT * FROM trackorder WHERE order_id = ? AND email = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, orderId);
            stmt.setString(2, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                order = new trackorderModel(
                    orderId,
                    email,
                    rs.getString("status")
                );
            }

            request.setAttribute("order", order);
            request.getRequestDispatcher("trackOrderResult.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();  // This prints to the server logs/console
        }
    }
}
