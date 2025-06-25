package com.ecobarn.util;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.Random;

public class AccountUserNameGenerate {

    public static String generateUsernameAndStoreOTP(HttpServletRequest request, String firstName, String lastName) {
        HttpSession session = request.getSession();
        Random rand = new Random();

        // Generate 4-digit OTP and store in session
        int otp = 1000 + rand.nextInt(9000); // 1000 to 9999
        session.setAttribute("otp", otp);
        

        // Convert names to uppercase
        firstName = firstName.toUpperCase();
        lastName = lastName.toUpperCase();

        // Get initials (safely with length checks)
        String finitial = firstName.length() >= 3 ? firstName.substring(0, 3) : firstName;
        String linitial = lastName.length() >= 2 ? lastName.substring(0, 2) : lastName;

        // Get last two digits of current year
        String year = String.valueOf(LocalDate.now().getYear()).substring(2);

        // Random 3-digit number
        int randomNum = 100 + rand.nextInt(900); // 10 to 99

        // Build username
        String username = finitial + linitial + year + randomNum;

     

        return username;
    }
}
