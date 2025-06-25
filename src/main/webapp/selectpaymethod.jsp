<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <!-- IT23600652 Isiwara Wijesinghe -->   

<%
    String username = (String) session.getAttribute("username");



%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eco-Barn | Select Pay Method</title>
  <link rel="icon" type="image/x-icon" href="img/logoblack.png">

    
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <!-- Custom Styles -->
    
    
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
      
       

   
       

        .container {
            max-width: 1000px;
            margin: auto;
            margin-top:20px;
            margin-bottum :20px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 40px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 10px;
        }

        .info-note {
            text-align: center;
            color: #7f8c8d;
            margin-bottom: 30px;
            font-size: 14px;
        }

        .checkout-grid {
            display: flex;
            gap: 30px;
            flex-wrap: wrap;
        }

        .left, .right {
            flex: 1 1 45%;
        }

        .section-title {
            font-weight: 600;
            color: #34495e;
            font-size: 18px;
            margin-bottom: 15px;
            text-align:center;
        }

        .summary p {
            margin: 8px 0;
            color: #555;
            font-size: 15px;
        }

        .payment-options {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .option-card {
            border: 2px solid #dcdde1;
            border-radius: 10px;
            padding: 20px;
            cursor: pointer;
            background-color: #fafafa;
            text-align: center;
            transition: all 0.3s ease;
        }

        .option-card:hover,
        .option-card.selected {
           border-color: #27ae60;
            background-color: #e8f6f0;
        }

        .option-card i {
            font-size: 28px;
            margin-bottom: 10px;
            color: #3498db;
        }

        .option-card input[type="radio"] {
            display: none;
        }

        .submit-btn {
            margin-top: 30px;
            width: 100%;
            padding: 14px;
            background-color: #27ae60;
                        color: #fff;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #1e8449;        }

        @media (max-width: 768px) {
            .checkout-grid {
                flex-direction: column;
            }

            .left, .right {
                flex: 1 1 100%;
            }
        }







  
        
    </style>
<script>
document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form");
    const codInput = document.getElementById("cod-input");

    form.addEventListener("submit", function (event) {
        if (codInput.checked) {
            event.preventDefault(); // Stop default form

            // Set values to hidden form
            document.getElementById("postFinalAmount").value = document.querySelector("input[name='finalAmount']").value;
            document.getElementById("postUsername").value = document.querySelector("input[name='username']").value;

            // Submit hidden form
            document.getElementById("codForm").submit();
        }
    });
});


</script>

</head>
<body>
<%@ include file="header.jsp" %>



<div class="container">
        <h2>Secure Checkout</h2>
        <p class="info-note">Review your order and choose a payment method to proceed.</p>

        <form action="final_paymentServlet" method="post">
            <div class="checkout-grid">
                <!-- LEFT: Order Summary -->
                <div class="left">
                    <div class="section-title" >Order Summary</div>
                    <div class="summary">
                    <br>
                        <p><strong>Name:</strong> ${selectedName}</p>
                        <p><strong>Phone:</strong> ${selectedPhone}</p>
                        <p><strong>Shipping Address:</strong> ${selectedAddress}</p>
                        <p><strong>Delivery Fee:</strong> Rs. ${deliveryFee}</p>
                        <p><strong>Total Amount:</strong> Rs. ${finalAmount}</p>
                    </div>
                </div>

                <!-- RIGHT: Payment Options -->
                <div class="right">
                    <div class="section-title">Select Payment Method</div>
                    <div class="payment-options">
                        <label id="cod" class="option-card" onclick="selectOption('cod')">
                            <i class="fa fa-truck"></i><br>
                            <strong>Cash on Delivery</strong>
                            <input type="radio" name="paymentMethod" value="Cash on Delivery" id="cod-input" required>
                        </label>

                        <label id="online" class="option-card" onclick="selectOption('online')">
                            <i class="fa fa-credit-card"></i><br>
                            <strong>Pay Online by Card</strong>
                            <input type="radio" name="paymentMethod" value="Online Payment" id="online-input">
                        </label>
                    </div>
                </div>
            </div>

            <!-- Hidden Inputs -->
            <input type="hidden" name="finalAmount" value="${finalAmount}">
            <input type="hidden" name="username" value="<%= username %>">

<button type="submit" class="submit-btn" id="submitBtn" >Proceed with Payment</button>
        </form>
    </div>
    
    
    <form id="codForm" action="forwardToCashOnDelivery" method="post" style="display: block;">
    <input type="hidden" name="finalAmount" id="postFinalAmount">
    <input type="hidden" name="username" id="postUsername">
</form>
    
    
    <br>

    <!-- FontAwesome CDN for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<%@ include file="footer.jsp" %>

    
</body>
</html>
    
