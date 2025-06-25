<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ecobarn.model.trackorderModel" %>
 <!-- IT23731714 PATHIRANA L.P.S.G. -->   

<!DOCTYPE html>
<html>
<head>
    <title>Eco-Barn | Track Order Result</title>
      <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    
    <style>
       body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background: linear-gradient(135deg, #eef5ec, #c8e6c9);
        }

        main {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.12);
            width: 100%;
            max-width: 600px;
            text-align: center;
            backdrop-filter: blur(12px);
            animation: fadeInUp 0.6s ease-out;
            border: 1px solid rgba(0, 0, 0, 0.08);
        }

        h2 {
            font-size: 25px;
            color: #2e7d32;
            margin-bottom: 25px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        p {
            font-size: 18px;
            margin: 15px 0;
            color: #333;
            line-height: 1.6;
        }

        strong {
            color: #1b5e20;
            font-weight: 600;
        }

        .order {
            display: inline-block;
            text-decoration: none;
            background-color: #2e7d32;
            color: white;
            padding: 14px 30px;
            border-radius: 8px;
            font-size: 16px;
            margin-top: 10px;
            transition: all 0.3s ease;
        }

        .order:hover {
            background-color: #1b5e20;
            transform: translateY(-2px) scale(1.02);
        }

        .error {
            color: #fff;
            background-color: #e53935;
            border: 1px solid #c62828;
            padding: 14px;
            border-radius: 6px;
            margin-top: 20px;
            font-size: 17px;
            font-weight: 500;
            text-align: center;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 768px) {
            .container {
                padding: 30px 20px;
            }

            h2 {
                font-size: 24px;
            }

            p {
                font-size: 16px;
            }

            .order {
                padding: 12px 20px;
                font-size: 15px;
            }
        }
    </style>
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<main style="flex: 1; display: flex; align-items: center; justify-content: center;">

    <div class="container">
        <h2>Order Status</h2>
        <%
            trackorderModel order = (trackorderModel) request.getAttribute("order");
            if (order != null) {
        %>
            <p><strong>Order ID:</strong> <%= order.getOrderId() %></p>
            <p><strong>Email:</strong> <%= order.getEmail() %></p>
            <p><strong>Status:</strong> <%= order.getStatus() %></p>
        <%
            } else {
        %>
            <p class="error">Order not found. Please check your details.</p>
        <%
            }
        %>
        <a class="order" href="trackOrder.jsp">Back</a>
    </div>
     </main>
    
    <%@ include file="footer.jsp" %>
</body>
</html>
