<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <!-- IT23600652 Isiwara Wijesinghe -->   
    
    
    <%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eco-Barn | Reset Password</title>
  <link rel="icon" type="image/x-icon" href="img/logoblack.png">

<style>
          * {
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f9fafb;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .container {
        background-color: #fff;
        padding: 2rem;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 500px;
    }

    .form_container {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    h2 {
        margin: 0.5rem 0 1rem;
        font-size: 24px;
        color: #333;
    }

    .info {
        font-size: 14px;
        color: #555;
        margin-bottom: 1.5rem;
        text-align: center;
    }

    input[type="password"], input[type="submit"] {
        width: 100%;
        padding: 0.75rem;
        margin: 0.5rem 0;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 14px;
    }

    input[type="password"]:focus {
        outline: none;
        border-color: #9b870c;
    }

    #submit {
        background-color: #736d00;
        color: white;
        font-weight: bold;
        transition: background-color 0.3s ease, opacity 0.3s ease;
        opacity: 0.5;
        border: none;
    }

    .submit_pass {
        background-color: #736d00;
        color: white;
        cursor: pointer;
        opacity: 1 !important;
    }

    #submit:hover:enabled {
        background-color: #5e5900;
    }

    .back {
        margin-top: 1rem;
        font-size: 14px;
    }

    .back a {
        color: #007bff;
        text-decoration: none;
    }

    .back a:hover {
        text-decoration: underline;
    }

    #messages {
        margin-top: 10px;
        font-size: 14px;
        color: red;
        text-align: center;
        min-height: 20px;
    }

    .password-container {
        display: flex;
        flex-wrap: wrap;
        gap: 1rem;
        width: 100%;
    }

    .inputs {
        flex: 1 1 55%;
        display: flex;
        flex-direction: column;
    }

    .passwordcheck {
        flex: 1 1 40%;
        font-size: 13px;
    }

    .passwordcheck ul {
        padding: 0;
        margin: 0;
        list-style: none;
    }

    .passwordcheck li {
        padding: 4px 0;
    }

    .valid {
        color: green;
    }

    .invalid {
        color: red;
    }

    @media screen and (max-width: 600px) {
        .password-container {
            flex-direction: column;
        }
        .inputs, .passwordcheck {
            flex: 1 1 100%;
        }
    }

        </style>
<script>
        function checkstandard() {
            var password = document.getElementById("password").value;
            var len = false, up = false, low = false, no = false;

            if (password.length >= 8) {
                len = true;
                document.getElementById('length').className = "valid";
            } else {
                document.getElementById('length').className = "invalid";
            }

            for (var x = 0; x < password.length; x++) {
                if (password[x] >= 'A' && password[x] <= 'Z') {
                    up = true;
                    document.getElementById('uppercase').className = "valid";
                    break;
                } else {
                    document.getElementById('uppercase').className = "invalid";
                }
            }

            for (var x = 0; x < password.length; x++) {
                if (password[x] >= 'a' && password[x] <= 'z') {
                    low = true;
                    document.getElementById('lowercase').className = "valid";
                    break;
                } else {
                    document.getElementById('lowercase').className = "invalid";
                }
            }

            for (var x = 0; x < password.length; x++) {
                if (!isNaN(password[x])) {
                    no = true;
                    document.getElementById('num').className = "valid";
                    break;
                } else {
                    document.getElementById('num').className = "invalid";
                }
            }

            if (len && up && low && no) {
                document.getElementById("submit").disabled = false;
                document.getElementById("submit").className = "submit_pass";
            } else {
                document.getElementById("submit").disabled = true;
                document.getElementById("submit").className = "";
            }
        }
    </script>
</head>

<body>
    <div class="container">
        <div class="form_container">
            <img src="${pageContext.request.contextPath}/img/logoblack.png" alt="LOGO" width="100">
            <h2>Reset your Password</h2>
            <div class='info'>Please enter new password for <b>  ${username}  to reset your account.</div>

            <form method="post" action="ResetPasswordConfirmServlet">
                <div class="password-container">
                    <div class="inputs">
                        <input type="hidden" id="username" name="usernameupdatepass" value = "${username}">
                    
                        <input type="password" id="password" name="password" required placeholder="New Password" onkeyup="checkstandard()">
                        <input type="password" id="cpassword" name="cpassword" required placeholder="Re-enter New Password">
                    </div>
                    <div class="passwordcheck">
                        <ul>
                            <li class="invalid" id="length">At least 8 characters</li>
                            <li class="invalid" id="uppercase">At least one uppercase letter</li>
                            <li class="invalid" id="lowercase">At least one lowercase letter</li>
                            <li class="invalid" id="num">At least one number</li>
                        </ul>
                    </div>
                </div>

                <input type="submit" id="submit" name="submit" value="Reset Password" disabled>
                <div class="back"><a href="signin.jsp">Back to Sign In</a></div>
               
               
<%
            // Display invalid code error if present
            String passwordresetissue = (String) request.getAttribute("passwordresetissue");
            if (passwordresetissue != null) {
        %>
            <div id="messages" class="error"><%= passwordresetissue %></div>
        <% } %>
               
               
               
                </div>
            </form>
        </div>
    </div>
</body>
</html>