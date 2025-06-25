<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <!-- IT23600652 Isiwara Wijesinghe -->   
    
<!DOCTYPE html>
<html>
<head>
    <title>Eco-Barn | OTP Verify</title>
  <link rel="icon" type="image/x-icon" href="img/logoblack.png">

    <style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #f0f0f0, #d4e0ec);
        color: #333;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        background-color: #ffffff;
        padding: 10px 10px;
        border-radius: 20px;
        text-align: center;
        width: 400px;
        box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.15);
    }

    h2 {
        color: #2c3e50;
        margin-bottom: 20px;
    }

    p {
        font-size: 15px;
        color: #555;
    }

    .info {
        margin: 10px 0 20px;
        font-size: 16px;
        color: #444;
    }

    #otp {
        padding: 12px;
        width: 85%;
        margin: 12px 0;
        border: 2px solid #ccc;
        border-radius: 8px;
        font-size: 20px;
        font-weight: bold;
        text-align: center;
        letter-spacing: 10px;
        outline: none;
        transition: border-color 0.3s;
    }

    #otp:focus {
        border-color: #2980b9;
    }

    #confirm_account {
        background-color: #03891e;
        color: #fff;
        padding: 12px 30px;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    #confirm_account:hover {
        background-color: #04ba22;
    }

    #timer {
        font-size: 15px;
        margin-top: 10px;
        color: #27ae60;
        min-height: 30px;
    }

    form {
        margin-bottom: 20px;
    }

    #error {
        color: #e74c3c;
        font-weight: bold;
        margin-top: 10px;
    }

    .modify {
        display: inline-block;
        margin-top: 2px;
        font-size: 14px;
        color: #3498db;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .modify:hover {
        color: #21618c;
        text-decoration: underline;
    }
    
    .top-logo {
    width: 100px;
    height: auto;
    margin-bottom: 5px;
}
</style>

    <script>
        var countvalue = 10;
        var interval;

        function countdown() {
            document.getElementById("timer").innerHTML = "( " + countvalue + " )" + " Resend Code";
            countvalue = countvalue - 1;

            // Remove countdown when time is up and add resend button
            if(countvalue == 0) {
                document.getElementById("timer").innerHTML = '<form method="post" action="resendWhatsAppOTP"> <input style="padding:5px ; background-color:blue; color:white; cursor:pointer; border-radius:4px; border:none; " type="submit" name="resend"  value="Resend the code"></form>';
                clearInterval(interval);
            }
        }

        // Setting interval to display the timer
        interval = setInterval(countdown, 1000);

        // Hide error message after some time
        window.onload = function() {
            if(document.getElementById('error')) {
                function disappearError() {
                    document.getElementById('error').style.display = 'none';
                }

                setTimeout(disappearError, 4000);
            }
        }
    </script>
</head>
<body>
    <div class="container">
           <div class="top-logo-container">
    <a href="index.jsp"><img src="img/logoblack.png" class="top-logo" alt="Logo"></a>
</div>

        <h2>Verify your Mobile Number</h2>
        <p>We sent the verification code to your mobile number.</p>

        <%-- Get the phone number from the session --%>
        <%
            String phone = (String) session.getAttribute("phone");
            if (phone != null) {
        %>
            <div class="info">Please enter the 4-digit code sent to <b><%= phone %></b> to activate your account.</div>
        <% } else { %>
            <div class="info">Verification Code sent to [NOT SET]</div>
        <% } %>

        <%
            // Display invalid code error if present
            String invalidCode = (String) request.getAttribute("invalidCode");
            if (invalidCode != null) {
        %>
            <div id="error" class="error"><%= invalidCode %></div>
        <% } %>
        
        
        
          <%
            // Display invalid code error if present
            String resendalert = (String) request.getAttribute("resendSuccess");
            if (resendalert != null) {
        %>
            <div id="error" class="error"><%= resendalert %></div>
        <% } %>

        <br><br>
        <form method="post" action="VerifyCodeServlet">
<input type="text" id="otp" name="code" required maxlength="4" inputmode="numeric" oninput="this.value=this.value.replace(/\D/g,'');">
            <br>
            <input type="submit" id="confirm_account" name="confirm_account" value="Verify">
        </form>

        <a href="change_number.jsp" class='modify'>Modify Mobile Number</a>
        <div id="timer"></div>
        
        
        <footer style="margin-top: 4px; text-align: center; font-size: 14px; color: #777;">
    <div style="padding-bottom: 10px;">
        &copy; 2025 Eco-Barn. All rights reserved.
    </div>
    
</footer>
    </div>
    
    
    
    
</body>
</html>