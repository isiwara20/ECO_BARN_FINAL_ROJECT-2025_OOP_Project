<%@ page contentType="text/html; charset=UTF-8" language="java" %>
 <!-- IT23722286 H. M. D. A. S. Gunasekara -->   

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eco-Barn | My Orders</title>
      <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    
    <link rel="stylesheet" href="css/myprofileorders.css">
</head>
<body>
<!-- Header Start -->
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
           <h2>My Orders</h2>

    <table class="orders-table">
        <thead>
            <tr>
                <th>Order Number</th>
                <th>Placed On</th>
                <th>Items</th>
                <th>Total</th>
                <th>Details</th>
            </tr>
        </thead>
        <tbody>
            <!-- Example order data, dynamically rendered -->
            <tr>
                <td>219540217483698</td>
                <td>14/04/2025</td>
                <td>Item 1, Item 2</td>
                <td>Rs. 1,372</td>
                <td><button class="details-btn" onclick="showOrderDetails(219540217483698)">View Details</button></td>
            </tr>
            <tr>
                <td>217497706883698</td>
                <td>29/11/2024</td>
                <td>Item 3, Item 4</td>
                <td>Rs. 2,825</td>
                <td><button class="details-btn" onclick="showOrderDetails(217497706883698)">View Details</button></td>
            </tr>
            <!-- Add more rows here based on dynamic data from backend -->
        </tbody>
    </table>
    </div>
    </div>
    
     <jsp:include page="footer.jsp"/>
 
</body>
</html>
