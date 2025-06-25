package com.ecobarn.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecobarn.util.GenerateOrderID;
import com.ecobarn.util.WhatsAppOrderSuccess;
import com.ecobarn.DAO.Payment_detailsDAO;
import com.ecobarn.controller.OrderPlaceController;
import com.ecobarn.model.User;
//@WebServlet("/forwardToCashOnDelivery")
public class forwardToCashOnDelivery extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String amount = request.getParameter("finalAmount");
        String username = request.getParameter("username");

        String phone = "0706125515";
        String email = "ssss@gmail.com";
	    String text = "Cash";
	    String text2 = "On_Delivery";
		String Status = "Order is Proccessing";
		
		
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        String currentDate = LocalDate.now().format(dateFormatter);  // e.g., "2025-05-05"

		boolean isTrue = false;
		
		try {
			User getCashDeliveryphone = Payment_detailsDAO.getDetailsforPayment(username);
			if(getCashDeliveryphone != null)
			{
				 phone = getCashDeliveryphone.getPhone();
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		

		String orderID = GenerateOrderID.generateORDERID(request, text, text2);
	    request.setAttribute("orderID", orderID);
	    
		 try {
			isTrue = OrderPlaceController.insertData(orderID, email , Status ,currentDate);
		} catch (Exception e) {
			
			e.printStackTrace();
		}

	    WhatsAppOrderSuccess.sendOrderSuccessMsg(phone, orderID);
	    
	    
        request.setAttribute("orderStatus", Status);

	    request.setAttribute("FinalAmount", amount);
	    request.getRequestDispatcher("cashondelivery.jsp").forward(request, response);
	    
	    
	
	}

}
