package com.ecobarn.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecobarn.controller.AddressController;

/**
 * Servlet implementation class ReadAddressServlet
 */
@WebServlet("/ReadAddressServlet")
public class ReadAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReadAddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
            try {
				request.setAttribute("addresses", AddressController.getAllAddresses());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            RequestDispatcher dispatcher = request.getRequestDispatcher("address.jsp");
            dispatcher.forward(request, response);
		}

}

