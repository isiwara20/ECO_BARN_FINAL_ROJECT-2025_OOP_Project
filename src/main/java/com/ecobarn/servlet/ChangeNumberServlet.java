package com.ecobarn.servlet;

import com.ecobarn.util.GenerateOTP;
import com.ecobarn.util.WhatsAPPOTP;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("/ChangeNumberServlet")
public class ChangeNumberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String phone = request.getParameter("change_num");

        HttpSession session = request.getSession();

        String fname = (String) session.getAttribute("fname");
        
        
        int otp = GenerateOTP.generateStoreOTP(request);
        
        
		WhatsAPPOTP.sendOTP(phone, otp , fname);

	
		session.setAttribute("otp", otp);
	    session.setAttribute("phone", phone);
	
	    response.sendRedirect("verifycode.jsp");
	}

}
