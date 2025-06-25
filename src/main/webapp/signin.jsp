<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- IT23600652 Isiwara Wijesinghe -->   

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Eco-Barn | Sign In / Up</title>
  <link rel="icon" type="image/x-icon" href="img/logoblack.png">

  <style>
@import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');

* {
    box-sizing: border-box;
}

body {
    background: #f6f5f7;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    font-family: 'Montserrat', sans-serif;
    height: 100vh;
    margin: -20px 0 50px;
}

h1 {
    font-weight: bold;
    margin: 0;
    font-size: 20px;
}

h2 {
    text-align: center;
}

p {
    font-size: 14px;
    font-weight: 100;
    line-height: 20px;
    letter-spacing: 0.5px;
    margin: 20px 0 30px;
}

span {
    font-size: 12px;
}

a {
    color: #333;
    font-size: 14px;
    text-decoration: none;
    margin: 15px 0;
}

button {
    border-radius: 20px;
    border: 1px solid #FF4B2B;
    background-color: #FF4B2B;
    color: #FFFFFF;
    font-size: 12px;
    font-weight: bold;
    padding: 12px 45px;
    letter-spacing: 1px;
    text-transform: uppercase;
    transition: transform 80ms ease-in;
}

button:active {
    transform: scale(0.95);
}

button:focus {
    outline: none;
}

button.ghost {
    background-color: transparent;
    border-color: #FFFFFF;
}

form {
    background-color: #FFFFFF;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    padding: 0 50px;
    height: 100%;
    text-align: center;
}



.container {
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 11px 20px rgba(0,0,0,0.25), 
            0 8px 8px rgba(0,0,0,0.22);
    position: relative;
    overflow: hidden;
    margin-top: 5%;
      margin-bottom: 20px;

    width: 810px;
    max-width: 100%;
    min-height: 550px;
}

.form-container {
    position: absolute;

    top: 0;
    height: 100%;
    transition: all 0.6s ease-in-out;
}

.sign-in-container {
    left: 0;
    width: 50%;
    z-index: 2;
}

.container.right-panel-active .sign-in-container {
    transform: translateX(100%);
}

.sign-up-container {
    margin-top: 5px;
    left: 0;
    width: 50%;
    opacity: 0;
    z-index: 1;
}

.container.right-panel-active .sign-up-container {
    transform: translateX(100%);
    opacity: 1;
    z-index: 5;
    animation: show 0.6s;
}

@keyframes show {
    0%, 49.99% {
        opacity: 0;
        z-index: 1;
    }
    
    50%, 100% {
        opacity: 1;
        z-index: 5;
    }
}

.overlay-container {
    position: absolute;
    top: 0;
    left: 50%;
    width: 50%;
    height: 100%;
    overflow: hidden;
    transition: transform 0.6s ease-in-out;
    z-index: 100;
}

.container.right-panel-active .overlay-container{
    transform: translateX(-100%);
}

