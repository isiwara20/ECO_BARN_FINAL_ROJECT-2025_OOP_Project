package com.ecobarn.Factory;

import com.ecobarn.DAO.AddProductDAO;
import com.ecobarn.DAO.FruitProductDAO;
import com.ecobarn.DAO.LeafyItemProductDAO;
import com.ecobarn.DAO.NutItemProductDAO;
import com.ecobarn.DAO.RootItemProductDAO;
import com.ecobarn.DAO.VegetableProductDAO;

public class AddProductDAOFactory {


	 public static AddProductDAO getProductDAO(String productType) {
	        switch (productType) {
	            case "Fruits":
	            	return new FruitProductDAO();
	            	
	            case "Vegetables": 
	            	return new VegetableProductDAO();
	            	
	            case "Root Items": 
	            	return new RootItemProductDAO();
	            	
	            case "Nut Items": 
	            	return new NutItemProductDAO();
	            case "Leafy Items": 
	            	
	            	return new LeafyItemProductDAO();
	            default: 
	            	throw new IllegalArgumentException("Invalid product type");
	        }
	    }
}
