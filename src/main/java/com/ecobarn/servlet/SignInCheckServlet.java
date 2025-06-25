package com.ecobarn.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecobarn.controller.AdminController;
import com.ecobarn.controller.UserController;
import com.ecobarn.model.User;
import com.ecobarn.util.Logger;
import com.ecobarn.model.Admin;
import com.ecobarn.DAO.Admin_detailsDAO;


//@WebServlet("/SignInCheckServlet")
public class SignInCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String credential = request.getParameter("credential");
		String inpassword = request.getParameter("inpassword");
		
		
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");

        
        Logger logger = Logger.getInstance();
        
        // Get current date and time
        String currentDate = LocalDate.now().format(dateFormatter);  // e.g., "2025-05-05"
        String currentTime = LocalTime.now().format(timeFormatter);  // e.g., "14:30:00"
		
		try {
			User userlogin = new User();
			Admin adminlogin = new Admin();
			
			userlogin = UserController.checksignincredentials(credential, inpassword);
			adminlogin = Admin_detailsDAO.checkAdminLogincredentials(credential, inpassword);
			
			if (userlogin != null && adminlogin == null)
			{
				/////change according to home page details
				//request.setAttribute("userlogin", userlogin);
				
				
		        HttpSession session = request.getSession();
		        
		        // Get phone, fname from session
		        String username = userlogin.getUsername();
		        String email = userlogin.getEmail();	
		        session.setAttribute("userEmail", email);

		        
		        
				logger.log("User logged in: " + username);

		        		
		        session.setAttribute("username", username);
				
	          //  request.getRequestDispatcher("index.jsp").forward(request, response);
		        
				response.getWriter().println("<script>window.location.href = 'index.jsp' </script>");

			}else if(userlogin == null && adminlogin != null)
			{
				  HttpSession session = request.getSession();
			        
			        String username = adminlogin.getUsername();
			        String email = adminlogin.getEmail();	
			        session.setAttribute("userEmail", email);
		
			        
			        
			        session.setAttribute("username", username);
			        session.setAttribute("password", inpassword);//newly added 

			        
	                request.setAttribute("adminlogindetails", adminlogin);
	                
	                session.setAttribute("adminlogindetails", adminlogin);

					logger.log("Admin logged in: " + username);


	                
	                boolean isupdate = AdminController.updateLoginTime_Date( currentDate , currentTime ,username );

					
			        
	                request.getRequestDispatcher("AdminDashboardStaticsServlet").forward(request, response);
			}
			
			else
			{
				 request.setAttribute("errorsignin", "Invalid username/email or password.");
	                request.getRequestDispatcher("signin.jsp").forward(request, response);
			}

			
			
			
			
			
			
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
	}

}
