<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <!-- IT23600652 Isiwara Wijesinghe -->   
    
<!DOCTYPE html>
<html>
<head>
     <title>Eco-Barn | Reset Password</title>
  <link rel="icon" type="image/x-icon" href="img/logoblack.png">
 <style>
        /* (same CSS from your original code) */
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;         
            background-color: #f4f4f4;
            margin: 0;
            height: 100vh;
        }

        .container {
            display: flex;
            max-width: 400px;
            width: 100%;
            padding: 40px;
            border-radius: 18px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            text-align:center;
            background-color: white;
            overflow: hidden;
            height: auto;
        }

        .form_container {
            width: 100%;
            background-color: #fff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            margin-top: 5px;
            margin-bottom: 5px;
        }

        h2 {
            color: #333;
            font-size: 22px;
            margin-bottom: 10px;
            font-weight: 700;
        }

        #credential {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
            color: #333;
        }

        input.error {
            background-color: rgb(255, 171, 184);
        } 

        #submit {
            width: 100%;
            display: block;
            background-color: #736d00;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            margin-top: 20px;
            margin-right: auto;
            margin-left: auto;
        }

        #submit:hover {
            background-color: #6d01f9;
        }

        a {
            color: blue;
            text-decoration: none;
            font-size: 14px;
        }

        a:hover {
            color:red;
        }

        #messages {
            width: 100%;
            text-align: center;
            font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 14px;
            margin-top: 10px;
            color: red;
            min-height: 20px;
        }

        .rolespace {
            margin-top: 5px;
            margin-left: 50px;
        }

        .signin_message {
            color: #000000;
        }

        .signin_button {
            margin-top: 100px;
            text-align:center;
            color:white;
            background-color: rgb(28, 30, 26);
            padding: 12px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 15px;
            text-decoration: none;
        }

        .signin_button:hover {
            text-decoration: none;
            background-color: #fdf9f9;
            color: #000000;
            font-weight: bold;
        }

        .back {
            width: 100%;
            text-align : center;
            font-weight: bold;
            text-decoration:none;
        }

        #info {
            font-size:12px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form_container">
        <center>
            <img src="img/logoblack.png" alt="LOGO" width="100">
        </center>
        <h2>Forgotten your password</h2>

        <p id="info">Please enter your email address or username to find phone number to initially send OTP SMS to start recovering your account.</p>

<%
    String credential = request.getParameter("credential");
    String error = (String) request.getAttribute("error");
%>

        <form method="post" action="ResetPasswordServlet">  
            <input type="text" id="credential" name="resetcredentials" required placeholder="Email or Username" >
            <input type="submit" id="submit" name="submit" value="Send OTP"><br>
            <div class="back"><a href="signin.jsp">Back to Sign In</a></div>
            
            
                     <%
            // Display invalid code error if present
            String errorpasswordreset = (String) request.getAttribute("errorpasswordreset");
            if (errorpasswordreset != null) {
        %>
            <div id="messages" class="error"><%= errorpasswordreset %></div>
        <% }
            
                    request.removeAttribute("errorpasswordreset");
                    %>
            
            
        </form>
    </div>
</div>

<script>
// Clear the error if user navigates back
window.addEventListener("pageshow", function(event) {
    if (event.persisted || window.performance.navigation.type === 2) {
        // Clear the error message if page is loaded from cache (back button)
        document.getElementById("messages").innerText = "";
        document.getElementById("credential").classList.remove("error");
    }
});

if (document.getElementById("messages").innerText.trim() !== "") {
    document.getElementById("credential").classList.add("error");

    // Optional timeout to fade the error
    setTimeout(() => {
        document.getElementById("messages").innerText = "";
        document.getElementById("credential").classList.remove("error");
    }, 2000);
}

// Extra timeout safety
setTimeout(function() {
    document.getElementById("messages").innerHTML = "";
}, 3000);



document.querySelector("form").addEventListener("submit", function(e) {
    const submitBtn = document.getElementById("submit");
    submitBtn.disabled = true;
    submitBtn.value = "Sending OTP...";
    submitBtn.style.opacity = "0.6"; // optional visual feedback
});

</script>

</body>
</html>