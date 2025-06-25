<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <!-- IT23731714 PATHIRANA L.P.S.G. -->   

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eco-Barn | Help Page </title>
      <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    

    
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <!-- Custom Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/gstyle.css">
    
    
    <!-- All the styles for help.jsp -->
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap');

    body {
        font-family: 'Inter', sans-serif;
        background: linear-gradient(135deg, #e0f7fa, #f1f8e9);
        margin: 0;
        padding: 0;
        color: #333;
        overflow-x: hidden;
    }

    .page-wrapper {
        padding: 20px 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        background: url('img/bg-pattern.svg') repeat;
        backdrop-filter: blur(4px);
    }

    .container {
        display: flex;
        max-width: 1500px;
        width: 100%;
        background: rgba(255, 255, 255, 0.8);
        border-radius: 20px;
        overflow: hidden;
        box-shadow: 0 20px 60px rgba(0, 0, 0, 0.2);
        backdrop-filter: blur(12px);
        border: 1px solid rgba(255, 255, 255, 0.3);
        transition: transform 0.3s ease-in-out;
    }

   
    .banner-image {
        flex: 1;
        max-width: 100%;
    }

    .banner-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        display: block;
        border-right: 3px solid #c8e6c9;
    }

    .content {
        flex: 1;
        padding: 30px;
        background-color: rgba(255, 255, 255, 0.9);
        position: relative;
    }

    .page-title {
        color: #1b5e20;
        font-size: 30px;
        margin-bottom: 30px;
        text-align: center;
        font-weight: 700;
        animation: fadeIn 1s ease;
    }

    h2 {
        color: #2e7d32;
        font-size: 24px;
        margin-top: 40px;
        margin-bottom: 20px;
        border-bottom: 2px solid #a5d6a7;
        padding-bottom: 6px;
        font-weight: 600;
    }

    .self-service-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
        gap: 20px;
        margin-bottom: 40px;
    }

    .service-box {
        background: linear-gradient(to bottom right, #e8f5e9, #c8e6c9);
        padding: 25px;
        text-align: center;
        border-radius: 12px;
        color: #1b5e20;
        font-weight: bold;
        font-size: 16px;
        text-decoration: none;
        box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s, background 0.3s;
        position: relative;
        overflow: hidden;
    }

    .service-box::after {
        content: "";
        position: absolute;
        top: -50%;
        left: -50%;
        width: 200%;
        height: 200%;
        background: radial-gradient(circle at center, rgba(255,255,255,0.2), transparent 70%);
        transform: rotate(30deg);
        transition: opacity 0.4s;
        opacity: 0;
        z-index: 0;
    }

    .service-box:hover {
        background: #a5d6a7;
        transform: translateY(-6px);
    }

    .service-box:hover::after {
        opacity: 1;
    }

    .faq-section p {
        margin: 16px 0;
        padding: 16px 20px;
        background-color: #f9fbe7;
        border-left: 5px solid #aed581;
        border-radius: 8px;
        font-size: 15px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        transform: scale(1);
        transition: transform 0.3s, background-color 0.3s;
    }

    .faq-section p:hover {
        background-color: #f1f8e9;
        transform: scale(1.02);
    }

    .cta {
        display: inline-block;
        margin-top: 25px;
        padding: 14px 28px;
        background: linear-gradient(to right, #43a047, #2e7d32);
        color: white;
        border-radius: 50px;
        text-decoration: none;
        font-weight: bold;
        font-size: 16px;
        transition: all 0.3s ease;
        box-shadow: 0 6px 12px rgba(0,0,0,0.15);
    }

    .cta:hover {
        background: linear-gradient(to right, #388e3c, #1b5e20);
        transform: scale(1.05);
    }

    button {
        background: linear-gradient(to right, #66bb6a, #2e7d32);
        color: #fff;
        padding: 12px 24px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 15px;
        transition: background 0.3s, transform 0.2s;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    button:hover {
        background: linear-gradient(to right, #43a047, #1b5e20);
        transform: translateY(-2px);
    }

    #cases {
        margin-top: 20px;
        background-color: #f1f8e9;
        padding: 15px;
        border-radius: 8px;
        box-shadow: inset 0 1px 6px rgba(0,0,0,0.05);
    }

    @media (max-width: 768px) {
        .container {
            flex-direction: column;
        }

        .banner-image, .content {
            max-width: 100%;
        }

        .content {
            padding: 30px;
        }
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
    }
    .cta-row {
    display: flex;
    gap: 20px; /* spacing between links */
    justify-content: center; /* center horizontally */
    flex-wrap: wrap; /* allow wrapping on small screens */
    margin-top: 20px;
}

.cta {
    text-decoration: none;
    background-color: #28a745;
    color: white;
    padding: 10px 20px;
    border-radius: 6px;
    transition: background-color 0.3s;
}

.cta:hover {
    background-color: #218838;
}
    
</style>

    
    <script>
    function toggleCases() {
        var caseDiv = document.getElementById("cases");
        caseDiv.style.display = caseDiv.style.display === "none" ? "block" : "none";
    }	
    </script>
</head>

<body>
    
   <%
    request.setAttribute("currentPage", "help");
%>
<jsp:include page="header.jsp" />
    
<!--  help   -->
<div class="page-wrapper">
        <div class="container">
            <div class="banner-image">
                <img src="img/help.jpg" alt="Help Center Banner">
            </div>

            <div class="content">
                <h1 class="page-title">Welcome to Help Center</h1>
                
                <h2>Self Service</h2>
                <div class="self-service-grid">
                    <a href="trackOrder.jsp" class="service-box">Track My Order</a>
                    <a href="cancelOrder.jsp" class="service-box">Cancel My Order</a>
                    
                    <c:if test="${not empty username}">
                      <a href="userprofile.jsp" class="service-box">My Profile</a>

					
                    </c:if>
                </div>

                <h2>Top Questions</h2>
                <div class="faq-section">
                    <p><strong>What is the return policy duration?</strong><br>You can return items within 14 days of delivery for a full refund.</p>
                    <p><strong>Do I need an account to place an order?</strong><br>Yes, you must create an account or log in to place an order and track it.</p>
                    <p><strong>When will I receive my refund after a return?</strong><br>Refunds are processed within 5–7 business days after we receive the returned item.</p>
                    <p><strong>How can I change my delivery address?</strong><br>You can update your address from “My Profile” before placing a new order.</p>
                    <p><strong>What payment methods do you accept?</strong><br>We accept credit/debit cards, PayPal, and other secure payment gateways.</p>
                </div>

                <h2>Still Need Help?</h2>
               <div class="cta-row">
    <a href="faq.jsp" class="cta">FAQ Support →</a>
    <a href="contact.jsp" class="cta">Contact Customer Care →</a>
</div>

                
            </div>
        </div>
    </div>

<jsp:include page="footer.jsp"/>

    
    
</body>
</html>
