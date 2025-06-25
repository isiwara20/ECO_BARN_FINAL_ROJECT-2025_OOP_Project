package com.ecobarn.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecobarn.controller.OrderPlaceController;
import com.ecobarn.controller.UserController;
import com.ecobarn.controller.transactionController;
import com.ecobarn.util.GenerateOrderID;
import com.ecobarn.util.WhatsAPPOTP;
import com.ecobarn.util.WhatsAppOrderSuccess;
import com.ecobarn.util.WhatsAppUsername;

//@WebServlet("/OrderSuccessServlet")
public class OrderSuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String amount = request.getParameter("amount");

        

		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // Get current date and time
        String currentDate = LocalDate.now().format(dateFormatter);  // e.g., "2025-05-05"
        

        String text = "Card";
	    String text2 = "Payment";
	    
		String Status = "Order is Proccessing";
		
		String orderID = GenerateOrderID.generateORDERID(request, text, text2);
		

WhatsAppOrderSuccess.sendOrderSuccessMsg(phone, orderID);
		
		boolean isTrue = false;
		
		try {
			isTrue = OrderPlaceController.insertData(orderID, email , Status ,currentDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		boolean isTransactionadd = false;
		
		
		try {
			isTransactionadd = transactionController.insertTransaction(orderID, currentDate ,amount );
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(isTrue == true && isTransactionadd == true )
		{
			
			  // HttpSession session = request.getSession();
               //session.setAttribute("finalAmount", orderID);

               request.setAttribute("orderStatus", Status);
               request.setAttribute("orderID",orderID );
               request.setAttribute("email", email);


               
               // Forward to JSP
               request.getRequestDispatcher("successPayment.jsp").forward(request, response);		}
		else
		{
			   request.setAttribute("issue", "Issue in generating OrderID, Try Again");
               request.getRequestDispatcher("wrong.jsp").forward(request, response);
		}
		
		
		
		
	}

}
