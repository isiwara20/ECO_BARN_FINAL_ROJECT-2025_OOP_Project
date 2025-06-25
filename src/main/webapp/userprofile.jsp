<%@ page contentType="text/html; charset=UTF-8" language="java" %>
 <!-- IT23722286 H. M. D. A. S. Gunasekara -->   

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eco-Barn | User Dashboard</title>
    <link rel="stylesheet" href="css/userprofile.css">
      <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    
    
   
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
                    <li><a href="signout.jsp"   class="menu-item">Logout</a></li>
                </ul>
            </nav>
        </div>

     <div class="main-content">
    <h2 style="font-size:25px;">My Account</h2>
    <div class="content-grid">
        <!-- Personal Profile Block -->
        <div class="content-box">
            <h3>👤 Personal Profile</h3>
            <p>View and update your personal details.</p>
            <a href="userProfileDetailsServlet" class="btn">Edit</a>
        </div>

        <!-- Address Book Block -->
        <div class="content-box">
            <h3>🏠 Address Book</h3>
            <p>Manage your shipping and billing addresses.</p>
            <a href="address.jsp" class="btn">Edit</a>
        </div>

        <!-- Recent Orders Block -->
        <div class="content-box">
            <h3>📦 Recent Orders</h3>
            <p>View your recent order history.</p>
            <a href="myprofileorders.jsp" class="btn">Check</a>
        </div>


        <!-- Payment Methods Block -->
        <div class="content-box">
            <h3>💳 Payment Methods</h3>
            <p>Manage your payment methods and billing information.</p>
            <a href="myprofilepayment.jsp" class="btn">Check</a>
        </div>

        <!-- Past Reviews Block -->
        <div class="content-box">
            <h3>📝 Add Reviews</h3>
            <p>Add new product reviews.</p>
            <a href="myprofilereviews.jsp" class="btn">Add</a>
        </div>
    </div>
</div>
</div>
    <jsp:include page="footer.jsp"/>
    


    
</body>
</html>


