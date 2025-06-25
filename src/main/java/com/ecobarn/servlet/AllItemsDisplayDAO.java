package com.ecobarn.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecobarn.DAO.ItemDAO;
import com.ecobarn.model.ItemDetails;

/**
 * Servlet implementation class AllItemsDisplayDAO
 */
@WebServlet("/AllItemsDisplayDAO")
public class AllItemsDisplayDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ItemDAO dao = new ItemDAO();

		Map<String, List<ItemDetails>> allItemsByCategory = new HashMap<>();
		try {
			allItemsByCategory.put("Fruits", dao.getItemsByCategory("fruits"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			allItemsByCategory.put("Vegetables", dao.getItemsByCategory("vegetables"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			allItemsByCategory.put("Fresh Nuts", dao.getItemsByCategory("freshnuts"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			allItemsByCategory.put("Leafy Greens", dao.getItemsByCategory("leafygreen"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			allItemsByCategory.put("Root Vegetables", dao.getItemsByCategory("root"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("allItems", allItemsByCategory);
		request.getRequestDispatcher("shop.jsp").forward(request, response);

		
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doPost(request, response); // reuse the logic in doPost
	}


}
