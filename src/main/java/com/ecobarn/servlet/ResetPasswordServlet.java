package com.ecobarn.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecobarn.controller.UserController;
import com.ecobarn.model.User;
import com.ecobarn.util.WhatsAPPOTP;
import com.ecobarn.util.GenerateOTP;


//@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String credential = request.getParameter("resetcredentials");

        HttpSession session = request.getSession();

		
		try {
			User userpasswordReset =  new User();
			
			
			userpasswordReset = UserController.checkresetpasswordCredentials(credential);
			if(userpasswordReset != null)
			{
				int otp = GenerateOTP.generateStoreOTP(request);
				
				
				String phone = userpasswordReset.getPhone();
				String fname = userpasswordReset.getFname();
				
				
				WhatsAPPOTP.sendOTP(phone, otp, fname);
				
				session.setAttribute("phone", userpasswordReset.getPhone());
				session.setAttribute("username", userpasswordReset.getUsername());

				
				request.setAttribute("userpasswordReset", userpasswordReset);
	            request.getRequestDispatcher("reset_password_otp_verify.jsp").forward(request, response);
			}else
			{
				 request.setAttribute("errorpasswordreset", "Username / Email not exisiting. Please Try Again");
	                request.getRequestDispatcher("reset_password.jsp").forward(request, response);
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
	}

}
