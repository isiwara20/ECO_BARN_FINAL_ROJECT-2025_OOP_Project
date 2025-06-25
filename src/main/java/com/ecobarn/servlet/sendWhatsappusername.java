package com.ecobarn.servlet;

import com.ecobarn.util.WhatsAppUsername;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


//@WebServlet("/sendWhatsappusername")
public class sendWhatsappusername extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

		  String phone = (String) session.getAttribute("phone");
	      String username = (String) session.getAttribute("username");
	      
	      WhatsAppUsername.sendUsername(phone, username);
	      
          response.sendRedirect("signin.jsp");

	      
	      
	      
	      

	
	}

}
