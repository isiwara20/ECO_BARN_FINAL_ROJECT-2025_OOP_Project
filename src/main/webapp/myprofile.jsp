<%@ page contentType="text/html; charset=UTF-8" language="java" %>
 <!-- IT23722286 H. M. D. A. S. Gunasekara -->   

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eco-Barn | My Profile</title>
      <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    
    <link rel="stylesheet" href="css/myprofilepayment.css">
    <style>
    .main-content {
    max-width: 600px;
    margin: 30px auto;
    padding: 30px;
    background-color: #fefefe;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.main-content h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #2c3e50;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    font-weight: 600;
    color: #34495e;
    margin-bottom: 6px;
}

.form-group input[type="text"],
.form-group input[type="email"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 6px;
    background-color: #f1f1f1;
    font-size: 14px;
    color: #555;
    box-sizing: border-box;
}

.form-group input[readonly] {
    background-color: #eaeaea;
    color: #888;
    cursor: not-allowed;
}

.submit-btn {
    background-color: #3498db;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 6px;
    font-size: 15px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.submit-btn:hover {
    background-color: #2980b9;
}
    </style>
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

        <%@ page import="com.ecobarn.model.User" %>
<%
    User user = (User) request.getAttribute("userprofile");
    if (user == null) {
%>
        <p style="color:red;">User profile not found. Please log in again.</p>
<%
    } else {
%>
        <div class="main-content">
    <h2>My Personal Details</h2>
<form method="POST" action="">
    <!-- Name, Email, Phone (readonly) -->
    
    
    <div class="form-group">
        <label for="userName">UserName:</label>
        <input type="text" id="userName" name="userName" value="<%= user.getUsername() %>" readonly>
    </div>
    
    <div class="form-group">
        <label for="userName">Name:</label>
        <input type="text" id="Name" name="Name" value="<%= user.getFname() %>" readonly>
    </div>

    <div class="form-group">
        <label for="phone">Phone Number:</label>
        <input type="text" id="phone" name="phone" value="<%= user.getPhone() %>" readonly>
    </div>

  
    <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= user.getEmail() %>" readonly>
    </div>

    

    
</form>



<%
    String updateSuccess = request.getParameter("updateSuccess");
    if ("true".equals(updateSuccess)) {
        out.println("<p style='color: green;'>Profile updated successfully!</p>");
    } else if ("false".equals(updateSuccess)) {
        out.println("<p style='color: red;'>Profile update failed. Please try again.</p>");
    }
%>

</div>
<% 
    }
%>


    
</div>

    <jsp:include page="footer.jsp"/>

</body>
</html>

