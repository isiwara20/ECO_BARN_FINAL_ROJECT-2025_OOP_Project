<%@ page import="java.util.*, java.net.URLEncoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ecobarn.model.ItemDetails" %>

 <!-- IT23600584 Indievarie H. C -->   

<%

    Map<String, List<ItemDetails>> allItems = (Map<String, List<ItemDetails>>) request.getAttribute("allItems");
    String userEmail = (String) session.getAttribute("userEmail");
%>

<html>
<head>
    <title>Eco-Barn | All Products</title>
      <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    
  <style>
    body {
        font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f7f3;
        color: #2f3e2f;
    }

    .category-title {
        font-size: 26px;
        margin: 40px 20px 16px;
        color: #2e4e2e;
        font-weight: 600;
        border-left: 6px solid #7bbf44;
        padding-left: 14px;
        background-color: #e9f5e7;
        padding-top: 8px;
        padding-bottom: 8px;
        border-radius: 4px;
    }

    .product-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
        gap: 24px;
        padding: 0 20px 40px;
    }

    .product-card {
        background-color: #ffffff;
        border: 1px solid #dfe7dc;
        border-radius: 10px;
        padding: 16px;
        text-align: center;
        box-shadow: none;
    }

    .product-card img {
        max-width: 100%;
        height: 160px;
        object-fit: cover;
        margin-bottom: 12px;
        border-radius: 6px;
    }

    .product-card h4 {
        font-size: 17px;
        color: #2f3e2f;
        margin: 8px 0 4px;
    }

    .product-card .price {
        color: #5a8a3d;
        font-size: 16px;
        font-weight: bold;
        margin: 4px 0;
    }

    .product-card .stock {
        font-size: 13px;
        color: #6b7c6b;
        margin-bottom: 10px;
    }

    .add-to-cart-btn {
        display: inline-block;
        margin: 4px 5px;
        padding: 8px 14px;
        border-radius: 6px;
        font-size: 14px;
        color: #ffffff;
        background-color: #6cbf40;
        text-decoration: none;
        border: none;
    }

    .add-to-cart-btn:hover {
        background-color: #5aa236;
    }

    .add-to-cart-btn.orange {
        background-color: #e19d2c;
    }

    .add-to-cart-btn.orange:hover {
        background-color: #c87f15;
    }

    @media (max-width: 600px) {
        .category-title {
            font-size: 20px;
        }

        .product-card {
            padding: 12px;
        }
    }
</style>


</head>
<body>

<%
    request.setAttribute("currentPage", "shop");
%>
<jsp:include page="header.jsp" />


<%
    for (Map.Entry<String, List<ItemDetails>> entry : allItems.entrySet()) {
        String categoryName = entry.getKey();
        List<ItemDetails> items = entry.getValue();
%>
    <div class="category-title"><%= categoryName %></div>
    <div class="product-grid">
<%
        if (items != null && !items.isEmpty()) {
            for (ItemDetails item : items) {
                String addToCartLink;
                if (userEmail != null) {
                    addToCartLink = "CartServlet?action=add&name=" + URLEncoder.encode(item.getName(), "UTF-8")
                                  + "&category=" + URLEncoder.encode(categoryName, "UTF-8");
                } else {
                    addToCartLink = "signin.jsp";
                }
%>
        <div class="product-card">
            <img src="<%= item.getImage() %>" alt="<%= item.getName() %>" width="150" height="150">
            <h4><%= item.getName() %></h4>
            <p class="price">Rs. <%= item.getPrice() %></p>
            <p class="stock">Stock: <%= item.getStock() %></p>
            <a href="<%= addToCartLink %>" class="add-to-cart-btn">Add to cart</a>
           
        </div>
<%
            }
        } else {
%>
        <p>No items available in this category.</p>
<%
        }
%>
    </div>
<%
    }
%>
<jsp:include page="footer.jsp"/>

</body>
</html>
