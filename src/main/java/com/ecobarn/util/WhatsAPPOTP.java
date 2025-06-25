package com.ecobarn.util;


import java.io.*;
import java.net.*;

public class WhatsAPPOTP {
	
	
	
	/**
	 * Sends a One-Time Password (OTP) to a user's mobile number via WhatsApp using the WhatsFlow API.
	 * 
	 * This function connects to the WhatsFlow API endpoint and sends a message using a predefined template.
	 * It ensures the phone number is properly formatted to international standards (Sri Lankan format: 94XXXXXXXXX),
	 * constructs the JSON request body with dynamic variables (e.g., name and OTP), and handles both success and failure responses.
	 * 
	 * Features:
	 * - Formats Sri Lankan mobile numbers to international format (adds country code 94 if needed).
	 * - Removes invalid characters (e.g., '+') from the number.
	 * - Constructs a JSON payload with message template code and dynamic variables.
	 * - Makes a POST request to the WhatsFlow API endpoint.
	 * - Reads and returns the response from the API or the error if an exception occurs.
	 * 
	 * Parameters:
	 * @param phoneNumber The recipient's mobile number (e.g., "0771234567" or "94771234567").
	 * @param otp         The one-time password to send (e.g., 1234).
	 * @param name        The name of the user to personalize the message template.
	 * 
	 * @return A string response from the WhatsFlow API (success message or error details).
	 * 
	 * Source: Based on HTTP communication using Java's HttpURLConnection.
	 * 
	 * References:
	 * - WhatsFlow API Documentation: https://panel.whatsflow.xyz/docs/
	 * - Java HttpURLConnection: https://docs.oracle.com/javase/8/docs/api/java/net/HttpURLConnection.html
	 */


    // Function to send OTP to the phone number
    public static String sendOTP(String phoneNumber, int otp , String name) {
        // Format the phone number to ensure it follows 947xxxxxxx format
        if (phoneNumber.startsWith("0")) {
            phoneNumber = "94" + phoneNumber.substring(1);
        } else if (!phoneNumber.startsWith("94")) {
            phoneNumber = "94" + phoneNumber;
        }

        // Remove any '+' signs from the number
        phoneNumber = phoneNumber.replace("+", "");

        // API endpoint
        String url = "https://panel.whatsflow.xyz/api/client/send-template-message";
        
        // Example variables
      
        
        // Construct the JSON payload with OTP and other variables
        String jsonData = "{"
                + "\"templateCode\": \"f805440b300bd301\","
                + "\"variables\": [\"" + name + "\", \"" + otp + "\"],"
                + "\"number\": \"" + phoneNumber + "\""
                + "}";
        
        // Bearer token (Replace with actual token)
        String token = "***";

        try {
            // Create a URL object and open the connection
            URL apiUrl = new URL(url);
            HttpURLConnection conn = (HttpURLConnection) apiUrl.openConnection();

            // Set request method to POST
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setRequestProperty("Authorization", "Bearer " + token);
            conn.setRequestProperty("Content-Type", "application/json");

            // Send the JSON data
            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonData.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            // Read the response from the API
            int responseCode = conn.getResponseCode();
            StringBuilder response = new StringBuilder();
            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                String responseLine;
                while ((responseLine = br.readLine()) != null) {
                    response.append(responseLine.trim());
                }
            }

            // Return the response
            return response.toString();
        } catch (Exception e) {
            // Handle exceptions and return the error message
            return "Error: " + e.getMessage();
        }
    }
}
