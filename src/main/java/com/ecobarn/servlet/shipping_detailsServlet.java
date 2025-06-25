package com.ecobarn.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecobarn.controller.shipping_detailsController;
import com.ecobarn.util.GenerateOrderID;

/**
 * Servlet implementation class shipping_detailsServlet
 */
//@WebServlet("/shipping_detailsServlet")
public class shipping_detailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
        HttpSession session = request.getSession();

		
		String fullname = request.getParameter("fullName");
		String phone = request.getParameter("phone");
		String houseNo = request.getParameter("street");
		String province = request.getParameter("province");
		String district = request.getParameter("district");
		String city = request.getParameter("city");
		String address = request.getParameter("fullAddress");
		
		
		
		String username = request.getParameter("username");

	    String deliveryFee = request.getParameter("deliveryFee");
        String finalAmount = request.getParameter("finalAmount");

		
		request.setAttribute("selectedName", fullname);
        request.setAttribute("selectedPhone", phone);
        request.setAttribute("selectedAddress", address);
        request.setAttribute("deliveryFee", deliveryFee);
        request.setAttribute("finalAmount", finalAmount);
        
		
        
        session.setAttribute("paytotalAmount", finalAmount);
       
		
		boolean isTrue = false;
		
		try {
			isTrue = shipping_detailsController.insertData( fullname, phone, houseNo, district, province, city, address, username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(isTrue == true)
		{
			   // Forward to payment.jsp
	        RequestDispatcher dispatcher = request.getRequestDispatcher("selectpaymethod.jsp");
	        dispatcher.forward(request, response);
		}
		else
		{
			   response.getWriter().println("<script>alert('Issue in Sever. Please Try Again');</script>");

		}
		
		
		
		
		
		
	}

}
