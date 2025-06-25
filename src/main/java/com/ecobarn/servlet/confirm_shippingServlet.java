package com.ecobarn.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class confirm_shippingServlet
 */
//@WebServlet("/confirm_shippingServlet")
public class confirm_shippingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String selectedName = request.getParameter("selectedName");
        String selectedPhone = request.getParameter("selectedPhone");
        String selectedAddress = request.getParameter("selectedAddress");
        String deliveryFee = request.getParameter("deliveryFee");
        String finalAmount = request.getParameter("finalAmount");

        // Set data to request attributes
        request.setAttribute("selectedName", selectedName);
        request.setAttribute("selectedPhone", selectedPhone);
        request.setAttribute("selectedAddress", selectedAddress);
        request.setAttribute("deliveryFee", deliveryFee);
        request.setAttribute("finalAmount", finalAmount);
        
        
        HttpSession session = request.getSession();
        
        session.setAttribute("paytotalAmount", finalAmount);
        

        // Forward to payment.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("selectpaymethod.jsp");
        dispatcher.forward(request, response);
    }

}
