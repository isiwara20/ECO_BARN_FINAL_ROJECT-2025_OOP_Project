package com.ecobarn.servlet;

import com.ecobarn.DAO.DealDAO;

import com.ecobarn.model.DealModel;

import javax.servlet.*;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

//@WebServlet("/deals")
public class DealServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<DealModel> dealList = null;
		try {
			dealList = DealDAO.getAllDeals();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        request.setAttribute("dealList", dealList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("dailyDeals.jsp");
        dispatcher.forward(request, response);
    }
}
