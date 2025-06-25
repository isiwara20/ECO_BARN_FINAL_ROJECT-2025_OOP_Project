package com.ecobarn.servlet;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.ecobarn.controller.AddressController;
import com.ecobarn.model.Address;

import javax.servlet.*;
import javax.servlet.http.*;



public class AddressServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// Handle POST requests (Insert/Update)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("insert".equals(action)) {
            // Extract form data for Insert
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String country = request.getParameter("country");

            boolean isInserted = false;
			try {
				isInserted = AddressController.insertAddress(address, city, country);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

            if (isInserted) {
                response.sendRedirect("ReadAddressServlet");
            } else {
                response.sendRedirect("address.jsp?error=true");
            }
        } 
        
        else if ("update".equals(action)) {
            int address_id = Integer.parseInt(request.getParameter("address_id"));
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String country = request.getParameter("country");

            boolean isUpdated = false;
            try {
                isUpdated = AddressController.updateAddress(address_id, address, city, country);
            } catch (Exception e) {
                e.printStackTrace();
            }

            if (isUpdated) {
                response.setStatus(HttpServletResponse.SC_OK);
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    }

    // Handle GET requests (Read/Delete)
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null || "read".equals(action)) {
            try {
                List<Address> addresses = AddressController.getAllAddresses();
                // Check if addresses are returned and set them as request attribute
                if (addresses != null && !addresses.isEmpty()) {
                    request.setAttribute("addresses", addresses);
                } else {
                    // Set an empty list if no addresses are available
                    request.setAttribute("addresses", new ArrayList<Address>());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("address.jsp");
            dispatcher.forward(request, response);
        } else if ("delete".equals(action)) {
            int addressId = Integer.parseInt(request.getParameter("address_id"));
            boolean isDeleted = false;
            try {
                isDeleted = AddressController.deleteAddress(addressId);
            } catch (Exception e) {
                e.printStackTrace();
            }

            // Redirect to 'read' action to show updated list of addresses after deletion
            if (isDeleted) {
                response.sendRedirect("addressServlet?action=read");  // Fetch the updated list after deletion
            } else {
                response.sendRedirect("address.jsp?error=true");
            }
        }
    }
}