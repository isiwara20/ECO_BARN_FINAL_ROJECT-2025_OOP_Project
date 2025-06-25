package com.ecobarn.servlet;

import javax.servlet.*;

import javax.servlet.http.*;
import java.io.IOException;

import com.ecobarn.model.ItemDetails;
import com.ecobarn.DAO.CartDAO;

import jakarta.servlet.annotation.WebServlet;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String action = request.getParameter("action");

        // 🔒 Ensure user is logged in
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("signin.jsp");
            return;
        }

        String userEmail = (String) session.getAttribute("userEmail");

        if ("add".equals(action)) {
            String name = request.getParameter("name");
            String category = request.getParameter("category");

            ItemDetails item = CartDAO.getItemByNameAndCategory(name, category);
            if (item != null) {
                CartDAO.addToCart(userEmail, item);  // 🛒 Persist in DB
            }
        }

        if ("remove".equals(action)) {
            String name = request.getParameter("name");
            CartDAO.removeFromCart(userEmail, name);  // ❌ Remove from DB
        }

        response.sendRedirect("cart.jsp");
    }
}
