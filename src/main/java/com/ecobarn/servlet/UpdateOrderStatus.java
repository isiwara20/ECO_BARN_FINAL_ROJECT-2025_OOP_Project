package com.ecobarn.servlet;
//IT23600652 Isiwara Wijesighe
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecobarn.controller.OrderPlaceController;

/**
 * Servlet implementation class UpdateOrderStatus
 */
//@WebServlet("/UpdateOrderStatus")
public class UpdateOrderStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	String orderid = request.getParameter("orderIDstatusupdate");
	String status = request.getParameter("statusdelivery");
	
	boolean isture = false;
	
	try {
		isture = OrderPlaceController.updateOrderStatus(orderid, status);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	
	
	
	if(isture)
	{
		String ordermsg = "Order Status of " + orderid +  " is Successfully updated";
		
		 request.setAttribute("updateorderMSg", ordermsg);
         request.getRequestDispatcher("AdminDashboardStaticsServlet").forward(request, response);
	}
	else
	{
		String message = "Order " + orderid +" is Not found or User may canceled";
		request.setAttribute("updateorderMSg", message);
        request.getRequestDispatcher("AdminDashboardStaticsServlet").forward(request, response);

	}
	
	}

}