.overlay {
    background: #0ce800;
    background: -webkit-linear-gradient(to right, #05913dd6, #165b01);
    background: linear-gradient(to right, #05913dd6, #165b01);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: 0 0;
    color: #FFFFFF;
    position: relative;
    left: -100%;
    height: 100%;
    width: 200%;
    transform: translateX(0);
    transition: transform 0.6s ease-in-out;
}

.container.right-panel-active .overlay {
    transform: translateX(50%);
}

.overlay-panel {
    position: absolute;
    display: flex;
    align-items: center;
    justify-content: space-between; /* pushes top and bottom content apart */
    flex-direction: column;
    padding: 0 40px;
    margin-top: 70px;
    text-align: center;
    top: 0;
    height: 100%;
    width: 50%;
    transform: translateX(0);
    transition: transform 0.6s ease-in-out;
}

.overlay-left {
    transform: translateX(-20%);
}

.container.right-panel-active .overlay-left {
    transform: translateX(0);
}

.overlay-right {
    right: 0;
    transform: translateX(0);
}

.container.right-panel-active .overlay-right {
    transform: translateX(20%);
}

.social-container {
    margin: 20px 0;
}

.social-container a {
    border: 1px solid #DDDDDD;
    border-radius: 50%;
    display: inline-flex;
    justify-content: center;
    align-items: center;
    margin: 0 5px;
    height: 40px;
    width: 40px;
}

footer {
    background-color: #222;
    color: #fff;
    font-size: 14px;
    bottom: 0;
    position: fixed;
    left: 0;
    right: 0;
    text-align: center;
    z-index: 999;
}

footer p {
    margin: 10px 0;
}

footer i {
    color: red;
}

footer a {
    color: #3c97bf;
    text-decoration: none;
}

.invalid
            {
                color: red;
            }
            .valid
            {
                color:green;
            }
           
            .password-container
            {
                display: flex;
               
                align-items:flex-start;
             
            }
            .inputs
            {
             
             
                display:flex;
                flex-direction: column;
width: 66%;             }
           
            #fname , #lname, #email, #phone ,#password , #cpassword
            {
                
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 14px;
                color: #333;
                background-color: #eee;
    border: none;
    padding: 12px 15px;
    margin: 8px 0;
    width: 100%;

            }

            .passwordcheck
            {
                font-size: 11.5px;
                margin-top:1px;
                text-align: left;
                width: 70%;
            }
            .passwordcheck li
            {
                padding: 1px;
            }


            a 
            {
                color:  #8135f3;
                text-decoration: none;
                font-size: 14px;
            }

            a:hover 
            {
                text-decoration: underline;
            }

            label 
            {
                font-size: 14px;
                color: #555;
                margin: 0;
            }

         #messages {
    margin-top: 10px;
    width: 100%;
    padding: 5px;
    text-align: center;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-size: 14px;
    color: rgb(230, 6, 6);
    position: relative; /* or just remove this line */
}

#signinmessages
{
 margin-top: 10px;
    width: 100%;
    padding: 5px;
    text-align: center;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-size: 14px;
    color: rgb(230, 6, 6);
    position: relative; /* or just remove this line */



}
            
            button{
                cursor: pointer;
            }
         



.overlay-panel img {
    width: 190%;
    height: auto;
    align-items: baseline;
    margin-top: 10px;
    border-radius: 10px;
    object-fit: contain;
}

.top-logo {
    position: absolute;
    top: 10px;
    left: 10px;
    width: 100px; /* adjust based on your logo size */
    height: auto;
    object-fit: contain;
}

#credential, #inpassword
            {
                width: 100%;
                padding: 12px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 14px;
                color: #333;

            }
            input.error 
            {
                background-color: rgb(255, 171, 184);
            } 



  </style>
</head>
<body>
    <div class="container" id="container">
        <div class="form-container sign-up-container">
            
            <form action="SignUpInsertServlet" method="post" onsubmit="return passwordChecking()">
                <h1 style="margin-bottom: 5px;">Create Account</h1>
               <input type="text" id="fname" name="fname" required placeholder="First Name" pattern="[A-Za-z]+" title="Please enter Letters only">
               

                <input type="text" id="lname" name="lname" required placeholder="Last Name" pattern="[A-Za-z]+" title="Please enter Letters only">
                
                <input type="email" id="email" name="email" required placeholder="Email">
                
                <input type="tel" id="phone" name="phone" required pattern="[0-9]{10}" placeholder="Phone Number">
                

                <div class="password-container">
                    <div class="inputs">
                        <input type="password" id="password" name="password" required placeholder="Password"  onkeyup="checkstandard()">
                        
                        <input type="password" id="cpassword" name="cpassword" required  placeholder="Re-enter Password" onkeyup = "removeerror()">
                    </div>
                    <div class="passwordcheck">
                        <ul>
                            <li class="invalid" id="length">Atleast 8 characters</li>
                            <li class="invalid" id="uppercase">Atleast one uppercase letter</li>
                            <li class="invalid" id="lowercase">Atleast one lowercase letter</li>
                            <li class="invalid" id="num">Atleast one number</li>                
                        </ul>
                    </div>
    
                </div>
                   
                    
                  
             
                <label style="text-align: left; display: flex; align-items: center; font-size: 12px;  margin-top: 10px; margin-bottom: 20px;">
    <input type="checkbox" name="agree" required>&ensp;&ensp;
    <span>I agree to the <a href="Terms.jsp" target="_blank">Terms and Conditions</a> and <a href="privacy.jsp" target="_blank">Privacy Policy</a>.</span>
</label>



<button id="submit">Sign Up</button>
               

<%
            // Display invalid code error if present
            String signinissue = (String) request.getAttribute("signupissue");
            if (signinissue != null) {
        %>
            <div id="messages" class="error"><%= signinissue %></div>
        <% } %>

                <div id="messages"></div>

            </form>
        </div>
        <div class="form-container sign-in-container">

            <a href="index.jsp"><img src="img/logoblack.png" class="top-logo" alt="Logo"></a>

            <form action="SignInCheckServlet" method="post">
                <h1 style="margin-bottom: 20px;">Sign in</h1>
               
               
                    <input type="text" id="credential" name="credential" required placeholder="Email or Username" >
                    
                    <input type="password" id="inpassword" name="inpassword" required placeholder="Password">
                    <br>
                    
                    <div class="reset_password"><a  href="reset_password.jsp" target="_blank">Forgotten your username or password</a></div>

                    <br>

                    <button style="margin-top: 20px;">Sign In</button>
                    
                   
                   <%
            // Display invalid code error if present
            String errorsignin = (String) request.getAttribute("errorsignin");
            if (errorsignin != null) {
        %>
            <div id="signinmessages" class="error"><%= errorsignin %></div>
        <% } %>

                                    <div id="signinmessages"></div>
                    
                    
                </form>
                
      
         
        </div>
        <div class="overlay-container">
            <div class="overlay">
                    <a href="index.jsp"><img src="img/image.png" class="top-logo" alt="Logo"></a>
                  
                  
                <div class="overlay-panel overlay-left">
                    <h1>Welcome Back!</h1>
                    <p >Already have an account? <br><span style="text-align:justify; font-size: 12px;">Sign in to access your personalized grocery dashboard and continue shopping with ease.</span></p>                    <button class="ghost" id="signIn">Sign In</button>
                    <img src="img/signpic1.png">

                </div>


                <div class="overlay-panel overlay-right">
                
                    <h1>New Here?</h1>
                    <p>Create an account and make your grocery shopping faster, easier, and smarter. Freshness is just a click away!</p>
                    <button class="ghost" id="signUp">Sign Up</button>
                    <img src="img/signpic4.png">
                    
                    

                </div>
                
           
        </div>
    </div>
    
    <footer>
       
    </footer>
  <script>
    const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
    container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
    container.classList.remove("right-panel-active");
});



