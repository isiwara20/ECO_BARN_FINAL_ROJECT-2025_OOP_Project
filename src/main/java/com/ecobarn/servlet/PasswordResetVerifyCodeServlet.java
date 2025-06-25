package com.ecobarn.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

//@WebServlet("/PasswordResetVerifyCodeServlet")
public class PasswordResetVerifyCodeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // false to avoid creating a new session if expired

        if (session == null || session.getAttribute("otp") == null || session.getAttribute("username") == null) {
            request.setAttribute("invalidCode", "Session expired. Please try again.");
            request.getRequestDispatcher("reset_password_otp_verify.jsp").forward(request, response);
            return;
        }

        Integer otp = (Integer) session.getAttribute("otp");
        String codeStr = request.getParameter("code");
        String username = (String) session.getAttribute("username");

        if (codeStr == null || codeStr.trim().isEmpty()) {
            request.setAttribute("invalidCode", "Please enter the code.");
            request.getRequestDispatcher("reset_password_otp_verify.jsp").forward(request, response);
            return;
        }

        try {
            int enteredCode = Integer.parseInt(codeStr.trim());

            if (otp.equals(enteredCode)) {
                session.setAttribute("username", username); // For reset_password.jsp
                request.getRequestDispatcher("password_change.jsp").forward(request, response);
            } else {
                request.setAttribute("invalidCode", "Invalid OTP. Try again.");
                request.getRequestDispatcher("reset_password_otp_verify.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("invalidCode", "Code must be numbers only.");
            request.getRequestDispatcher("reset_password_otp_verify.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Internal server error. Please check logs.");
        }
    }
}
