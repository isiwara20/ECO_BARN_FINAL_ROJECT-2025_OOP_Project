package com.ecobarn.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecobarn.controller.UserController;

/**
 * Servlet implementation class ChangePhoneServlet
 */
//@WebServlet("/ChangePhoneServlet")
public class ChangePhoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("usernamephone");
		String oldphone = request.getParameter("old_phone");
		String newphone = request.getParameter("new_phone");

		
		boolean isUpdated = false;
		try {
			isUpdated = UserController.updateUserPhone(newphone, oldphone, username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		 if(isUpdated)
		    {
		    	 request.setAttribute("userphoneupdatemessage", "Phone Number is Successfully updated");
		         request.getRequestDispatcher("AdminDashboardStaticsServlet").forward(request, response);
		    }
		    else {
		    	request.setAttribute("userphoneupdatemessage", "User is Not found or Old phone No. not matched");
		        request.getRequestDispatcher("AdminDashboardStaticsServlet").forward(request, response);

		    }
		
		
		
	}

}
