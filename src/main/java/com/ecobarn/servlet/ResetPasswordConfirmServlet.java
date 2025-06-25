package com.ecobarn.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecobarn.controller.UserController;

/**
 * Servlet implementation class ResetPasswordConfirmServlet
 */
//@WebServlet("/ResetPasswordConfirmServlet")
public class ResetPasswordConfirmServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("usernameupdatepass");
		String passcode = request.getParameter("password");
		
		boolean isTrue = false;

		try {
			isTrue = UserController.updateUserPassword(passcode, username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		if(isTrue == true)
		{

		    request.setAttribute("username",username );
            request.getRequestDispatcher("password_reset_success.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("passwordresetissue", "Issue in updating Password. Try Again");
            request.getRequestDispatcher("password_change.jsp").forward(request, response);
		}
		
	}

}
