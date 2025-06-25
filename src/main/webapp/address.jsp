<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
     <!-- IT23722286 H. M. D. A. S. Gunasekara -->   
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eco-Barn | My Address</title>
      <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    
    <link rel="stylesheet" href="css/addressstyles.css">
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
                    <li><a href="logout.jsp" class="menu-item">Logout</a></li>
                </ul>
            </nav>
        </div>

        <div class="main-content">
     <h2>Addresses</h2>
    <h3>Shipping Address</h3>
    
    <%-- address.jsp --%>
<%-- Add Address Form --%>
<form action="addressServlet" method="POST" class="form">
    <input type="text" name="address" placeholder="Enter Address" required>
    <input type="text" name="city" placeholder="Enter City" required>
    <input type="text" name="country" placeholder="Enter Country" required>
    <button name="action" value="insert" type="submit">Add Address</button>
</form>

<%@ page import="java.util.List" %>
<%@ page import="com.ecobarn.model.Address" %>

<%-- Display Addresses --%>
<table border="1" class="table">
    <thead>
        <tr>
            <th>Address ID</th>
            <th>Address</th>
            <th>City</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <% 
            List<Address> addresses = (List<Address>) request.getAttribute("addresses");
            if (addresses != null && !addresses.isEmpty()) {
                for (Address address : addresses) {
                    String addressId = String.valueOf(address.getAddressId());
                    String addressValue = address.getAddress();
                    String cityValue = address.getCity();
                    String countryValue = address.getCountry();
        %>
        <tr id="row_<%= addressId %>">
            <td><%= address.getAddressId() %></td>
            <td id="address_td_<%= addressId %>"><%= address.getAddress() %></td>
            <td id="city_td_<%= addressId %>"><%= address.getCity() %></td>
            <td id="country_td_<%= addressId %>"><%= address.getCountry() %></td>
            <td>
                <!-- Update button to trigger editing -->
                <button class="update_btn" onclick="editRow('<%= addressId %>')">Update</button>
                <!-- Delete button remains in the original row -->
                <a href="addressServlet?action=delete&address_id=<%= address.getAddressId() %>">
                    <button class="delete_btn">Delete</button>
                </a>
                <!-- Done button will save the data after update -->
                <button class="done_btn" id="done_btn_<%= addressId %>" style="display: none;" onclick="saveRow('<%= addressId %>')">Done</button>
            </td>
        </tr>

        <tr id="edit_row_<%= addressId %>" style="display: none;">
            <td><%= address.getAddressId() %></td>
            <td><input type="text" id="edit_address_<%= addressId %>" value="<%= address.getAddress() %>"></td>
            <td><input type="text" id="edit_city_<%= addressId %>" value="<%= address.getCity() %>"></td>
            <td><input type="text" id="edit_country_<%= addressId %>" value="<%= address.getCountry() %>"></td>
            <td><button class="done_btn" onclick="saveRow('<%= addressId %>')">Done</button></td>
        </tr>
        <% 
                }
            } else {
        %>
        <tr><td colspan="5">No addresses available</td></tr>
        <% } %>
    </tbody>
</table>
</div>
</div>
       <jsp:include page="footer.jsp"/>

<script>
    function editRow(addressId) {
        // Hide the original row and show the edit row
        document.getElementById("row_" + addressId).style.display = "none";
        document.getElementById("edit_row_" + addressId).style.display = "table-row";
        document.getElementById("done_btn_" + addressId).style.display = "inline-block";
    }

    function saveRow(addressId) {
        var updatedAddress = document.getElementById("edit_address_" + addressId).value;
        var updatedCity = document.getElementById("edit_city_" + addressId).value;
        var updatedCountry = document.getElementById("edit_country_" + addressId).value;

        // Send the updated data to the server for saving
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "addressServlet?action=update", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Update the table with the new values
                document.getElementById("address_td_" + addressId).innerHTML = updatedAddress;
                document.getElementById("city_td_" + addressId).innerHTML = updatedCity;
                document.getElementById("country_td_" + addressId).innerHTML = updatedCountry;

                // Hide the edit row and show the original row
                document.getElementById("edit_row_" + addressId).style.display = "none";
                document.getElementById("row_" + addressId).style.display = "table-row";
                document.getElementById("done_btn_" + addressId).style.display = "none";
            }
        };
        xhr.send("address_id=" + addressId + "&address=" + updatedAddress + "&city=" + updatedCity + "&country=" + updatedCountry);
    }
</script>
   
   
</body>
</html>