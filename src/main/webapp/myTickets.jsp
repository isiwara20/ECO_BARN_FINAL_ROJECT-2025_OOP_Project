<%@ page import="java.util.*, com.ecobarn.model.ContactTicket" %>
 <!-- IT23600584 Indievarie H. C -->   

<%@ page session="true" %>
<%
    List<ContactTicket> ticketList = (List<ContactTicket>) request.getAttribute("ticketList");
%>
<html>
<head>
    <title>Eco-Barn | My Tickets</title>
      <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: url('img/gree.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
        }

        .container {
            max-width: 100%;
            margin: 10px auto;
            background-color: #ffffffee;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #2e7d32;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            overflow: hidden;
        }

        th {
            background-color: #388e3c;
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f1f8e9;
        }

        .btn {
            padding: 8px 16px;
            background-color: #66bb6a;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background-color: #43a047;
        }

        .message {
            text-align: center;
            color: green;
            margin-bottom: 20px;
        }

        .actions form {
            display: inline;
        }

        .no-tickets {
            text-align: center;
            color: #777;
            font-style: italic;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="container">
    <h2>My Tickets</h2>

    <%
        String msg = (String) request.getAttribute("msg");
        if (msg != null) {
    %>
        <div class="message"><%= msg %></div>
    <% } %>

    <table>
        <tr>
            <th>Ticket ID</th>
            <th>Concern</th>
            <th>Status</th>
            <th>Admin Response</th>
            <th>Actions</th>
        </tr>
        <%
            if (ticketList != null && !ticketList.isEmpty()) {
                for (ContactTicket t : ticketList) {
        %>
            <tr>
                <td><%= t.getTicketID() %></td>
                <td><%= t.getConcern() %></td>
                <td><%= t.getStatus() %></td>
                <td><%= (t.getRespond() != null && !t.getRespond().isEmpty()) ? t.getRespond() : "Pending" %></td>
                <td class="actions">
                    <form action="EditTicket.jsp" method="get">
                        <input type="hidden" name="ticketID" value="<%= t.getTicketID() %>"/>
                        <button class="btn">Edit</button>
                    </form>
                    <form action="DeleteTicketServlet" method="post">
                        <input type="hidden" name="ticketID" value="<%= t.getTicketID() %>"/>
                        <button class="btn">Delete</button>
                    </form>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="5" class="no-tickets">No tickets found.</td>
            </tr>
        <%
            }
        %>
    </table>
</div>
<jsp:include page="footer.jsp"/>

</body>
</html>
