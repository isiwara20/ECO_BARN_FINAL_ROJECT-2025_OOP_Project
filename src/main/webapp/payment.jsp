<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <!-- IT23600652 Isiwara Wijesinghe -->   


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="javax.crypto.Mac" %>
<%@ page import="javax.crypto.spec.SecretKeySpec" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- 
 This code block initializes the DirectPay Payment Gateway for secure online transactions.
 It prepares a Base64-encoded payload and generates a HMAC-SHA256 signature using the merchant's secret key.
 These values are used to securely launch the inline payment interface using the DirectPay SDK.
 Source: Adapted from the DirectPay Lanka API documentation.
 Reference:
 - DirectPay Lanka API Docs: https://docs.directpay.lk
--%>


<%@ page import="com.ecobarn.model.User" %>

<%
    // Get the user details from request
    User paymentInfo = (User) request.getAttribute("paymentInfo");

    // Get final amount from session
    String finalAmount = String.valueOf(session.getAttribute("finalAmount"));
    
    String email = paymentInfo.getEmail();
    String phone = paymentInfo.getPhone();
    String merchant_id = "**";
    String secret_key = "*********";

    // Prepare payload
    Map<String, Object> payload = new HashMap<>();
    payload.put("merchant_id", merchant_id);
    payload.put("amount", finalAmount);
    payload.put("type", "ONE_TIME");
    payload.put("order_id", "ORDER" + System.currentTimeMillis());
    payload.put("currency", "LKR");
    payload.put("response_url", "http://localhost:8081/PROJECT_NEW/successPayment.jsp");
    payload.put("first_name", paymentInfo.getFname());
    payload.put("last_name", paymentInfo.getLname());
    payload.put("email", paymentInfo.getEmail());
    payload.put("phone", paymentInfo.getPhone());
    payload.put("logo", ""); // Optional

    Gson gson = new Gson();
    String jsonPayload = gson.toJson(payload);
    String encodedPayload = Base64.getEncoder().encodeToString(jsonPayload.getBytes("UTF-8"));

    // Generate HMAC SHA256 signature
    Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
    SecretKeySpec secret_key_spec = new SecretKeySpec(secret_key.getBytes("UTF-8"), "HmacSHA256");
    sha256_HMAC.init(secret_key_spec);
    byte[] hash = sha256_HMAC.doFinal(encodedPayload.getBytes("UTF-8"));
    StringBuilder hexString = new StringBuilder();
    for (byte b : hash) {
        String hex = Integer.toHexString(0xff & b);
        if (hex.length() == 1) hexString.append('0');
        hexString.append(hex);
    }
    String signature = hexString.toString();

    
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
     <title>Eco-Barn | Online Payment </title>
  <link rel="icon" type="image/x-icon" href="img/logoblack.png">

<style>
.secure-payment-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 40px;
    background-color: #ffffff;
    border-bottom: 2px solid #e0e0e0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.logo-section img {
    height: 50px;
}

.payment-info-section .secure-label {
    font-size: 18px;
    font-weight: 600;
    color: #2c3e50;
    letter-spacing: 1px;
}

.user-section .user-text {
    font-size: 14px;
    color: #555;
}

.signin-link {
    font-size: 14px;
    color: #007bff;
    text-decoration: none;
}

.signin-link:hover {
    text-decoration: underline;
}

#successMessage {
    background-color: #f9f9fb;
    border: 1px solid #e0e0e0;
    border-radius: 12px;
    max-width: 500px;
    margin: 60px auto;
    padding: 30px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
    font-family: 'Segoe UI', 'Roboto', sans-serif;
    text-align: center;
    animation: fadeIn 0.5s ease-in-out;
}

#successMessage h2 {
    color: #2e7d32;
    font-size: 28px;
    margin-bottom: 16px;
}

#successMessage p {
    font-size: 16px;
    color: #555;
}

#successMessage button {
    margin-top: 20px;
    padding: 12px 24px;
    background-color: #2e7d32;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

#successMessage button:hover {
    background-color: #256428;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
}


</style>
    <script src="https://cdn.directpay.lk/v3/directpayipg.min.js"></script>
</head>
<body>
    <!-- Secure Payment Header -->
<header class="secure-payment-header">
    <div class="logo-section">
        <a href="index.jsp">
            <img src="${pageContext.request.contextPath}/img/logoblack.png" alt="ECO_BARN">
        </a>
    </div>

    <div class="payment-info-section">
        <span class="secure-label">Secure Payment</span>
    </div>

    <div class="user-section">
        <c:if test="${not empty username}">
            <span class="user-text">Logged in as: <strong>${username}</strong></span>
        </c:if>
        <c:if test="${empty username}">
            <a href="signin.jsp" class="signin-link">Sign In</a>
        </c:if>
    </div>
</header>

<div id="successMessage" style="display: none;">

 <form id="redirectForm" action="OrderSuccessServlet" method="post">
    <h2>✅ Payment Successful!</h2>
    <p>You will be redirected to the confirmation page in <span id="countdown">5</span> seconds...</p>
        <input type="hidden" name="email" value="${paymentInfo.email}">
    <input type="hidden" name="phone" value="${paymentInfo.phone}">    
    <input type="hidden" name="amount" value="${finalAmount}"> 
    
    
    <button >Click here if not redirected</button>
    </form>
    
</div>

    <div id="card_container" style="margin: 20px 0;"></div>


    <script>
        // Data from server-side JSP
        const encoded_payload = "<%= encodedPayload %>";
        const signature = "<%= signature %>";
        let dp;

        dp = new DirectPayIpg.Init({
            signature: signature,
            dataString: encoded_payload,
            stage: 'PROD',
            container: 'card_container'
        });

    
        function openInlineCheckout() {
            if (!dp) return alert("Payment setup not ready");
            dp.doInContainerCheckout()
                .then(data => {
                    console.log("Inline Checkout Success:", data);
                    
                    handleSuccess();
                })
                .catch(error => {
                    console.error("Inline Checkout Error:", error);
                    alert("Payment Failed!\n" + JSON.stringify(error));
                });
        }
        
        
        window.onload = function() {
            openInlineCheckout();
            //handleSuccess();///for cheking

            
        };
        
        
        
        
        function handleSuccess() {
            // Show success message and start countdown
            document.getElementById("successMessage").style.display = "block";
            let countdown = 5;
            const countdownSpan = document.getElementById("countdown");

            const interval = setInterval(() => {
                countdown--;
                countdownSpan.textContent = countdown;
                if (countdown <= 0) {
                    clearInterval(interval);
                    document.getElementById("redirectForm").submit(); // Submit the form to servlet
                }
            }, 1000);
        }

    </script>
</body>
</html>
