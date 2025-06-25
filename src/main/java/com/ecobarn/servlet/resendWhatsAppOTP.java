package com.ecobarn.servlet;

import com.ecobarn.util.GenerateOTP;
import com.ecobarn.util.WhatsAPPOTP;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

//@WebServlet("/resendwahtsppotp")
public class resendWhatsAppOTP extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Get phone, fname from session
        String phone = (String) session.getAttribute("phone");
        String fname = (String) session.getAttribute("fname");

        if (phone != null && fname != null) {
            // Generate new OTP
            int otp = GenerateOTP.generateStoreOTP(request);

            // Send OTP via WhatsApp
            WhatsAPPOTP.sendOTP(phone, otp, fname);

            // Redirect back to verification page with a message
            request.setAttribute("resendSuccess", "A new verification code has been sent.");

            request.getRequestDispatcher("verifycode.jsp").forward(request, response);
            
        } else {
            // Missing session data
            response.getWriter().println("<script>alert('Session expired or missing data.'); window.location='signup.jsp';</script>");

        }
    }
}
