package com.ecobarn.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecobarn.DAO.Admin_CountDAO;
import com.ecobarn.DAO.Income_SumDAO;
import com.ecobarn.DAO.OrderCoutDAO;
import com.ecobarn.DAO.Product_CountDAO;
import com.ecobarn.DAO.User_CountDAO;
import com.ecobarn.controller.TicketRespondController;
import com.ecobarn.model.Admin;
import com.ecobarn.model.Contact;

//@WebServlet("/AdminDashboardStaticsServlet")
public class AdminDashboardStaticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    String currentDate = LocalDate.now().format(dateFormatter);

	    int ordersToday = 0;
	    int usercount = 0;
	    int admincount = 0;
	    double income = 0.0;
	    int productCount = 0;

	    try {
	        ordersToday = OrderCoutDAO.getOrdersCountToday(currentDate);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    try {
	        usercount = User_CountDAO.getUserCount();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    try {
	        admincount = Admin_CountDAO.getAdminCount();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    try {
	        income = Income_SumDAO.getTodayIncome(currentDate);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    try {
	        LinkedList<Contact> tickets = TicketRespondController.getTicketArraised();
	        request.setAttribute("allticketinfo", tickets);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    
	    
	    try {
	    	
	    	productCount += Product_CountDAO.getFruitCount();
	    	productCount += Product_CountDAO.getLeadyItemCount();
	    	productCount += Product_CountDAO.getNutItemCount();
	    	productCount += Product_CountDAO.getRootItemCount();
	    	productCount += Product_CountDAO.getVegetableCount();

	    	
	    }catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	    
	    
	    request.setAttribute("productCount", productCount);

	    request.setAttribute("income", income);
	    request.setAttribute("usercount", usercount);
	    request.setAttribute("admincount", admincount);
	    request.setAttribute("ordersToday", ordersToday);

	    RequestDispatcher dispatcher = request.getRequestDispatcher("adminDashBoard.jsp");
	    dispatcher.forward(request, response);
	}

	}
