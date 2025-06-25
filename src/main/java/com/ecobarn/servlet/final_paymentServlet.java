package com.ecobarn.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.ecobarn.DAO.Payment_detailsDAO;
import com.ecobarn.model.User;

//@WebServlet("/final_paymentServlet")  // Don't forget this annotation or configure in web.xml
public class final_paymentServlet extends HttpServlet {
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String finalAmount = request.getParameter("finalAmount");

        try {
            User paymentInfo = Payment_detailsDAO.getDetailsforPayment(username);

            if (paymentInfo != null) {
                HttpSession session = request.getSession();
                session.setAttribute("finalAmount", finalAmount);

                request.setAttribute("paymentInfo", paymentInfo);

                // Forward to JSP
                request.getRequestDispatcher("payment.jsp").forward(request, response);
            } else {
                request.setAttribute("errorsignin", "Invalid details from DB.");
                request.getRequestDispatcher("wrong.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred.");
            request.getRequestDispatcher("wrong.jsp").forward(request, response);
        }
    }
}
