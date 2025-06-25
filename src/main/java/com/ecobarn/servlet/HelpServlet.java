package com.ecobarn.servlet;

import java.io.IOException;

import javax.servlet.*;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

//@WebServlet("/help")
//@WebServlet("/HelpServlet")
public class HelpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		// Optional: handle search bar input (from a form)
        String searchQuery = request.getParameter("search");
        request.setAttribute("searchQuery", searchQuery);  // pass to JSP if needed

        // Forward to help.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("help.jsp");
        dispatcher.forward(request, response);
	}

}
