package com.ecobarn.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecobarn.controller.shipping_detailsController;
import com.ecobarn.model.shipping;

//@WebServlet("/displayShippingAlreadyServlet")
public class displayShippingAlreadyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        HttpSession session = request.getSession();

		String username = (String) session.getAttribute("username");

		String amount = request.getParameter("amount");
		
		try {
			ArrayList<shipping> allShipingInfo = shipping_detailsController.CheckShipping(username);
			request.setAttribute("allShippingDetails", allShipingInfo);
			
			request.setAttribute("TotalAmount", amount);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("shippingdetails.jsp");
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