function passwordChecking()
            {
                
                
                const password = document.getElementById("password").value;
                const cpassword = document.getElementById("cpassword").value;

                if(password !== cpassword)
                {
                    
                    document.getElementById("password").className = "error";
                    document.getElementById("cpassword").className = "error";

                    //to make password check to default
                    document.getElementById('length').className = "invalid";
                    document.getElementById('uppercase').className = "invalid";
                    document.getElementById('lowercase').className = "invalid";
                    document.getElementById('num').className = "invalid";

                    //to make the button to default
                    document.getElementById("submit").disabled = true;
                    document.getElementById("submit").style.cursor = "not-allowed";
                    document.getElementById("submit").style.opacity = "0.5";




                    

                    //to empty the password and re-password fields
                    document.getElementById("password").value = "";
                    document.getElementById("cpassword").value = "";

                    //display the error message
                    document.getElementById("messages").innerHTML = "Password not match. Please re-enter";


                    //disapear the error meassges
                    setTimeout(function()
                {
                    document.getElementById("messages").innerHTML = "";
                },3000);

                    return false; //to sumit the form
                }   
                else
                {
                    document.getElementById("password").className = "noterror";
                    document.getElementById("cpassword").className = "noterror";
                    return true; //to submit the form
                   


                }

            }


            //function to check the password standard
            function checkstandard()
                {
                    var password = document.getElementById("password").value;


                    //to remove the error background of input
                    document.getElementById("password").className = "noterror";



                    var len = false;
                    var up = false;
                    var low = false;
                    var no = false;

                    //check password length
                    if(password.length >= 8)
                    {
                        len = true;
                        document.getElementById('length').className = "valid";
                    }
                    else
                    {
                        document.getElementById('length').className = "invalid";


                    }

                    
                    //to check uppercase
                    for(var x = 0 ; x <= password.length ; x++)
                    {
                        if(password[x] >= 'A' && password[x] <= 'Z')
                        {
                            up = true;
                            document.getElementById('uppercase').className = "valid";
                            break;
                        }
                        else
                        {
                            document.getElementById('uppercase').className = "invalid";

                        }
                    }

                    //to check lowercase
                    for(var x = 0 ; x <= password.length ; x++)
                    {
                        if(password[x] >= 'a' && password[x] <= 'z')
                        {
                            low = true;
                            document.getElementById('lowercase').className = "valid";
                            break;
                        }
                        else
                        {
                            document.getElementById('lowercase').className = "invalid";

                        }
                    }


                    //to check a number in password
                    for(var x=0; x <= password.length ; x++)
                    {
                        if(password[x] >= 0 && password[x] <= 9)
                        {
                            no = true;
                            document.getElementById('num').className = "valid";
                            break;
                        }  
                        else
                        {
                            document.getElementById('num').className = "invalid";

                        } 
                    }


                    if(len == true && up == true && low == true && no == true)
                    {
                        document.getElementById("submit").disabled = false;
                        document.getElementById("submit").style.cursor = "pointer";
                        document.getElementById("submit").style.opacity = "1";                        


                    }
                    else
                    {
                        document.getElementById("submit").disabled = true;
                        document.getElementById("submit").style.cursor = "not-allowed";
                        document.getElementById("submit").style.opacity = "0.5";

                    }


                }

                function removeerror()
                {   

                    //to remove the error background of input
                    document.getElementById("cpassword").className = "noterror";


                }
                
                function buttonlock()
                {
                    document.getElementById("submit").disabled = true;
                    document.getElementById("submit").style.cursor = "not-allowed";
                    document.getElementById("submit").style.opacity = "0.5";

                }
                
                window.onload = function() {
                    buttonlock();
                };
                
                
                setTimeout(function()
                        {
                            document.getElementById("messages").innerHTML = "";
                        },3000);
                
                
                
                setTimeout(function()
                        {
                            document.getElementById("signinmessages").innerHTML = "";
                        },3000);
                

  </script>

</body>
</html>