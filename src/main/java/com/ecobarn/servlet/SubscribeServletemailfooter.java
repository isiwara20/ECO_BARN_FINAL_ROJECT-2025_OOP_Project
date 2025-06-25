package com.ecobarn.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecobarn.controller.SubscribeController;

/**
 * Servlet implementation class SubscribeServletemailfooter
 */
//@WebServlet("/SubscribeServletemailfooter")
public class SubscribeServletemailfooter extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		
		
		 LocalDate currentDate = LocalDate.now();
	        
	        // Format the date to a string (e.g., "2025-04-30")
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        String date =  currentDate.format(formatter);
		
		
		boolean isTrue = false;
		
		try {
			isTrue = SubscribeController.insertData(email, date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(isTrue == true)
		{
			String alertMessage = "Data Inserted";
			response.getWriter().println("<script>alert('Successfully Subscribed');</script>");
			response.getWriter().println("<script>window.location.href = 'index.jsp' </script>");
		}
		else
		{
			   response.getWriter().println("<script>alert('Issue in Sever. Please Try Again');</script>");

		}
		
		
		
	}


}
