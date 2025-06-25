<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <!-- IT23600584 Indievarie H. C -->   

<head>
    <style>
        .promo-form {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-top: 20px;
        }

        .promo-form input[type="email"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            flex: 1;
            min-width: 250px;
        }

        .promo-form button {
            padding: 10px 20px;
            background-color: orange;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .promo-form button:hover {
            background-color: darkorange;
        }
    </style>
</head>
<section class="promo-section">
    <div class="content">
    <br>
        <h2>Make your online shop easier <br> with our mobile app</h2>
        <p>Stay connected and shop smarter with our easy-to-use mobile application.</p>

        <form method="post" action="SubscribeServletemailfooter" class="promo-form">
            <input type="email" name="email" placeholder="Your email address" required>
            <button type="submit">SUBMIT</button>
        </form>

        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
        <p style="color: green;"><%= message %></p>
        <% } %>
    </div>

    <div class="image-container" style="margin-top:140px;">
        <img src="img/freepik__background__31123.png" alt="Delivery Person">
    </div>
</section>
