<%@ page import="java.sql.*, com.ecobarn.util.DBConnection" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <!-- IT23731714 PATHIRANA L.P.S.G. -->   

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Eco-Barn | Submitted FAQs</title>
      <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    
   <style>
    * {
        box-sizing: border-box;
        transition: all 0.3s ease;
    }

    body {
        margin: 0;
        padding: 0;
        height: 100vh;
        align-items: center;
        justify-content: center;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to right, #81c784, #aed581); /* Darker greens */
    }

    .box {
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
            width: 95%;
            max-width: 1200px;
            overflow-x: auto;
            backdrop-filter: blur(8px);
        }

    h2 {
        color: #1b5e20; /* Darker green for the heading */
        margin-bottom: 20px;
        text-align: center;
        font-size: 24px;
        letter-spacing: 1px;
    }

    table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0 10px;
    }

    th, td {
        padding: 12px 15px;
        text-align: left;
    }

    th {
        background-color: #66bb6a; /* Darker green shade */
        color: white;
        font-weight: 600;
        border-top-left-radius: 1px;
        border-top-right-radius: 1px;
    }

    tr {
        background-color: #ffffff;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        border-radius: 10px;
    }

    tr:hover {
        background-color: #e8f5e9; /* Slightly darker hover color */
    }

    td {
        border-bottom: 1px solid #b2dfdb; /* Lightened grey for borders */
    }

    input[type="text"],
    input[type="email"],
    textarea {
        width: 100%;
        padding: 8px 10px;
        border-radius: 6px;
        border: 1px solid #c8e6c9;
        background-color: #f1f8e9; /* Darker background for input fields */
        font-size: 14px;
    }

    textarea {
        resize: vertical;
    }

 input[readonly],
textarea[readonly] {
    background-color: #eeeeee;
    color: #616161;
    pointer-events: none;
    user-select: none;
    caret-color: transparent;
}


    button {
        background: linear-gradient(to right, #66bb6a, #388e3c); /* Darker gradient */
        color: white;
        padding: 8px 14px;
        font-size: 14px;
        font-weight: bold;
        border: none;
        border-radius: 6px;
        margin: 2px;
        cursor: pointer;
        box-shadow: 0 2px 4px rgba(0, 100, 0, 0.2);
    }

    button:hover {
        background: linear-gradient(to right, #43a047, #1b5e20); /* Darker hover gradient */
        transform: scale(1.05);
    }

    .add-faq-button {
        display: block;
        margin: 0 auto 20px;
        padding: 10px 20px;
        background: linear-gradient(to right, #4caf50, #388e3c); /* Darker gradient */
        color: white;
        font-weight: bold;
        font-size: 16px;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        box-shadow: 0 4px 12px rgba(0, 100, 0, 0.3);
    }

    .add-faq-button:hover {
        background: linear-gradient(to right, #2e7d32, #1b5e20); /* Darker hover gradient */
        transform: translateY(-2px);
    }
    
    .content-wrapper {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
            padding: 40px 0;
        }
</style>
</head>

<script>
    function enableEdit(rowId) {
        const row = document.getElementById("row-" + rowId);
        const inputs = row.querySelectorAll("input, textarea");

        inputs.forEach(input => {
            if (input.name !== "faq_id") {
                input.removeAttribute("readonly");
                input.removeAttribute("disabled");
            }
        });

        row.querySelector(".edit-btn").style.display = "none";
        row.querySelector(".save-btn").style.display = "inline-block";
    }
</script>

<body>
<%@ include file="header.jsp" %>
<main style="flex: 1; display: flex; align-items: center; justify-content: center; padding: 20px;">
<div class="content-wrapper">
<div class="box">
    <h2>Submitted FAQs</h2>
    <form action="faqForm.jsp" method="get" style="margin-bottom: 20px;">
    <button type="submit" class="add-faq-button">Add New FAQ</button>
</form>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>NIC</th>
            <th>Question</th>
            <th>Date</th>
            <th>Actions</th>
        </tr>

        <%
            try {
                Connection con = DBConnection.getConnection();
                Statement stmt = con.createStatement();
                String sql = "SELECT * FROM faq";
                ResultSet rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    int id = rs.getInt("faq_id");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String phone = rs.getString("phonenumber");
                    String nic = rs.getString("nic");
                    String question = rs.getString("question");
                    Timestamp date = rs.getTimestamp("date");
        %>
        <tr id="row-<%= id %>">
            <form action="FaqCRUDServlet" method="post">
                <td><%= id %></td>
                <td><input type="text" name="name" value="<%= name %>" readonly /></td>
                <td><input type="email" name="email" value="<%= email %>" readonly /></td>
                <td><input type="text" name="phonenumber" value="<%= phone %>" readonly /></td>
                <td><input type="text" name="nic" value="<%= nic %>" readonly /></td>
                <td><textarea name="question" readonly><%= question %></textarea></td>
                <td><%= date.toLocalDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) %></td>
                <td>
                    <input type="hidden" name="faq_id" value="<%= id %>"/>
                    <button type="button" class="edit-btn" onclick="enableEdit('<%= id %>')">Edit</button>
                    <button type="submit" name="action" value="save" class="save-btn" style="display:none;">Save</button>
                    <button type="submit" name="action" value="delete" onclick="return confirm('Are you sure to delete?')">Delete</button>
                </td>
            </form>
        </tr>
        <%
                }
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='8'>Error loading FAQs: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>
</div>
</div>
</main>
<%@ include file="footer.jsp" %>
</body>
</html>
