package com.ecobarn.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecobarn.controller.AdminController;
import com.ecobarn.controller.UserController;

//@WebServlet("/DeleteAccountServlet")
public class DeleteAccountServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	String username = request.getParameter("usernamedelete");
	
	boolean isDeleted = false;
	
    try {
		 isDeleted = UserController.deleteUserAccount(username);
	} catch (Exception e) {
		e.printStackTrace();
	}
    

    if(isDeleted)
    {
    	 request.setAttribute("userdeletemessage", "User is Successfully deleted");
         request.getRequestDispatcher("AdminDashboardStaticsServlet").forward(request, response);
    }
    else {
    	request.setAttribute("userdeletemessage", "User is Not found or Already deleted");
        request.getRequestDispatcher("AdminDashboardStaticsServlet").forward(request, response);

    }
	
    
    
    
	}

}
