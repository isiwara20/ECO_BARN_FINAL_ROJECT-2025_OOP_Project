<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- IT23731714 PATHIRANA L.P.S.G. -->   

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eco-Barn | FAQ Form </title>
  <link rel="icon" type="image/x-icon" href="img/logoblack.png">

   
    <!-- All the styles for faqForm.jsp -->
    <style>
        body {
		    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		    background: linear-gradient(135deg, #d0f0c0, #b2dfdb);
		    margin: 0;
		    padding: 0;
		    min-height: 100vh;
		    display: block;
		    text-align: center;
		}


        .box {
		    width: 100%;
		    max-width: 1000px;
		    height: 700px;
		    display: flex;
		    border-radius: 20px;
		    overflow: hidden;
		    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
		    background: rgba(255, 255, 255, 0.2);
		    backdrop-filter: blur(15px);
		    border: 1px solid rgba(255, 255, 255, 0.3);
		    margin: 40px auto; /* NEW LINE to center horizontally */
		}


        .image-container {
            flex: 1;
            background: url('img/faqForm.jpg') no-repeat center center/cover;
        }

        .form-container {
            flex: 1;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            backdrop-filter: blur(10px);
        }

        h2 {
            color: #1b5e20;
            font-size: 26px;
            margin-bottom: 20px;
            text-align: center;
            font-weight: bold;
            letter-spacing: 1px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        form input[type="text"],
        form input[type="email"],
        form textarea {
            background-color: rgba(255, 255, 255, 0.85);
            padding: 14px 18px;
            margin: 10px 0;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        form input::placeholder,
        form textarea::placeholder {
            color: #666;
            font-style: italic;
        }

        form input:focus,
        form textarea:focus {
            outline: none;
            box-shadow: 0 0 8px rgba(30, 136, 229, 0.5);
            background-color: #fff;
        }

        form textarea {
            resize: vertical;
            min-height: 120px;
            max-height: 250px;
            scrollbar-width: thin;
            scrollbar-color: #2e7d32 #ccc;
        }

        form textarea::-webkit-scrollbar {
            width: 6px;
        }

        form textarea::-webkit-scrollbar-thumb {
            background-color: #2e7d32;
            border-radius: 3px;
        }

        button {
            background: linear-gradient(to right, #43a047, #2e7d32);
            color: white;
            padding: 14px 20px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            margin-top: 15px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        button:hover {
            background: linear-gradient(to right, #2e7d32, #1b5e20);
            transform: translateY(-2px) scale(1.03);
        }
    </style>
    
    <script>


    </script>
</head>

<body>
    <jsp:include page="header.jsp"/>
    
<!--  faq   -->
<div class="box">
        <div class="image-container"></div>
        <div class="form-container">
            <h2>📞 Still Need Help? Contact Customer Care</h2>
            <form action="FaqFormServlet" method="post">
                <input type="text" name="name" placeholder="👤 Full Name" required />
                <input type="email" name="email" placeholder="✉️ Email Address" required />
                <input type="text" name="phonenumber" placeholder="📱 Phone Number" required />
                <input type="text" name="nic" placeholder="🆔 NIC Number" required />
                <textarea name="question" placeholder="💬 Type your question here..." required></textarea>
                <button type="submit">Submit</button>
            </form>
        </div>
    </div>

<jsp:include page="footer.jsp"/>


    
    
</body>
</html>