package com.ecobarn.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecobarn.controller.TicketRespondController;

/**
 * Servlet implementation class ReplyTicketServlet
 */
//@WebServlet("/ReplyTicketServlet")
public class ReplyTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String ticketID = request.getParameter("ticketID");
		String respond = request.getParameter("respondReply");
		
		
		boolean isSuccess = false;
		
		try {
			isSuccess = TicketRespondController.respondToConcern(ticketID, respond);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String alertmessage = "Responding Successful for " + ticketID;
		
		if(isSuccess == true)
		{
			 request.setAttribute("respondMessage", alertmessage);

             request.getRequestDispatcher("AdminDashboardStaticsServlet").forward(request, response);

		}
		else
		{
			 request.setAttribute("respondMessage", "Issue in Responding. Already Responded or Ticket is Cancelled");

             request.getRequestDispatcher("AdminDashboardStaticsServlet").forward(request, response);

		}
	
	}

}
