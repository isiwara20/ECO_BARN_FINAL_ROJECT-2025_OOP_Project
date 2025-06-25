package com.ecobarn.controller;

import com.ecobarn.DAO.ItemDAO;
import com.ecobarn.model.ItemDetails;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ItemDetailsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String category = request.getParameter("category");

        try {
            ItemDAO dao = new ItemDAO();
            List<ItemDetails> items = dao.getItemsByCategory(category);

            if (items != null && !items.isEmpty()) {
                request.setAttribute("items", items);
                request.getRequestDispatcher("itemDetails.jsp").forward(request, response);
            } else {
                response.getWriter().println("No items found for this category.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
