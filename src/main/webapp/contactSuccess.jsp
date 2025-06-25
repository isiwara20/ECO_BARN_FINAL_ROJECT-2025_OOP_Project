<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <!-- IT23600584 Indievarie H. C -->   

<html>
<head>
    <title>Eco-Barn | Ticket Submitted</title>
      <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    
    <style>
        body {
            font-family: Arial;
            text-align: center;
            margin: 0;
            padding: 0;
            background: url('img/gree.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .container {
            background-color: white;
            color: #333;
            max-width: 500px;
            margin: 40px auto;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }

        h2 {
            color: green;
            margin-bottom: 20px;
        }

        .btn {
            padding: 10px 20px;
            background-color: orange;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            display: inline-block;
            margin-top: 20px;
        }

        .btn:hover {
            background-color: darkorange;
        }

        .whatsapp {
            margin-top: 30px;
        }

        .whatsapp img {
            width: 200px;
            height: auto;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="container">
    <h2>🎉 Ticket Submitted Successfully!</h2>
    <p>Your Ticket ID: <strong><%= request.getAttribute("ticketID") %></strong></p>

    <a href="<%= request.getContextPath() %>/MyTicketsServlet" class="btn">View My Tickets</a>

    <div class="whatsapp">
        <a href="https://wa.me/94717456657" target="_blank">
            <img src="img/wht.png" alt="Chat on WhatsApp">
        </a>
    </div>
</div>
<jsp:include page="footer.jsp"/>

</body>
</html>
