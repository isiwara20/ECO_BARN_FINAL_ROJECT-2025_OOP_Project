package com.ecobarn.util;

import java.io.*;

import java.net.*;
public class WhatsAppOrderSuccess {
	
	
	
	/**
	 * Sends a WhatsApp message to notify the user of a successful order using the WhatsFlow API.
	 *
	 * This method formats the provided phone number into the international format (Sri Lanka: 94xxxxxxxxx),
	 * constructs a JSON payload with a predefined message template code, and injects the `orderID`
	 * into the message as a dynamic variable. It then sends a POST request to the WhatsFlow API endpoint.
	 *
	 * Features:
	 * - Ensures phone number follows the 94xxxxxxxxx format.
	 * - Removes '+' symbols to meet the API's expected input.
	 * - Dynamically fills in the order ID within a WhatsApp message template.
	 * - Handles both successful API responses and potential exceptions gracefully.
	 *
	 * Parameters:
	 * @param phoneNumber The recipient's phone number (e.g., "0771234567" or "94771234567").
	 * @param orderID     The unique identifier of the order to include in the confirmation message.
	 *
	 * @return A `String` containing the API's response message or an error description.
	 *
	 * Example:
	 * <pre>
	 * String response = WhatsAppOrderSuccess.sendOrderSuccessMsg("0771234567", "ORD123456");
	 * System.out.println(response); // Outputs API success or failure response
	 * </pre>
	 *
	 * Source: Built using Java’s `HttpURLConnection` for making HTTP POST requests.
	 *
	 * References:
	 * - WhatsFlow API Documentation: https://panel.whatsflow.xyz/docs/
	 * - Java Networking (HttpURLConnection): https://docs.oracle.com/javase/8/docs/api/java/net/HttpURLConnection.html
	 */

	
	 // Function to send OTP to the phone number
    public static String sendOrderSuccessMsg(String phoneNumber, String orderID) {
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
                + "\"templateCode\": \"d8ae8688b6ec4cd4\","
                + "\"variables\": [\"" + orderID  + "\"],"
                + "\"number\": \"" + phoneNumber + "\""
                + "}";
        
        // Bearer token (Replace with actual token)
        String token = "********";

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
