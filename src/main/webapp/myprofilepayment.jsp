<%@ page contentType="text/html; charset=UTF-8" language="java" %>
 <!-- IT23722286 H. M. D. A. S. Gunasekara -->   

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eco-Barn | My Payments</title>
      <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    
    <link rel="stylesheet" href="css/myprofilepayment.css">
</head>
<body>

    <jsp:include page="header.jsp" />

    <div class="container">
        <!-- Sidebar (Left Block) -->
        <div class="sidebar">
            <div class="user-info">
                <%-- <img src="<%= request.getAttribute("userImage") %>" alt="User Image" class="user-image"> --%>
                <%--<p class="user-name"><%= request.getAttribute("userName") %></p> --%>
                
                
                <img src="img/profilepic.jpg" class="user-image" alt="profile">
                <p class="user-status">Verified Account</p>
            </div>
            <nav class="menu">
                <ul>
                    <li><a href="userprofile.jsp" class="menu-item">Manage My Account</a></li>
                    <li><a href="userProfileDetailsServlet" class="menu-item">My Profile</a></li>
                    <li><a href="myprofileorders.jsp" class="menu-item">My Orders</a></li>
                    <li><a href="ReadAddressServlet" class="menu-item">Address Book</a></li>
                    <li><a href="myprofilepayment.jsp" class="menu-item">Payment Methods</a></li>
                    <li><a href="myprofilereviews.jsp" class="menu-item">My Reviews</a></li>
                    <li><a href="signout.jsp" class="menu-item">Logout</a></li>
                </ul>
            </nav>
        </div>

        <!-- Main Content Area (Right Block) -->
        <div class="main-content">
     <h2>Payment Methods</h2>

    <h3>Credit Card</h3>

    <!-- Payment Method 1 -->
    <div class="payment-card">
        <div class="payment-info">
            <p><strong>John Newman</strong></p>
            <p>Visa ending in 1234</p>
            <p>Expiry Date: 12/24</p>
        </div>
        <div class="payment-actions">
            <button class="btn edit-btn" onclick="editPayment(1)">Edit</button>
            <button class="btn delete-btn" onclick="deletePayment(1)">Delete</button>
            <button class="btn default-btn" onclick="setDefaultPayment(1)">Set As Default</button>
        </div>
    </div>

    <!-- Payment Method 2 -->
    <div class="payment-card">
        <div class="payment-info">
            <p><strong>John Newman</strong></p>
            <p>Mastercard ending in 5678</p>
            <p>Expiry Date: 05/23</p>
        </div>
        <div class="payment-actions">
            <button class="btn edit-btn" onclick="editPayment(2)">Edit</button>
            <button class="btn delete-btn" onclick="deletePayment(2)">Delete</button>
            <button class="btn default-btn" onclick="setDefaultPayment(2)">Set As Default</button>
        </div>
    </div>

    <!-- Add Payment Method Button -->
    <div class="add-payment-container">
        <button class="btn add-btn" onclick="addPayment()">Add Payment Method</button>
    </div>
</div>
</div>

 <!-- Footer -->
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
