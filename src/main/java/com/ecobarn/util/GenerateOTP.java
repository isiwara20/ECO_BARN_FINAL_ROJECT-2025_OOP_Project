package com.ecobarn.util;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class GenerateOTP {
	
	public static int generateStoreOTP(HttpServletRequest request) {
	       
	 HttpSession session = request.getSession();
     Random rand = new Random();

     // Generate 4-digit OTP and store in session
     int otp = 1000 + rand.nextInt(9000); // 1000 to 9999
     session.setAttribute("otp", otp);
     
     return otp;
	}
     
}
