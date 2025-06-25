<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ecobarn.DAO.impl.ContactDAOImpl, com.ecobarn.model.ContactTicket" %>
 <!-- IT23600584 Indievarie H. C -->   

<%
    String ticketID = request.getParameter("ticketID");
    ContactTicket ticket = new ContactDAOImpl().getTicketByID(ticketID);
%>
<html>
<head>
    <title>Eco-Barn | Edit Ticket</title>
      <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f7f8;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
        	display:block;
        	margin:auto;
            background: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
            width: 400px;
            margin-top:20px;
                        margin-bottom:20px;
            
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #555;
        }

        textarea {
            width: 100%;
            height: 120px;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            resize: vertical;
            font-size: 14px;
            margin-bottom: 20px;
            transition: border-color 0.3s;
        }

        textarea:focus {
            border-color: #28a745;
            outline: none;
        }

        button {
            width: 100%;
            background-color: #28a745;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="form-container">
    <h2>Edit Ticket</h2>
    <form action="UpdateTicketServlet" method="post">
        <input type="hidden" name="ticketID" value="<%= ticket.getTicketID() %>"/>
        <label>Concern:</label>
        <textarea name="concern" required><%= ticket.getConcern() %></textarea>
        <button type="submit">Update</button>
    </form>
</div>
<jsp:include page="footer.jsp"/>

</body>
</html>
