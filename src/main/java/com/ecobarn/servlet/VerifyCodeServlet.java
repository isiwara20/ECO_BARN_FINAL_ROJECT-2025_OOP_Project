package com.ecobarn.servlet;

import com.ecobarn.controller.UserController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("/VerifyCodeServlet")
public class VerifyCodeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Get OTP and phone from session
        String phone =  (String) session.getAttribute("phone");
        Integer otp = (Integer) session.getAttribute("otp");
        String username = (String) session.getAttribute("username");

        // Get entered code from user
        String codeStr = request.getParameter("code");

        // Check if user actually entered a code
        if (codeStr == null || codeStr.trim().isEmpty()) {
            request.setAttribute("invalidCode", "Please enter the code.");
            request.getRequestDispatcher("/verifycode.jsp").forward(request, response);
            return;
        }

        try {
            int enteredCode = Integer.parseInt(codeStr.trim());

            if (otp != null && otp == enteredCode) {
            	boolean isUpdated = UserController.updatephonenumber(phone, username);

                if (isUpdated) {
                    response.sendRedirect("accountcreate.jsp");
                } else {
                    request.setAttribute("invalidCode", "Phone update failed. Try again.");
                    request.getRequestDispatcher("verifycode.jsp").forward(request, response);
                }

       }
            else
            {
                request.setAttribute("invalidCode", "Invalid OTP. Try again.");
                request.getRequestDispatcher("verifycode.jsp").forward(request, response);
            }
            
        
        
        } catch (NumberFormatException e) {
            // Non-numeric input
            request.setAttribute("invalidCode", "Code must be numbers only.");
            request.getRequestDispatcher("/verifycode.jsp").forward(request, response);
        } catch (Exception e) {
		e.printStackTrace();
	}
    }

}
