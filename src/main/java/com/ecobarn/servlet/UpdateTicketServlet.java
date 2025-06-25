package com.ecobarn.servlet;

import com.ecobarn.DAO.impl.ContactDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class UpdateTicketServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ticketID = request.getParameter("ticketID");
        String concern = request.getParameter("concern");
        boolean success = new ContactDAOImpl().updateTicketConcern(ticketID, concern); // implement this
        response.sendRedirect("MyTicketsServlet");
    }
}
