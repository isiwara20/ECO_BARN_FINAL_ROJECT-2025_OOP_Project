package com.ecobarn.servlet;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

import com.ecobarn.model.ContactTicket;
import com.ecobarn.service.ContactService;
import com.ecobarn.service.impl.ContactServiceImpl;
import com.ecobarn.util.TicketIDGenerator;

public class ContactUsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ContactService service = new ContactServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("signin.jsp");
            return;
        }

        ContactTicket ticket = new ContactTicket();
        ticket.setTicketID(TicketIDGenerator.generateID());
        ticket.setUsername(username);
        ticket.setName(request.getParameter("name"));
        ticket.setEmail(request.getParameter("email"));
        ticket.setPhone(request.getParameter("phone"));
        ticket.setConcern(request.getParameter("concern"));
        ticket.setStatus("Pending");
        ticket.setRespond("");

        if (service.raiseTicket(ticket)) {
            request.setAttribute("ticketID", ticket.getTicketID()); // Pass to JSP
            request.getRequestDispatcher("contactSuccess.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Failed to raise ticket.");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
        }
    }
}
