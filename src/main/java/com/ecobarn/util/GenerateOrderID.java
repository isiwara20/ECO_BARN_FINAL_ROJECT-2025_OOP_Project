package com.ecobarn.util;

import java.time.LocalDate;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class GenerateOrderID {


    public static String generateORDERID(HttpServletRequest request, String name, String city) {
        HttpSession session = request.getSession();
        Random rand = new Random();

        

        // Convert names to uppercase
        name = name.toUpperCase();
        city = city.toUpperCase();

        // Get initials (safely with length checks)
        String finitial = name.length() >= 3 ? name.substring(0, 3) : name;
        String linitial = city.length() >= 2 ? city.substring(0, 2) : city;

        // Get last two digits of current year
        String year = String.valueOf(LocalDate.now().getYear()).substring(2);

        // Random 2-digit number
        int randomNum = (int) (1000 + (Math.random()*1000)) ;// 1000 to 1999

        // Build username
        String username = finitial + linitial + year + randomNum;

     

        return username;
    }
}
