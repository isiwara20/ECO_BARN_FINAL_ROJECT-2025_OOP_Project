package com.ecobarn.servlet;

import com.ecobarn.DAO.DealDAO;

import com.ecobarn.model.DealModel;

import javax.servlet.*;
import javax.servlet.http.*;
//import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

//@WebServlet("/DealDetailServlet")
public class DealDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        
        List<DealModel> dealList = null;
		try {
			dealList = DealDAO.getAllDeals();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
        
        
        request.setAttribute("dealList", dealList);
        RequestDispatcher rd = request.getRequestDispatcher("dailyDeals.jsp");
        rd.forward(request, response);
    }
}
