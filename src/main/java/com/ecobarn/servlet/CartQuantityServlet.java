package com.ecobarn.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import java.io.IOException;
import java.sql.*;

import com.ecobarn.util.DBConnection;


public class CartQuantityServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("signin.jsp");
            return;
        }

        String userEmail = (String) session.getAttribute("userEmail");
        String itemName = request.getParameter("name");
        int newQuantity = Integer.parseInt(request.getParameter("quantity"));

        try (Connection conn = DBConnection.getConnection()) {

            // First: find item category by looking it up in all possible tables
            String[] categories = {"tbl_vegetablesitem", "tbl_fruitsitem", "tbl_leafyitem", "tbl_rootsitem", "tbl_nutsitem"};
            int availableStock = -1;

            for (String table : categories) {
                String sql = "SELECT stock FROM " + table + " WHERE name = ?";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, itemName);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        availableStock = rs.getInt("stock");
                        break;
                    }
                }
            }

            if (availableStock == -1) {
                response.sendRedirect("cart.jsp");
                return; // item not found
            }

            if (newQuantity <= 0) {
                // Remove from cart if quantity is zero
                String sqlDelete = "DELETE FROM user_cart WHERE user_email = ? AND item_name = ?";
                try (PreparedStatement ps = conn.prepareStatement(sqlDelete)) {
                    ps.setString(1, userEmail);
                    ps.setString(2, itemName);
                    ps.executeUpdate();
                }
                session.setAttribute("msg", "Item '" + itemName + "' removed: Out of stock or zero quantity.");
            } else if (newQuantity > availableStock) {
                // Set max available quantity if request exceeds stock
                String sqlUpdate = "UPDATE user_cart SET quantity = ? WHERE user_email = ? AND item_name = ?";
                try (PreparedStatement ps = conn.prepareStatement(sqlUpdate)) {
                    ps.setInt(1, availableStock);
                    ps.setString(2, userEmail);
                    ps.setString(3, itemName);
                    ps.executeUpdate();
                }
                session.setAttribute("msg", "Item '" + itemName + "' limited to available stock: " + availableStock);
            } else {
                // Normal quantity update
                String sqlUpdate = "UPDATE user_cart SET quantity = ? WHERE user_email = ? AND item_name = ?";
                try (PreparedStatement ps = conn.prepareStatement(sqlUpdate)) {
                    ps.setInt(1, newQuantity);
                    ps.setString(2, userEmail);
                    ps.setString(3, itemName);
                    ps.executeUpdate();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("cart.jsp");
    }
}