package com.ecobarn.util;


import java.io.*;

import java.net.*;

public class WhatsAppUsername {
	
	
	/**
	 * Sends a generated username to the user's mobile number via WhatsApp using the WhatsFlow API.
	 *
	 * This method formats the given phone number to conform to the international format (starting with "94"),
	 * constructs a JSON payload using a predefined WhatsApp template code, and sends the request through
	 * a POST operation to the WhatsFlow API endpoint. The username is dynamically inserted into the message template.
	 *
	 * Features:
	 * - Ensures the phone number is in correct international format (Sri Lankan format: 94XXXXXXXXX).
	 * - Removes any '+' characters from the input to prevent format issues.
	 * - Uses the WhatsFlow API's message template system to deliver a personalized message.
	 * - Handles both API response and network/IO exceptions.
	 *
	 * Parameters:
	 * @param phoneNumber The recipient's mobile number (e.g., "0771234567" or "94771234567").
	 * @param username    The generated username to send to the user via WhatsApp.
	 *
	 * @return A string representing the API response or error message.
	 *
	 * Example:
	 * <pre>
	 * String result = WhatsAppUsername.sendUsername("0771234567", "JOHDOE25021");
	 * System.out.println(result); // Will print the API response or error
	 * </pre>
	 *
	 * Source: Based on HTTP POST operations using Java's HttpURLConnection.
	 *
	 * References:
	 * - WhatsFlow API Docs: https://panel.whatsflow.xyz/docs/
	 * - Java HttpURLConnection: https://docs.oracle.com/javase/8/docs/api/java/net/HttpURLConnection.html
	 */


    // Function to send OTP to the phone number
    public static String sendUsername(String phoneNumber, String username) {
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
                + "\"templateCode\": \"857d95bf2945264c\","
                + "\"variables\": [\"" + username  + "\"],"
                + "\"number\": \"" + phoneNumber + "\""
                + "}";
        
        // Bearer token (Replace with actual token)
        String token = "**";

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
