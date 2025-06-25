package com.ecobarn.servlet;

import com.ecobarn.DAO.impl.ContactDAOImpl;
import com.ecobarn.model.ContactTicket;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class MyTicketsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        String username = (session != null) ? (String) session.getAttribute("username") : null;

        if (username == null) {
            response.sendRedirect("signin.jsp");
            return;
        }

        List<ContactTicket> ticketList = new ContactDAOImpl().getTicketsByUsername(username);
        request.setAttribute("ticketList", ticketList);
        RequestDispatcher rd = request.getRequestDispatcher("myTickets.jsp");
        rd.forward(request, response);
    }
}
