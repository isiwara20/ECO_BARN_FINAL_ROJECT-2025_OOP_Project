<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <!-- IT23600652 Isiwara Wijesinghe -->   

<%
    String currentPhone = (String) session.getAttribute("phone");
%>
<!DOCTYPE html>
<html>
<head>
     <title>Eco-Barn | Change Number</title>
  <link rel="icon" type="image/x-icon" href="img/logoblack.png">

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e9eff5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 480px;
            text-align: center;
        }

        h1 {
            margin-bottom: 10px;
            font-size: 26px;
            color: #333;
        }

        .current-number {
            font-size: 15px;
            color: #777;
            margin-bottom: 25px;
        }

        input[type="tel"] {
            padding: 14px;
            width: 90%;
            margin-bottom: 20px;
            border-radius: 8px;
            font-size: 16px;
            border: 1.5px solid #ccc;
            outline: none;
            transition: 0.3s;
        }

        input[type="tel"]:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0,123,255,0.3);
        }

        #change_num_submit {
            background-color: #03891e;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border: none;
            border-radius: 8px;
            padding: 12px;
            width: 100%;
            transition: 0.3s;
        }

        #change_num_submit:hover {
            background-color: #04ba22;
        }

        p {
            margin-top: 20px;
            font-size: 14px;
            color: #555;
        }
        
            .top-logo {
    width: 100px;
    height: auto;
    margin-bottom: 5px;
}
    </style>
</head>
<body>
    <div class="container">
      <div class="top-logo-container">
    <a href="index.jsp"><img src="img/logoblack.png" class="top-logo" alt="Logo"></a>
</div>
        <h1>Change Phone Number</h1>
        <div class="current-number">
            Your current number is: <strong><%= currentPhone != null ? currentPhone : "Not available" %></strong>
        </div>
        <form action="ChangeNumberServlet" method="post">
            <input type="tel" id="change_num" name="change_num" placeholder="Enter new phone number" pattern="[0-9]{10}" required>
            <input type="submit" id="change_num_submit" name="change_num_submit" value="Send Code">
        </form>
        <p>A verification code will be sent to your new number.</p>
    </div>
</body>
</html>
