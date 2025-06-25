package com.ecobarn.servlet;

import java.io.IOException;

import com.ecobarn.controller.UserController;
import com.ecobarn.util.AccountUserNameGenerate;
import com.ecobarn.util.WhatsAPPOTP;

import javax.servlet.http.HttpSession;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/SignUpInsertServlet")
public class SignUpInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		
		
		//call the function to get the username and generate otp
		@SuppressWarnings("unused")
		String username = AccountUserNameGenerate.generateUsernameAndStoreOTP(request, fname, lname);
		
		// Get the session from the request
		HttpSession session = request.getSession();

		// Retrieve OTP from session as Integer
		Integer otp = (Integer) session.getAttribute("otp");

		WhatsAPPOTP.sendOTP(phone, otp , fname);
		
		
		
		session.setAttribute("username", username);
		session.setAttribute("phone", phone);
		
		session.setAttribute("fname", fname);


		//String username ="aa";
		
		
		boolean isTrue = false;
		
		try {
			isTrue = UserController.insertData(fname, lname, email, phone, password,username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(isTrue == true)
		{
			String alertMessage = "Data Inserted";
			response.getWriter().println("<script>window.location.href = 'verifycode.jsp' </script>");
		}
		else
		{
			   request.setAttribute("signupissue", "Issue in entered details, Try Again");
               request.getRequestDispatcher("signup.jsp").forward(request, response);
		}
		
		
	}

}
