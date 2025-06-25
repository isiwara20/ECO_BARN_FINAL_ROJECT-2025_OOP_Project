package com.ecobarn.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecobarn.DAO.Admin_detailsDAO;
import com.ecobarn.model.Admin;

@WebServlet("/directToAdminDashboardfromMenuServlet")
public class directToAdminDashboardfromMenuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

   
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 // to go to dashboard via menu button.. this is essential to get admin details from session 
        HttpSession session = request.getSession(false);
        
        
        String username = (String) session.getAttribute("username");
       String password = (String) session.getAttribute("password");
        
        //System.out.println(password);
        Admin adminlogin = new Admin();
        try {
    		adminlogin = Admin_detailsDAO.checkAdminLogincredentials(username, password);

        }catch(Exception e)
        {
        	e.printStackTrace();
        }

		
		 request.setAttribute("adminlogindetails", adminlogin);
         
         session.setAttribute("adminlogindetails", adminlogin);

         request.getRequestDispatcher("AdminDashboardStaticsServlet").forward(request, response);
        
        
        
    }

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
