package com.ecobarn.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import com.ecobarn.controller.faqFormController;

public class FaqFormServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private boolean isValidPhone(String phone) {
        return phone != null && phone.matches("\\d{10}");
    }

    private boolean isValidNIC(String nic) {
        return nic != null && (nic.matches("\\d{12}") || nic.matches("\\d{9}[vVxX]"));
    }

    private boolean isValidEmail(String email) {
        return email != null && email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phonenumber");
        String nic = request.getParameter("nic");
        String question = request.getParameter("question");

        if (!isValidPhone(phonenumber)) {
            response.setContentType("text/html");
            response.getWriter().println("<script>alert('Phone number must be exactly 10 digits.'); window.history.back();</script>");
            return;
        }

        if (!isValidNIC(nic)) {
            response.setContentType("text/html");
            response.getWriter().println("<script>alert('Invalid NIC format.'); window.history.back();</script>");
            return;
        }

        if (!isValidEmail(email)) {
            response.setContentType("text/html");
            response.getWriter().println("<script>alert('Invalid email format.'); window.history.back();</script>");
            return;
        }

        boolean isTrue = false;

        try {
            isTrue = faqFormController.insertData(name, email, phonenumber, nic, question);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (isTrue) {
            response.sendRedirect("faqList.jsp");
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
            dis2.forward(request, response);
        }
    }
}
