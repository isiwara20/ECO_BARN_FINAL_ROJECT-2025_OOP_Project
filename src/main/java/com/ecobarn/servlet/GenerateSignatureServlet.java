package com.ecobarn.servlet;


import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;
import org.json.JSONObject;

public class GenerateSignatureServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set your DirectPay credentials
        String merchantId = "PI11698";
        String secretKey = "e323367ed65ed033115ff27555a418fd4f0e534067c49e0a10b9949a871427a0";

        // Build payment payload
        Map<String, String> payload = new HashMap<>();
        payload.put("merchant_id", merchantId);
        payload.put("amount", "100.00");
        payload.put("type", "ONE_TIME");
        payload.put("order_id", "ORDER" + System.currentTimeMillis());
        payload.put("currency", "LKR");
        payload.put("response_url", "https://yourwebsite.com/confirmation-endpoint");
        payload.put("first_name", "John");
        payload.put("last_name", "Doe");
        payload.put("email", "johndoe@email.com");
        payload.put("phone", "0771234567");
        payload.put("logo", ""); // Optional logo URL

        // Encode payload to JSON and then base64
        String jsonPayload = new JSONObject(payload).toString();
        String encodedPayload = Base64.getEncoder().encodeToString(jsonPayload.getBytes());

        // Generate signature using HMAC SHA256
        String signature = generateSignature(encodedPayload, secretKey);

        // Set response content type to JSON
        response.setContentType("application/json");

        // Create JSON object for the response
        JSONObject responseJson = new JSONObject();
        responseJson.put("encoded_payload", encodedPayload);
        responseJson.put("signature", signature);

        // Send the response
        PrintWriter out = response.getWriter();
        out.print(responseJson.toString());
        out.flush();
    }

    private String generateSignature(String encodedPayload, String secretKey) {
        try {
            Mac mac = Mac.getInstance("HmacSHA256");
            SecretKeySpec secretKeySpec = new SecretKeySpec(secretKey.getBytes(), "HmacSHA256");
            mac.init(secretKeySpec);
            byte[] hashBytes = mac.doFinal(encodedPayload.getBytes());
            return bytesToHex(hashBytes);
        } catch (Exception e) {
            throw new RuntimeException("Error generating signature", e);
        }
    }

    // Utility method to convert bytes to hex
    private String bytesToHex(byte[] bytes) {
        StringBuilder hexString = new StringBuilder();
        for (byte b : bytes) {
            hexString.append(String.format("%02x", b));
        }
        return hexString.toString();
    }
}
