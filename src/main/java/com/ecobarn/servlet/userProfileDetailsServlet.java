package com.ecobarn.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecobarn.controller.UserProfileController;
import com.ecobarn.model.User;
//akindu new
/**
 * Servlet implementation class userProfileDetailsServlet
 */
@WebServlet("/userProfileDetailsServlet")
public class userProfileDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		HttpSession session = request.getSession();
		 String username = (String) session.getAttribute("username");
		
		 User user = null;
		 
		 try {
			user= UserProfileController.profiledetails(username);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
         request.setAttribute("userprofile", user);
         
         request.getRequestDispatcher("myprofile.jsp").forward(request, response);


		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
