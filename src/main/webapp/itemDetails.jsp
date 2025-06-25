<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ecobarn.model.ItemDetails" %>
<%@ page import="java.util.*,com.ecobarn.model.User" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page session="true" %>
 <!-- IT23600584 Indievarie H. C -->   

<html>
<head>
    
    <meta charset="UTF-8">
    <title>Eco-Barn | Category Items </title>
      <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    
    <style>
        body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 0;
    padding: 0;
      background: url('img/doo.jpg') no-repeat center center fixed;
  background-size: cover;
         
}



.Contain
{

}
h2 {
    text-align: center;
    margin-top: 20px;
    color: black;
    font-size: 24px;
}

.items-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 24px;
    
    padding: 20px 20px;
}


.product-card {
    width: 250px;
    background-color: #ffffff;
    border-radius: 16px;
    box-shadow: 0 4px 14px rgba(0, 0, 0, 0.1);
    text-align: center;
    padding: 20px 16px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.product-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 8px 20px rgba(0, 128, 0, 0.15);
}

.product-card img {
    width: 100%;
    height: 170px;
    object-fit: cover;
    border-radius: 10px;
    margin-bottom: 16px;
}

.product-card h4 {
    font-size: 18px;
    color: #333;
    margin-bottom: 8px;
}

.price {
    color: #e91e63;
    font-size: 16px;
    font-weight: bold;
    margin-bottom: 6px;
}

.stock {
    color: #777;
    font-size: 14px;
    margin-bottom: 12px;
}

.add-to-cart-btn {
    background-color: #43a047;
    color: #fff;
    padding: 10px 16px;
    border-radius: 8px;
    font-size: 14px;
    text-decoration: none;
    margin-bottom: 8px;
    transition: background-color 0.3s ease;
    display: inline-block;
}

.add-to-cart-btn:hover {
    background-color: #2e7d32;
}

.add-to-cart-btn:last-child {
    background-color: #1976d2;
}

.add-to-cart-btn:last-child:hover {
    background-color: #0d47a1;
}

@media (max-width: 768px) {
    .product-card {
        width: 45%;
    }
}

@media (max-width: 480px) {
    .product-card {
        width: 90%;
    }
}
        
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>

<h2>Shop <%= request.getParameter("category") %></h2>


<section class="items-container">

    <%
        List<ItemDetails> items = (List<ItemDetails>) request.getAttribute("items");
        String categoryParam = request.getParameter("category");
        String userEmail = (String) session.getAttribute("userEmail");

        if (items != null && !items.isEmpty()) {
            for (ItemDetails item : items) {
                String addToCartLink;
                if (userEmail != null) {
                    addToCartLink = "CartServlet?action=add&name=" + URLEncoder.encode(item.getName(), "UTF-8")
                                  + "&category=" + URLEncoder.encode(categoryParam, "UTF-8");
                } else {
                    addToCartLink = "signin.jsp";
                }
    %>
        <div class="product-card">
     
            <img src="<%= item.getImage() %>" alt="<%= item.getName() %>">
            <h4><%= item.getName() %></h4>
            <p class="price">Rs. <%= item.getPrice() %></p>
            <p class="stock">Stock: <%= item.getStock() %></p>
            <a href="<%= addToCartLink %>" class="add-to-cart-btn">Add to cart</a>
            <a href="ProductDetailServlet?name=<%= URLEncoder.encode(item.getName(), "UTF-8") %>&category=<%= URLEncoder.encode(categoryParam, "UTF-8") %>"
   class="add-to-cart-btn" style="background-color: orange; margin-top: 6px;">View Product</a>
            
        </div>
    <%
            }
        } else {
    %>
        <p style="text-align: center;">No items available in this category.</p>
    <%
        }
    %>
</section>

<jsp:include page="footer.jsp"/>

</body>
</html>
