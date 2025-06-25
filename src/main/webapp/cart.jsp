<%@ page import="java.util.*,com.ecobarn.model.ItemDetails" %>
<%@ page import="com.ecobarn.DAO.CartDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>

 <!-- IT23600584 Indievarie H. C -->   

<%
    String userEmail = (String) session.getAttribute("userEmail");
    List<ItemDetails> cart = CartDAO.getCartByUser(userEmail);
%>
<html>
<head>
    <title>Eco-Barn | My Cart</title>
          <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    
    <style>
        body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 0;
    padding: 0;
    
     background: url('img/top-view-fruits-line.jpg') no-repeat center center fixed;
    background-size: cover;
}


h2 {
    text-align: center;
    margin: 30px 0;
    color: #2e7d32;
    font-size: 24px;
}

.cart-item {
    display: flex;
    align-items: center;
    padding: 16px;
    margin: 12px auto;
    max-width: 800px;
    background-color: #ffffff;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0, 128, 0, 0.08);
    transition: box-shadow 0.3s ease;
}

.cart-item:hover {
    box-shadow: 0 6px 16px rgba(0, 128, 0, 0.15);
}

.cart-item img {
    height: 90px;
    width: 90px;
    border-radius: 10px;
    object-fit: cover;
    margin-right: 20px;
    border: 1px solid #e0e0e0;
}

.cart-item strong {
    font-size: 18px;
    color: #333;
}

.price {
    display: inline-block;
    color: #ff6f00;
    font-weight: bold;
    font-size: 16px;
    margin-top: 4px;
}

.actions {
    margin-top: 8px;
}

.actions input.qty {
    width: 40px;
    text-align: center;
    padding: 6px;
    border: 1px solid #ccc;
    border-radius: 6px;
    margin: 0 6px;
    background-color: #f1f1f1;
    font-size: 14px;
}

.actions button {
    padding: 6px 12px;
    background-color: #4caf50;
    color: white;
    border: none;
    border-radius: 6px;
    font-weight: bold;
    cursor: pointer;
    font-size: 14px;
}

.actions button:hover {
    background-color: #388e3c;
}

.cart-item form button[type="submit"] {
    background-color: transparent;
    border: none;
    font-size: 18px;
    margin-left: 12px;
    cursor: pointer;
    color: #e53935;
}

.cart-item form button[type="submit"]:hover {
    color: #b71c1c;
}

.total-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 800px;
    margin: 30px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
}

.total {
    font-size: 20px;
    font-weight: bold;
    color: #ff6f00;
}

.pay-button {
    background-color: #28a745;
    color: white;
    padding: 12px 24px;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.pay-button:hover {
    background-color: #218838;
}

       
    </style>
    <script>
        function updateTotal() {
            let total = 0;
            document.querySelectorAll('.cart-item').forEach(item => {
                if (item.querySelector("input[name='selectItem']").checked) {
                    const price = parseFloat(item.querySelector(".price").innerText.replace("Rs. ", ""));
                    const qty = parseInt(item.querySelector(".qty").value);
                    total += price * qty;
                }
            });
            document.getElementById("totalAmount").innerText = "Total: Rs. " + total.toFixed(2);
            document.getElementById("totalAmountInput").value = total.toFixed(2);
        }

        function changeQty(btn, increase, itemName) {
            const input = btn.parentNode.querySelector(".qty");
            let value = parseInt(input.value);
            if (increase) value++;
            else if (value > 1) value--;
            input.value = value;
            updateTotal();

            // 🔄 Persist change in quantity using a hidden form
            const form = document.createElement("form");
            form.method = "post";
            form.action = "CartQuantityServlet";
            form.style.display = "none";

            const nameInput = document.createElement("input");
            nameInput.name = "name";
            nameInput.value = itemName;
            form.appendChild(nameInput);

            const qtyInput = document.createElement("input");
            qtyInput.name = "quantity";
            qtyInput.value = value;
            form.appendChild(qtyInput);

            document.body.appendChild(form);
            form.submit();
        }
    </script>
</head>

<jsp:include page="header.jsp"/>

<body onload="updateTotal()">

<h2>Shopping Cart</h2>

<% if (session.getAttribute("msg") != null) { %>
    <div style="text-align:center; color: red; font-weight: bold;">
        <%= session.getAttribute("msg") %>
    </div>
    <%
        session.removeAttribute("msg");
    %>
<% } %>


<% for (ItemDetails item : cart) { %>
<div class="cart-item">
    <input type="checkbox" name="selectItem" onclick="updateTotal()" checked>&ensp;&ensp;
    <img src="<%= item.getImage() %>" alt="<%= item.getName() %>">
    <div style="flex: 1">
        <strong><%= item.getName() %></strong><br>
        <span class="price">Rs. <%= item.getPrice() %></span><br>
        <div class="actions">
            <button onclick="changeQty(this, false, '<%= item.getName() %>')">-</button>
            <input type="text" class="qty" value="<%= item.getQuantity() %>" readonly>
            <button onclick="changeQty(this, true, '<%= item.getName() %>')">+</button>
        </div>
    </div>
    <form method="get" action="CartServlet">
        <input type="hidden" name="action" value="remove">
        <input type="hidden" name="name" value="<%= item.getName() %>">
        <button type="submit" title="Remove">🗑</button>
    </form>
</div>
<% } %>

<div class="total-row">
  <div class="total" id="totalAmount">Total: Rs. 0.00</div>
  
  <form action="displayShippingAlreadyServlet" method="post">
  <input type="hidden" name="amount" id="totalAmountInput" value="">    
  <button type="submit" class="pay-button">Proceed to Pay</button>
  </form>
</div>
<jsp:include page="footer.jsp"/>

</body>
</html>