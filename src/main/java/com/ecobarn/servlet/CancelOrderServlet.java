package com.ecobarn.servlet;

import com.ecobarn.util.DBConnection;

import java.io.*;
import javax.servlet.*;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

//@WebServlet("/CancelOrderServlet")
public class CancelOrderServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        String reason = request.getParameter("reason");
        String message = null;

        if (orderId != null && !orderId.isEmpty()) {
            Connection conn = null;
            PreparedStatement selectStmt = null;
            PreparedStatement insertCancelStmt = null;
            PreparedStatement deleteStmt = null;
            ResultSet rs = null;

            try {
                conn = DBConnection.getConnection();

                if (conn == null) {
                    message = "Database connection failed.";
                } else {
                    // Step 1: Retrieve order details
                    String selectSQL = "SELECT email, status FROM trackorder WHERE order_id = ?";
                    selectStmt = conn.prepareStatement(selectSQL);
                    selectStmt.setString(1, orderId);
                    rs = selectStmt.executeQuery();

                    if (rs.next()) {
                        String email = rs.getString("email");
                        String status = rs.getString("status");

                        // Step 2: Insert into cancelled_orders
                        String insertSQL = "INSERT INTO cancelled_orders (order_id, email, status, reason) VALUES (?, ?, ?, ?)";
                        insertCancelStmt = conn.prepareStatement(insertSQL);
                        insertCancelStmt.setString(1, orderId);
                        insertCancelStmt.setString(2, email);
                        insertCancelStmt.setString(3, status);
                        insertCancelStmt.setString(4, reason);
                        insertCancelStmt.executeUpdate();

                        // Step 3: Delete from trackorder
                        String deleteSQL = "DELETE FROM trackorder WHERE order_id = ?";
                        deleteStmt = conn.prepareStatement(deleteSQL);
                        deleteStmt.setString(1, orderId);
                        int rows = deleteStmt.executeUpdate();

                        message = (rows > 0) ? "Order ID " + orderId + " was successfully cancelled." : "Order ID not found.";
                    } else {
                        message = "Order ID not found.";
                    }
                }

            } catch (Exception e) {
                message = "Error: " + e.getMessage();
            } finally {
                try { if (rs != null) rs.close(); } catch (Exception e) {}
                try { if (selectStmt != null) selectStmt.close(); } catch (Exception e) {}
                try { if (insertCancelStmt != null) insertCancelStmt.close(); } catch (Exception e) {}
                try { if (deleteStmt != null) deleteStmt.close(); } catch (Exception e) {}
                try { if (conn != null) conn.close(); } catch (Exception e) {}
            }
        } else {
            message = "Order ID is required.";
        }

        request.setAttribute("message", message);
        RequestDispatcher dispatcher = request.getRequestDispatcher("cancelOrder.jsp");
        dispatcher.forward(request, response);
    }
}
