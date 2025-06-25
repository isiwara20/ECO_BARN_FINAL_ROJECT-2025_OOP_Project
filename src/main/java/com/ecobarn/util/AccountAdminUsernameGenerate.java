package com.ecobarn.util;

import java.time.LocalDate;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

public class AccountAdminUsernameGenerate {

	 public static String generateUsernameAndStoreOTP(HttpServletRequest request) {
	   
	        // Get last two digits of current year
	        String year = String.valueOf(LocalDate.now().getYear()).substring(2);

	        Random rand = new Random();
	        int randomNum = new Random().nextInt(900) + 100;
	        // Build username
	        String username = "Admin" + year + randomNum;

	     

	        return username;
	    }
}
