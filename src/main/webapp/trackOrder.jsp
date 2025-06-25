<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- IT23731714 PATHIRANA L.P.S.G. -->   


<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eco-Barn | Track Order</title>
      <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    
 
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    
    <!-- All the styles for trackOrder.jsp -->
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            justify-content: center;
            align-items: center;
background: url('img/trackorder.jpg') center center no-repeat;
		    background-size: cover;   
		    
		         }
		         
		         
		         
.background-container {
    width: 100%;
    max-width: 900px;
    margin: 40px auto;
    height: auto;
    padding: 60px;
    border-radius: 15px;
    display: flex;
    justify-content: center;
    align-items: center;
 background-color: rgba(255, 255, 255, 0.2);    
 box-shadow: 0 6px 25px rgba(0, 0, 0, 0.25);
    position: relative;
    overflow: hidden;
}



        /* Stylish border with gradient effect */
        .background-container:before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, rgba(34, 139, 34, 0.7), rgba(0, 128, 0, 0.7)); /* Earthy gradient border */
            z-index: -4;
            border-radius: 15px;
            padding: 10px;
        }

        .track  {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px 40px;
            border-radius: 12px;
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2); /* Smooth shadow for depth */
        }

       

        h1 {
            text-align: center;
            color: #3e7d5f; /* Subtle earthy green */
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .in {
            width: 100%;
            padding: 14px;
            margin: 12px 0;
            border: 1px solid #b7d6b3; /* Soft green border */
            border-radius: 30px; /* Rounded inputs */
            font-size: 16px;
        }

        .in:focus,
         {
            border-color: #3e7d5f; /* Focus effect with green */
            box-shadow: 0 0 10px rgba(46, 125, 50, 0.6); /* Soft green glow */
        }

        button {
            background-color: #3e7d5f; /* Soft green button */
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 30px; /* Rounded button */
            font-size: 16px;
            margin-top: 15px;
            cursor: pointer;
        }

        button:hover {
            background-color: #2e5d44; /* Darker green */
            transform: scale(1.05); /* Button grows slightly on hover */
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15); /* Hover shadow */
        }

        .error {
            color: white;
            background-color: #ff6f61; /* Soft red for error */
            border: 1px solid #f44336;
            padding: 12px;
            border-radius: 5px;
            margin-top: 20px;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .background-container {
                padding: 80px 40px;
            }

            .track {
                padding: 20px 30px;
                max-width: 90%;
            }

            h1 {
                font-size: 24px;
            }

            input[type="email"],
            input[type="text"] {
                font-size: 14px;
            }

            button {
                font-size: 14px;
            }
        }
    </style>
    
    <script>
    
    </script>
</head>

<body>
<jsp:include page="header.jsp"/>

<!--  trackorder   -->
<div class="background-container">
        <form action="TrackOrderServlet" method="post" class="track">
            <h1>Track Your Order</h1>
            <input class="in" type="email" name="email" placeholder="Your Email" required /><br>
            <input class="in" type="text" name="orderId" placeholder="Order ID" required /><br>
            <button type="submit">Track</button>
        </form>
    </div>


    <jsp:include page="footer.jsp"/>
    
    
</body>
</html>