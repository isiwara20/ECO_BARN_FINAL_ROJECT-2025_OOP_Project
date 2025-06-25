<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <!-- IT23600652 Isiwara Wijesinghe -->   
  

<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    String orderID = (String) request.getAttribute("orderID");
    String orderStatus = (String) request.getAttribute("orderStatus");
    String email = (String) request.getAttribute("email");

    
    Calendar calendar = Calendar.getInstance();
    calendar.add(Calendar.DATE, 5);
    Date deliveryDate = calendar.getTime();
    SimpleDateFormat sdf = new SimpleDateFormat("MMMM dd, yyyy");
    String estimatedDelivery = sdf.format(deliveryDate);
%>
    
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eco-Barn | </title>
  <link rel="icon" type="image/x-icon" href="img/logoblack.png">

    
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style type="text/css">
    
  

 

      .container {
            background-color: white;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1),
                        0 8px 10px -6px rgba(0, 0, 0, 0.1);
            border-radius: 1.5rem;
            padding: 2.5rem;
            max-width: 40rem;
            width: 100%;
            text-align: center;
            align-content:center;
            margin-top:20px;
            margin-bottom:20px;
            animation: fadeIn 0.7s ease-in-out both;
            display:block;
            margin-left:auto;
            margin-right:auto;
        }

    


.tick-icon {
    width: 80px;
    height: 80px;
    margin: 0 auto 0.2rem;
}

.tick-circle {
    fill: none;
    stroke: #22c55e;
    stroke-width: 2;
    stroke-miterlimit: 10;
    stroke-dasharray: 290;
    stroke-dashoffset: 290;
    animation: drawCircle 0.6s ease-out forwards;
}

.tick-mark {
    fill: none;
    stroke: #22c55e;
    stroke-width: 3;
    stroke-linecap: round;
    stroke-linejoin: round;
    stroke-dasharray: 90;
    stroke-dashoffset: 90;
    animation: drawCheck 0.7s 0.6s ease-out forwards;
}

@keyframes drawCircle {
    to {
        stroke-dashoffset: 0;
    }
}

@keyframes drawCheck {
    to {
        stroke-dashoffset: 0;
    }
}


      
        h2 {
            font-size: 1.175rem;
            font-weight: 800;
            color: #1f2937;
            margin-top: 0.5rem;
        }

        .text-gray {
            margin-top: 0.5rem;
            color: #4b5563;
        }

        .order-details {
            background-color: #f9fafb;
            padding: 1.25rem;
            border-radius: 0.75rem;
            text-align: left;
            margin-bottom: 1.5rem;
        }

        .order-details p {
            font-size: 1.125rem;
            margin-bottom: 0.5rem;
        }

        .label {
            font-weight: 600;
            color: #374151;
            font-size:0.975rem;
        }

        .value-indigo {
            color: #4f46e5;
                        font-size:0.975rem;
            
        }

        .value-green {
            color: #16a34a;
                        font-size:0.975rem;
            
        }

        .value-blue {
            color: #2563eb;
                        font-size:0.975rem;
            
        }

        .track-button {
            display: inline-block;
            background-color: #4f46e5;
            color: white;
            font-weight: 600;
            padding: 0.75rem 1.5rem;
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
            text-decoration: none;
        }

        .track-button:hover {
            background-color: #4338ca;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
     </style>
    
     

<body>

<jsp:include page="header.jsp" />





  <div class="container">
        <!-- Animated Tick Icon -->
        <svg class="tick-icon" viewBox="0 0 100 100">
            <circle class="tick-circle" cx="50" cy="50" r="40"/>
            <polyline class="tick-mark" points="30,55 45,70 70,40"/>
        </svg>

        <h2 >Payment Successful</h2>
        <p class="text-gray">Thank you for your order. Your transaction was completed successfully.</p>

        <div class="order-details">
            <p><span class="label">Order ID:</span> <span class="value-indigo"><%= orderID %></span></p>
            <p><span class="label">Status:</span> <span class="value-green"><%= orderStatus %></span></p>
            <p><span class="label">Estimated Delivery:</span> <span class="value-blue"><%= deliveryDate %></span></p>
        </div>

        <a href="trackOrder.jsp?orderID=<%= orderID %>" class="track-button">Track Your Order</a>
    </div>



<jsp:include page="footer.jsp"/>

    
    
</body>
</html>
    

    