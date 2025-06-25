<%@ page contentType="text/html; charset=UTF-8" language="java" %>
 <!-- IT23722286 H. M. D. A. S. Gunasekara -->   

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eco-Barn | Reviews</title>
      <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    
    <link rel="stylesheet" href="css/myprofilereviews.css">
    
    <style>
    .main-content {
    max-width: 600px;
    margin: 30px auto;
    padding: 30px;
    background-color: #f9f9f9;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.main-content h2 {
    margin-bottom: 20px;
    color: #2c3e50;
    font-size:24px;
    text-align: center;
}

form label {
    display: block;
    margin-bottom: 5px;
    color: #34495e;
    font-weight: bold;
}

form input[type="text"],
form input[type="number"],
form input[type="file"],
form textarea {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 6px;
    box-sizing: border-box;
    font-size: 14px;
    background-color: #fff;
}

form textarea {
    height: 100px;
    resize: vertical;
}

form input[type="submit"] {
    background-color: #2ecc71;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

form input[type="submit"]:hover {
    background-color: #27ae60;
}
    </style>
</head>


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
           

    <h2>Submit a Review</h2>
    <form method="post" action="SubmitReviewServlet" enctype="multipart/form-data">
        <label>Name:</label><br>
        <input type="text" name="name" required><br><br>

        <label>Comment:</label><br>
        <textarea name="comment" required></textarea><br><br>

        <label>Rating (1-5):</label><br>
        <input type="number" name="rating" min="1" max="5" required><br><br>

        <label>Image:</label><br>
        <input type="file" name="image" accept="image/*"><br><br>

        <input type="submit" value="Submit Review">
    </form>
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
