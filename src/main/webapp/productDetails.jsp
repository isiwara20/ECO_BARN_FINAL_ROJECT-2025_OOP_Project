<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ecobarn.model.ItemDetails" %>
 <!-- IT23600584 Indievarie H. C -->   

<%
    ItemDetails item = (ItemDetails) request.getAttribute("item");
    String userEmail = (String) session.getAttribute("userEmail");
%>
<html>
<head>
    <title>Eco-Barn | <%= item.getName() %> Details</title>
      <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    
    <style>
       <style>
    body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f8f9fa;
    }

    .product-details {
        max-width: 700px;
        margin: 50px auto;
        padding: 25px 30px;
        background-color: #ffffff;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        text-align: center;
    }

    .product-details h2 {
        color: #2e7d32;
        margin-bottom: 20px;
    }

    .product-details img {
        width: 300px;
        height: 250px;
        object-fit: contain;
        margin-bottom: 20px;
        border-radius: 8px;
        border: 1px solid #e0e0e0;
    }

    .product-details p {
        font-size: 16px;
        color: #555;
        margin: 8px 0;
    }

    .product-details strong {
        color: #ff9800;
    }

    .quantity-box {
        margin-top: 20px;
        font-size: 16px;
    }

    .quantity-box input[type="number"] {
        width: 60px;
        padding: 6px;
        font-size: 16px;
        margin-left: 10px;
        border-radius: 4px;
        border: 1px solid #ccc;
    }

    .btn {
        display: inline-block;
        margin-top: 25px;
        padding: 12px 28px;
        font-size: 16px;
        color: #fff;
        background: linear-gradient(45deg, #43a047, #2e7d32);
        border: none;
        border-radius: 6px;
        text-decoration: none;
        cursor: pointer;
        transition: background 0.3s ease;
    }

    .btn:hover {
        background: linear-gradient(45deg, #388e3c, #1b5e20);
    }

    @media (max-width: 768px) {
        .product-details {
            margin: 20px;
            padding: 20px;
        }

        .product-details img {
            width: 100%;
            height: auto;
        }
    }

       
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="product-details">
    <h2><%= item.getName() %></h2>
    <img src="<%= item.getImage() %>" alt="<%= item.getName() %>">
    <p><strong>Description:</strong> <%= item.getDescription() %></p>
    <p><strong>Price:</strong> Rs. <%= item.getPrice() %></p>
    <p><strong>Stock:</strong> <%= item.getStock() %></p>

    <form action="<%= (userEmail != null) ? "CartServlet" : "signin.jsp" %>" method="get">
        <% if (userEmail != null) { %>
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="name" value="<%= item.getName() %>">
            <input type="hidden" name="category" value="<%= request.getParameter("category") %>">
        <% } %>
        <div class="quantity-box">
            Quantity:
            <input type="number" name="quantity" value="1" min="1" max="<%= item.getStock() %>">
        </div>
        <button type="submit" class="btn">Buy Now</button>
    </form>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
