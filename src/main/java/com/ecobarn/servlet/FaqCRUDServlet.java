package com.ecobarn.servlet;

import com.ecobarn.util.DBConnection;
import java.io.IOException;
import java.sql.*;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;

//@WebServlet("/FaqCRUDServlet")
public class FaqCRUDServlet extends HttpServlet {
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
        try (Connection conn = DBConnection.getConnection()) {
            String action = request.getParameter("action");
            int faq_id = Integer.parseInt(request.getParameter("faq_id"));

            if ("delete".equals(action)) {
                PreparedStatement stmt = conn.prepareStatement("DELETE FROM faq WHERE faq_id = ?");
                stmt.setInt(1, faq_id);
                stmt.executeUpdate();

            } else if ("save".equals(action)) {
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
                
                if (question == null || question.trim().isEmpty()) {
                    response.setContentType("text/html");
                    response.getWriter().println("<script>alert('Question field cannot be empty.'); window.history.back();</script>");
                    return;
                }

                PreparedStatement stmt = conn.prepareStatement(
                    "UPDATE faq SET name = ?, email = ?, phonenumber = ?, nic = ?, question = ? WHERE faq_id = ?"
                );
                stmt.setString(1, name);
                stmt.setString(2, email);
                stmt.setString(3, phonenumber);
                stmt.setString(4, nic);
                stmt.setString(5, question);
                stmt.setInt(6, faq_id);
                stmt.executeUpdate();
            }

            response.sendRedirect("faqList.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
