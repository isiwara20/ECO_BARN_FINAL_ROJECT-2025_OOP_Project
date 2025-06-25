package com.ecobarn.servlet;

import com.ecobarn.DAO.ReviewDAO;
import com.ecobarn.model.Review;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/testimonial")
public class TestimonialServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public TestimonialServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            List<Review> reviews = ReviewDAO.getAllReviews();  // get reviews from DAO
            request.setAttribute("reviews", reviews);          // set into request
            request.getRequestDispatcher("home.jsp").forward(request, response); // forward to home
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("wrong.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response); // Same handling for POST
    }
}
