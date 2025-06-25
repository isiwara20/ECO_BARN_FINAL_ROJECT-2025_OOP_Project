<%@ page import="java.util.*, com.ecobarn.model.DealModel, com.ecobarn.DAO.DealDAO" %>
 <!-- IT23731714 PATHIRANA L.P.S.G. -->   

<!DOCTYPE html>
<html>
<head>

    <title>Eco-Barn | Daily Deals</title>
      <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(to right, #f4fdf4, #ffffff);
    }

    h2 {
        text-align: center;
        color: #2e7d32;
        font-size: 24px;
        margin-top: 40px;
        margin-bottom: 10px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    .deal-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 30px;
        padding: 40px 20px;
    }

    .deal-card {
        background: #ffffff;
        width: 270px;
        border-radius: 14px;
        overflow: hidden;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        display: flex;
        flex-direction: column;
        text-decoration: none;
        color: #333;
    }

    
    .deal-card img {
        
        object-fit: cover;
        transition: transform 0.3s ease;
    }

    .deal-card:hover img {
        transform: scale(1.05);
    }

    .info {
        padding: 15px 20px 20px;
        flex-grow: 1;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    .info h3 {
        font-size: 18px;
        color: #2e7d32;
        margin-bottom: 8px;
        font-weight: 600;
    }

    .info p {
        font-size: 14px;
        color: #555;
        margin-bottom: 6px;
    }

    .price {
        font-size: 14px;
        color: #c62828;
        font-weight: bold;
    }

    .final-price {
        font-size: 16px;
        color: #1b5e20;
        font-weight: bold;
        margin-top: 5px;
    }

    .discount-badge {
        background-color: #ef5350;
        color: white;
        display: inline-block;
        font-size: 12px;
        font-weight: 600;
        padding: 4px 10px;
        border-radius: 20px;
        margin-top: 6px;
    }

    .add-to-cart {
        margin-top: 15px;
        background-color: #43a047;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 6px;
        font-size: 14px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        text-align: center;
        text-decoration: none;
    }

    .add-to-cart:hover {
        background-color: #2e7d32;
    }

    @media (max-width: 768px) {
        .deal-card {
            width: 90%;
        }

        h2 {
            font-size: 28px;
        }
    }
</style>


</head>
<body>
<%
    request.setAttribute("currentPage", "deals");
%>
<jsp:include page="header.jsp" />


    <h2>Today's Deals</h2>
    <div class="deal-container">
        <%
            List<DealModel> deals = (List<DealModel>) request.getAttribute("dealList");
            if (deals != null && !deals.isEmpty()) {
                for (DealModel d : deals) {
        %>
            <div class="deal-card">
                <img src="<%= d.getImageUrl() %>" alt="Deal Image">
                <div class="info">
                    <h3><%= d.getTitle() %></h3>
                    <p><%= d.getDescription() %></p>
                    <p class="price">Price: LKR<%= String.format("%.2f", d.getPrice()) %></p>
                    <p class="price">Discount: <%= d.getDiscount() %>%</p>
                    <p class="final-price">Final: LKR <%= String.format("%.2f", d.getFinalPrice()) %></p>
                </div>
            </div>
        </a>
        <%
                }
            } else {
        %>
        <p>No deals available at the moment.</p>
        <% } %>
    </div>
    <jsp:include page="footer.jsp"/>
    
</body>
</html>