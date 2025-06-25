package com.ecobarn.controller;

import com.ecobarn.DAO.ItemDAO;

import com.ecobarn.model.ItemDetails;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ProductDetailServlet")
public class ProductDetailServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String category = request.getParameter("category");

        try {
            ItemDAO itemDAO = new ItemDAO();
            ItemDetails item = itemDAO.getItemByName(name, category); // Implement this method
            request.setAttribute("item", item);
            request.getRequestDispatcher("productDetails.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("wrong.jsp");
        }
    }
}
