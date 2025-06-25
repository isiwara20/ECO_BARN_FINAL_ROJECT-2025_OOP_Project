<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- IT23731714 PATHIRANA L.P.S.G. -->   

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eco-Barn | Cancel Order </title>
  <link rel="icon" type="image/x-icon" href="img/logoblack.png">

    
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
   
   
    <!-- All the styles for cancelorder.jsp -->
    <style>
        body {
		    margin: 0;
		    padding: 0;
            background: linear-gradient(135deg, #eef5ec, #c8e6c9);
		    font-family: Arial, sans-serif;
		    display: flex;
		    flex-direction: column;
		    min-height: 100vh;
		}
		
		.container {
		    background-color: #ffffff;
		    padding: 40px;
		    border-radius: 10px;
		    box-shadow: 0 8px 16px rgba(0,0,0,0.1);
		    width: 100%;
		    max-width: 500px;
		    margin: 40px auto; /* centers the content horizontally with spacing from header/footer */
		}


        h1 {
            text-align: center;
            color: #2e7d32;
            font-size:24px;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        button {
            background-color: #2e7d32;
            color: white;
            padding: 10px 16px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #276c2a;
        }

        .message {
            margin-top: 20px;
            padding: 12px;
            border-radius: 5px;
            background-color: #e8f5e9;
            border: 1px solid #c8e6c9;
            color: #2e7d32;
            font-weight: bold;
            text-align: center;
        }
    </style>
    
    <script>
    
    </script>
</head>

<body>
   <jsp:include page="header.jsp"/>
   
<!--  cancelorder  -->
<div class="container">
    <h1>Cancel Your Order</h1>

    <!-- Display message if there is one -->
    <% String message = (String) request.getAttribute("message"); %>
    <% if (message != null) { %>
        <div class="message"><%= message %></div>
    <% } %>

    <form method="post" action="CancelOrderServlet">
        <label for="orderId">Order ID</label>
        <input type="text" id="orderId" name="orderId" required>

        <label for="reason">Reason for cancellation</label>
        <textarea id="reason" name="reason" required></textarea>

        <button type="submit">Cancel Order</button>
    </form>
</div>
    

<footer class="footer">
  <div class="footer-row">
    
  <!-- Logo + About -->
<div class="footer-col">
  <img src="${pageContext.request.contextPath}/img/logoblack.png" alt="EcoBarn Logo" class="footer-logo" />
  <p class="about-text">
    <strong>EcoBarn</strong> is your one-stop shop for fresh, organic, and eco-friendly groceries delivered to your doorstep.
  </p>
  <div style="font-size:15px;">
    <a href="https://www.facebook.com"><i class="fab fa-facebook-f"></i></a>
    <a href="https://www.instagram.com"><i class="fab fa-instagram"></i></a>
    <a href="https://twitter.com"><i class="fab fa-twitter"></i></a>
  </div>
</div>

    <!-- Quick Links -->
    <div class="footer-col">
      <h4>Quick Links</h4>
      <ul>
        <li><a href="account.jsp">My Account</a></li>
        <li><a href="trackOrder.jsp">Track Order</a></li>
        <li><a href="cart.jsp">Cart</a></li>
        <li><a href="checkout.jsp">Buy Now</a></li>
      </ul>
    </div>

    <!-- Info -->
    <div class="footer-col">
      <h4>Info</h4>
      <ul>
        <li><a href="Terms.jsp">Terms & Conditions</a></li>
        <li><a href="privacy.jsp">Privacy Policy</a></li>
        <li><a href="faq.jsp">FAQs</a></li>
        <li><a href="blog.jsp">Blog</a></li>
      </ul>
    </div>

    <!-- Explore -->
    <div class="footer-col">
      <h4>Explore</h4>
      <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="dailyDeals.jsp">Daily Deals</a></li>
        <li><a href="shop.jsp">Shop</a></li>
        <li><a href="contact.jsp">Contact Us</a></li>
      </ul>
    </div>

    <!-- Subscribe & Contact -->
    <div class="footer-subscribe-contact">
  <h4>Subscribe</h4>
  <form method="post" action="SubscribeServlet" class="newsletter-form">
    <input type="email" name="email" placeholder="Your email" required />
    <button type="submit">Subscribe</button>
  </form>
  
  <h4>Contact</h4>
  <p><i class="fas fa-phone-alt"></i> +94 70 612 5515</p>
  <p><i class="fas fa-envelope"></i> support@ecobarn.com</p>
  <p><i class="fas fa-map-marker-alt"></i> Malabe, Sri Lanka</p>
</div>

  </div>

  <div class="footer-bottom">
    <p style="font-size:12px;">&copy; 2025 EcoBarn. All rights reserved.</p>
  </div>
</footer>


    
    
</body>
</html>