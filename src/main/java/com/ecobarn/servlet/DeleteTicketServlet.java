package com.ecobarn.servlet;

import com.ecobarn.DAO.impl.ContactDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteTicketServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ticketID = request.getParameter("ticketID");
        boolean success = new ContactDAOImpl().deleteTicket(ticketID);
        response.sendRedirect("MyTicketsServlet");
    }
}
