<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- IT23731714 PATHIRANA L.P.S.G. -->   

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eco-Barn | FAQ</title>
      <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    
  
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
   
    <!-- All the styles for faq.jsp -->
    <style>
        body {
		    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		    background: linear-gradient(to right, #e8f5e9, #ffffff);
		    margin: 0;
		    padding: 0;
		    color: #333;
		    min-height: 100vh;
		}


        .box {
            background-color: #ffffff;
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            max-width: 700px;
            width: 90%;
            transition: all 0.3s ease-in-out;
        }

        .box:hover {
            transform: scale(1.01);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
        }

        .list {
            list-style-type: none;
            padding: 0;
            margin-top: 30px;
            display: flex;
            gap: 20px;
            justify-content: center;
        }

        .link {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            padding: 12px 20px;
            background-color: #388e3c;
            border-radius: 6px;
            box-shadow: 0 4px 8px rgba(56, 142, 60, 0.3);
            transition: background-color 0.2s ease, transform 0.2s ease;
        }

        .link:hover {
            background-color: #2e7d32;
            transform: translateY(-2px);
        }

        .faq-question {
            margin: 20px 0 5px 0;
            font-weight: bold;
            font-size: 18px;
            color: #1b5e20;
            position: relative;
        }

        .faq-question::before {
            content: "Q:";
            position: absolute;
            left: -25px;
            font-weight: bold;
            color: #81c784;
        }

        .faq-answer {
            margin: 0 0 20px 0;
            padding-left: 15px;
            color: #555;
            border-left: 3px solid #c8e6c9;
            font-size: 16px;
        }

        .top-row {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 20px;
        }

        .title-text {
            flex: 1;
            padding-left: 20px;
        }

        .faq-icon {
            height: 400px;
            width: auto;
            flex-shrink: 0;
            border-radius: 20px;
            margin-left: 10px;
        }

        .content-section {
            background-color: #f1f8e9;
            padding: 25px;
            border-radius: 10px;
        }

        .fancy-title {
            font-size: 48px;
            color: #1b5e20;
            font-weight: 800;
            font-family: 'Georgia', serif;
            position: relative;
            display: inline-block;
            margin-bottom: 10px;
        }

        .fancy-title::after {
            content: '';
            position: absolute;
            width: 60%;
            height: 4px;
            background-color: #81c784;
            bottom: -5px;
            left: 0;
            border-radius: 2px;
        }

        .fancy-subtitle {
            font-size: 22px;
            color: #4e944f;
            font-style: italic;
            margin-top: 5px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .faq-wrapper {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    padding: 40px 0;
		}
    </style>
    
    <script>


    </script>
</head>

<body>
    <jsp:include page="header.jsp"/>
    

<!--  faq   -->
<div class="faq-wrapper">
<div class="box">
        <div class="top-row">
            <div class="title-text">
                <h2 class="fancy-title">Frequently Asked Questions</h2>
                <p class="fancy-subtitle">Welcome to the EcoBarn FAQ section!</p>
            </div>
            <img src="img/faq.png" alt="FAQ Icon" class="faq-icon">
        </div>

        <div class="content-section">
            <div class="faq-question">1. How do I reset my EcoBarn password?</div>
            <div class="faq-answer">Click "Forgot Password" on the login page and follow the instructions sent to your email.</div>

            <div class="faq-question">2. Can I track my order?</div>
            <div class="faq-answer">Yes, once your order is shipped, you’ll receive a tracking order ID via email.</div>

            <div class="faq-question">3. Do you offer same-day delivery?</div>
            <div class="faq-answer">Same-day delivery is available in select areas for orders placed before 12 PM. Check availability during checkout.</div>

            <div class="faq-question">4. Are your products organic?</div>
            <div class="faq-answer">Most of our produce is organic. You can check labels or use filters while browsing.</div>

            <div class="faq-question">5. Do you have a loyalty program?</div>
            <div class="faq-answer">Yes, EcoBarn EcoPoints rewards program lets you earn points on every order.</div>

            <div class="faq-question">6. Can I schedule a delivery time?</div>
            <div class="faq-answer">Yes, you can choose a preferred delivery time slot during checkout (subject to availability).</div>

            <div class="faq-question">7. Do you offer gift wrapping or messages?</div>
            <div class="faq-answer">Yes! You can add a gift message and request eco-friendly wrapping during the checkout process.</div>

            <div class="faq-question">8. Are there any membership benefits?</div>
            <div class="faq-answer">Yes! Our EcoClub members enjoy exclusive discounts, early access to deals, and free delivery on all orders.</div>

            <div class="faq-question">9. How do I update my phone number or email?</div>
            <div class="faq-answer">Go to “My Profile” and edit your contact information. Changes will take effect immediately.</div>

            <div class="faq-question">10. Do you have a mobile app?</div>
            <div class="faq-answer">Yes, the EcoBarn app is available for Android and iOS. You can shop, track orders, and manage your account easily on the go.</div>

            <ul class="list">
                <li><a class ="link" href="faqForm.jsp">Submit a New Question</a></li>
                <li><a class ="link"href="faqList.jsp">View All Questions</a></li>
            </ul>
        </div>
    </div>
</div>    


    <jsp:include page="footer.jsp"/>
    
</body>
</html>