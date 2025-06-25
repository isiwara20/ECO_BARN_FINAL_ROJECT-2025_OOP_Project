<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <!-- IT23600652 Isiwara Wijesinghe -->   
    
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eco-Barn | Admin Dashboard </title>
  <link rel="icon" type="image/x-icon" href="img/logoblack.png">

    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <!-- Custom Styles -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    
   <style>
/* Base Theme - Strong, Responsive-Friendly Colors */
:root {
    --background: #edf1f5;
    --primary: #1b5e20;
    --accent: #388e3c;
    --text: #0d1117;
    --sidebar-bg: #ffffff;
    --sidebar-border: #cbd5e1;
    --button-bg: #dcedc8;
    --button-hover: #c5e1a5;
    --form-bg: #ffffff;
    --card-shadow: rgba(0, 0, 0, 0.12);
    --border-radius: 6px;
}

body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, sans-serif;
    background-color: white;
    color: var(--text);
}

.dashboard {
	
    display: flex;
    min-height: 100vh;
    overflow: hidden;
    flex-direction: row;
}

.sidebar {
    width: 290px;
    background: black;
    border-right: 4px solid green;
    display: flex;
    flex-direction: column;
    padding: 20px;
    box-shadow: 3px 0 8px var(--card-shadow);
    flex-shrink: 0;
}

.admin_info_sidebar {
    text-align: center;
    margin-bottom: 30px;
}

.admin_info_sidebar img {
    width: 90px;
    height: 90px;
    border-radius: 50%;
    border: 3px solid var(--primary);
    margin-bottom: 12px;
}

.admin_info_sidebar h3 {
    font-size: 18px;
    margin: 6px 0;
    font-weight: 600;
    color: yellow;
}

.admin_info_sidebar p {
    font-size: 13px;
    color: white;
    margin: 4px 0;
}

.sidebar button {
    background-color: linear-gradient(10deg, #1b5e20, #388e3c);
    border: none;
    color: var(--text);
    font-weight: 600;
    margin: 8px 0;
    padding: 12px 16px;
    border-radius: var(--border-radius);
    cursor: pointer;
    
    text-align: left;
}

.sidebar button:hover {
    background-color: var(--button-hover);
    color: var(--primary);
    transform: translateX(3px);
}

.main-content {
    flex-grow: 1;
    padding: 30px;
    overflow-y: auto;
    background-color: white;
}

.form-section {
    display: none;
    background-color:white;
    padding: 30px 35px;
    border-radius: var(--border-radius);
    max-width: 1000px;
    margin: auto;
}

.form-section.active {
    display: block;
}

form input,
form button,
form textarea {
    width: 100%;
    padding: 12px 16px;
    margin-bottom: 18px;
    border: 1px solid #aaa;
    border-radius: var(--border-radius);
    font-size: 15px;
    transition: border-color 0.2s ease;
}

form input:focus,
form textarea:focus {
    outline: none;
    border-color: var(--accent);
}

form button[type="submit"] {
    background-color: var(--primary);
    color: #fff;
    font-weight: 600;
    border: none;
    cursor: pointer;
    transition: background-color 0.2s ease;
}

form button[type="submit"]:hover {
    background-color: #145a1d;
}

h3 {
    text-align: center;
    color: var(--primary);
    margin-bottom: 25px;
    font-size: 22px;
    font-weight: 700;
}

canvas {
    display: block;
    margin: auto;
    max-width: 720px;
}

.sidebar button.active {
    background-color: var(--accent);
    color: #fff;
    font-weight: bold;
}

/* ---------------- RESPONSIVE ---------------- */

@media (max-width: 992px) {
    .dashboard {
        flex-direction: column;
    }

    .sidebar {
        width: 100%;
        flex-direction: row;
        overflow-x: auto;
        padding: 10px;
        justify-content: space-around;
        border-right: none;
        border-bottom: 1px solid var(--sidebar-border);
    }

    .admin_info_sidebar {
        display: none;
    }

    .sidebar button {
        flex: 1;
        padding: 10px;
        font-size: 14px;
        white-space: nowrap;
    }

    .main-content {
        padding: 20px;
    }

    .form-section {
        padding: 20px;
        max-width: 100%;
    }
}

@media (max-width: 576px) {
    .sidebar {
        flex-wrap: wrap;
    }

    .sidebar button {
        flex: 1 1 45%;
        margin: 5px;
        font-size: 13px;
    }

    form input,
    form textarea {
        font-size: 14px;
    }

    h3 {
        font-size: 18px;
    }
}


/* Main Chart Section */
#chartSection {
    background-color: white;
    padding: 25px;
    border-radius: 8px;
}

/* Container for stats and chart */
.stats-chart-container {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    gap: 20px;
}

/* Stats Section */
.stats-section {
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 20px;
}

/* Stats Grid */
.stats-grid {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.stat-card {
    background-color: #ffffff;
    border-radius: 8px;
    padding: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    text-align: center;
    transition: transform 0.3s ease-in-out;
    border: 1px solid #ececec;
}



.stat-card h4 {
    font-size: 16px;
    font-weight: 500;
    color: #555;
    margin-bottom: 10px;
}

.stat-card p {
    font-size: 24px;
    font-weight: 600;
    color: #2c3e50;
}

/* Icon Style */
.stat-icon {
    font-size: 30px;
    color: #4caf50;
    margin-bottom: 15px;
    display: block;
    margin-left: auto;
    margin-right: auto;
}

/* Chart Section */
.chart-section {
    flex: 1.5;
    min-width: 400px;
    text-align: center;
}

#adminPieChart {
    width: 100%;
    height: 250px; /* Smaller Pie Chart */
    max-width: 300px;
    margin: 0 auto;
    display: block;
}

/* Mobile Responsiveness */
@media (max-width: 768px) {
    .stats-chart-container {
        flex-direction: column;
    }

    .stats-section {
        margin-bottom: 30px;
    }

    .chart-section {
        width: 100%;
    }

    .stat-card {
        font-size: 14px;
    }

    #adminPieChart {
        height: 200px;
    }
}







.modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 9999;
}

.modal-box {
    background-color: #fff;
    padding: 20px 30px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    text-align: center;
    max-width: 400px;
    width: 90%;
}

.modal-buttons {
    margin-top: 20px;
    display: flex;
    justify-content: space-around;
}

.modal-buttons button {
    padding: 8px 16px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.modal-buttons button:first-child {
    background-color: #e74c3c;
    color: #fff;
}

.modal-buttons button:last-child {
    background-color: #bdc3c7;
    color: #000;
}


.custom-msg-modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(30, 30, 30, 0.75);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 10000;
    animation: fadeIn 0.3s ease-in-out;
}

.custom-msg-modal-box {
    background: #ffffff;
    padding: 25px 35px;
    border-radius: 12px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
    max-width: 450px;
    width: 90%;
    text-align: center;
}

.custom-msg-text {
    font-size: 16px;
    color: #333;
    margin-bottom: 20px;
    line-height: 1.5;
}

.custom-msg-buttons {
    display: flex;
    justify-content: center;
}

.custom-msg-close-btn {
    padding: 10px 24px;
    background-color: #3498db;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.2s ease;
}

.custom-msg-close-btn:hover {
    background-color: #2980b9;
}

@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}


.user-delete-modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(30, 30, 30, 0.75);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 10001;
    animation: fadeIn 0.3s ease-in-out;
}

.user-delete-modal-box {
    background: #ffffff;
    padding: 25px 35px;
    border-radius: 10px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.25);
    max-width: 450px;
    width: 90%;
    text-align: center;
}

.user-delete-text {
    font-size: 16px;
    color: #2c3e50;
    margin-bottom: 20px;
    line-height: 1.6;
}

.user-delete-buttons {
    display: flex;
    justify-content: center;
}

.user-delete-close-btn {
    padding: 10px 20px;
    background-color: #e74c3c;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.2s ease;
}

.user-delete-close-btn:hover {
    background-color: #c0392b;
}


.phone-update-msg-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(30, 30, 30, 0.75);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 10001;
    animation: fadeIn 0.3s ease-in-out;
}

.phone-update-msg-box {
    background: #ffffff;
    padding: 25px 35px;
    border-radius: 10px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.25);
    max-width: 450px;
    width: 90%;
    text-align: center;
}

.phone-update-msg-text {
    font-size: 16px;
    color: #2c3e50;
    margin-bottom: 20px;
    line-height: 1.6;
}

.phone-update-msg-buttons {
    display: flex;
    justify-content: center;
}

.phone-update-msg-close-btn {
    padding: 10px 20px;
    background-color: #3498db;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.2s ease;
}

.phone-update-msg-close-btn:hover {
    background-color: #2980b9;
}




.ticket-update-msg-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(30, 30, 30, 0.75);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 10001;
    animation: fadeIn 0.3s ease-in-out;
}

.ticket-update-msg-box {
    background: #ffffff;
    padding: 25px 35px;
    border-radius: 10px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.25);
    max-width: 450px;
    width: 90%;
    text-align: center;
}

.ticket-update-msg-text {
    font-size: 16px;
    color: #2c3e50;
    margin-bottom: 20px;
    line-height: 1.6;
}

.ticket-update-msg-buttons {
    display: flex;
    justify-content: center;
}

.ticket-update-msg-close-btn {
    padding: 10px 20px;
    background-color: #3498db;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.2s ease;
}

.ticket-update-msg-close-btn:hover {
    background-color: #2980b9;
}



.ticket-form-section {
    display: none;
    background-color: white;
    padding: 20px 25px;
    border-radius: 10px;
    max-width: 1000px;
    margin: auto;
}

.ticket-form-section.active {
    display: block;
}

.ticket-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    background-color: white;
    justify-content: flex-start;
}

.ticket-card {
    flex: 0 0 calc(35% - 35px); /* Fixed width for 4 items per row */
    max-width: calc(35% - 35px); 
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 20px;
    background-color: #f9f9f9;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
     overflow-wrap: break-word; /* Ensures long words wrap */
    word-wrap: break-word;      /* Fallback for older browsers */
    word-break: break-word;     /* Force breaks on long strings */
}

.concern-text {
    color: red;
    font-weight: bold;
    color: red;
    font-weight: bold;
    display: block;
    white-space: pre-wrap; /* Keeps line breaks and wraps long lines */
}

.reply-form {
    margin-top: 15px;
}

.reply-textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #bbb;
    border-radius: 5px;
    resize: vertical;
}

.reply-button {
    margin-top: 10px;
    padding: 10px 20px;
    background-color: #007BFF;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.reply-button:hover {
    background-color: #0056b3;
}

.no-ticket-msg {
    color: red;
    text-align: center;
    font-weight: bold;
    margin-top: 20px;
}



select[name="productType"] {
    width: 100%;
    padding: 12px 15px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 8px;
    background-color: #fff;
    font-size: 16px;
    appearance: none; /* Remove default arrow for better custom styling */
    background-image: url('data:image/svg+xml;utf8,<svg fill="gray" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/></svg>');
    background-repeat: no-repeat;
    background-position: right 10px center;
    background-size: 16px;
    cursor: pointer;
    transition: border-color 0.3s ease;
}

select[name="productType"]:focus {
    border-color: #4CAF50;
    outline: none;
}




.product-msg-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(30, 30, 30, 0.75);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 10001;
    animation: fadeIn 0.3s ease-in-out;
}

.product-msg-box {
    background: #ffffff;
    padding: 25px 35px;
    border-radius: 10px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.25);
    max-width: 450px;
    width: 90%;
    text-align: center;
}

.product-msg-text {
    font-size: 16px;
    color: #2c3e50;
    margin-bottom: 20px;
    line-height: 1.6;
}

.product-msg-buttons {
    display: flex;
    justify-content: center;
}

.product-msg-close-btn {
    padding: 10px 20px;
    background-color: #3498db;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.2s ease;
}

.product-msg-close-btn:hover {
    background-color: #2980b9;
}



.order-update-form {
    max-width: 100%;
    margin: auto;
    padding: 20px;
}

.order-update-form input[type="text"],
.order-update-form select {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.order-update-form button {
    width: 100%;
    padding: 12px;
    background-color: #28a745;
    color: white;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.order-update-form button:hover {
    background-color: #218838;
}





.order-update-msg-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(30, 30, 30, 0.75);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 10001;
    animation: fadeIn 0.3s ease-in-out;
}

.order-update-msg-box {
    background: #ffffff;
    padding: 25px 35px;
    border-radius: 10px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.25);
    max-width: 450px;
    width: 90%;
    text-align: center;
}

.order-update-msg-text {
    font-size: 16px;
    color: #2c3e50;
    margin-bottom: 20px;
    line-height: 1.6;
}

.order-update-msg-buttons {
    display: flex;
    justify-content: center;
}

.order-update-msg-close-btn {
    padding: 10px 20px;
    background-color: #3498db;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.2s ease;
}

.order-update-msg-close-btn:hover {
    background-color: #2980b9;
}


    </style>
    <script>
    function showDeleteConfirmation() {
        const username = document.getElementById('usernameInput').value.trim();
        if (username === "") {
            alert("Please enter a username to delete.");
            return;
        }
        document.getElementById("confirmText").textContent = "Are you sure you want to delete the user: " + username;
        document.getElementById("confirmModal").style.display = "flex";
    }

    function hideDeleteConfirmation() {
        document.getElementById("confirmModal").style.display = "none";
    }

    function submitDeleteForm() {
        document.getElementById("deleteForm").submit();
    }
    
    
    function showUpdateConfirmation() {
        var username = document.getElementById('username').value.trim();
        var oldPhone = document.getElementById('oldPhone').value.trim();
        var newPhone = document.getElementById('newPhone').value.trim();

        if (username === "") {
            alert("Please enter a username to update.");
            return;
        }

        document.getElementById("updateConfirmText").textContent = "Are you sure you want to update " + username + "'s phone from " + oldPhone + " to " + newPhone + "?";
        document.getElementById("updateConfirmModal").style.display = "flex";
    }

    function hideUpdateConfirmation() {
        document.getElementById("updateConfirmModal").style.display = "none";
    }

    function submitUpdateForm() {
        // Submit the form after confirmation
        document.getElementById("changePhoneForm").submit();
    }


    </script>
</head>
<body>



<%@ include file="header.jsp" %>



<div class="dashboard" style="background-color:white;">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="admin_info_sidebar">
       
                   
       
            <img src=" ${adminlogindetails.getImage()}" alt="Admin Image">
            <h3>${adminlogindetails.fname}</h3>
            <p>Username : @${adminlogindetails.username}</p>
            <p>Email : ${adminlogindetails.email}</p>
            
            
        </div>
        
<!-- Menu buttons -->
      
    <button onclick="showSection('chartSection')">
        <i class="fas fa-chart-pie"></i> Dashboard
    </button>
    <button onclick="showSection('addAdmin')">
        <i class="fas fa-user-plus"></i> Add Admin
    </button>
    <button onclick="showSection('deleteAccount')">
        <i class="fas fa-trash-alt"></i> Delete Account
    </button>
    <button onclick="showSection('changePhone')">
        <i class="fas fa-phone-alt"></i> Change Phone
        
        
        
    </button>
    
    
    
       <button onclick="showSection('orderupdate')">
    <i class="fas fa-sync-alt"></i> Update Order Status
</button>
    <button onclick="showSection('addProduct')">
        <i class="fas fa-cart-plus"></i> Add Product
    </button>
    
    
    
    <button onclick="showSection('ticket-form-section')">
    <i class="fas fa-reply"></i> Respond Tickets
</button>
    
    
    
    
    

    </div>

    <!-- Main content -->
    <div class="main-content">
        <!-- Chart Section -->
       <!-- Chart Section -->
<div id="chartSection" class="form-section active">
    <div class="stats-chart-container">
        <!-- Stats Grid on the Left Side -->
        <!-- Stats Section -->
<div class="stats-section">
    <div class="stats-grid">
        <div class="stat-card">
            <i class="fas fa-box-open stat-icon"></i>
            <h4>Total Products</h4>
            <p id="totalProducts">${productCount}</p>
        </div>
        <div class="stat-card">
            <i class="fas fa-calendar-day stat-icon"></i>
            <h4>Orders Today</h4>
            <p id="ordersToday">${ordersToday}</p>
        </div>
  <div class="stat-card">
    <i class="fas fa-coins stat-icon"></i>
    <h4>Total Income Today</h4>
    <p id="totalIncomeToday">LKR ${income}</p>
</div>
    </div>
</div>


        <!-- Chart Section on the Right Side -->
        <div class="chart-section">
            <h3 style="font-size: 19px; text-align: center;">User Role Distribution</h3>
            <canvas id="adminPieChart"></canvas>
        </div>
    </div>
</div>



        <!-- Add Admin -->
        <div id="addAdmin" class="form-section">
            <h3 style="font-size:19px;">Add New Administrators</h3>
            <form action="AddAdminServlet" method="post" enctype="multipart/form-data">
                <input type="text" name="fname" placeholder="First Name" required>
                <input type="text" name="lname" placeholder="Last Name" required>
                <input type="email" name="email" placeholder="Email" required>
                <input type="tel" name="phone" placeholder="Phone Number" pattern="[0-9]{10}" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="file" name="profile_pic_admin" accept="image/*" required>
                <button type="submit">Add Admin</button>
                

   </form>
        </div>
        
        
<%
    String admininsertmsgs = (String) request.getAttribute("admininsertmsgs");
    if (admininsertmsgs != null) {
%>
    <div class="custom-msg-modal-overlay">
        <div class="custom-msg-modal-box">
            <p class="custom-msg-text"><%= admininsertmsgs %></p>
            <div class="custom-msg-buttons">
<button class="custom-msg-close-btn" onclick="
    this.closest('.custom-msg-modal-overlay').style.display='none';
    showSection('addAdmin');
    const buttons = document.querySelectorAll('.sidebar button');
    buttons.forEach(btn => btn.classList.remove('active'));
    buttons.forEach(btn => {
        if (btn.textContent.trim().includes('Add Admin')) {
            btn.classList.add('active');
        }
    });
">OK</button>
            </div>
        </div>
    </div>
<% } %>

        <!-- Delete Account -->
        <div id="deleteAccount" class="form-section">
    <h3 style="font-size:19px;">Delete User Accounts</h3>
    <form id="deleteForm" action="DeleteAccountServlet" method="post">
        <input type="text" id="usernameInput" name="usernamedelete" placeholder="Enter Username" required>
        <button type="button" onclick="showDeleteConfirmation()">Delete</button>

        
    </form>
</div>

<%
    String userdeletemessage = (String) request.getAttribute("userdeletemessage");
    if (userdeletemessage != null) {
%>
    <div class="user-delete-modal-overlay">
        <div class="user-delete-modal-box">
            <p class="user-delete-text"><%= userdeletemessage %></p>
            <div class="user-delete-buttons">
<button class="user-delete-close-btn" onclick="
    this.closest('.user-delete-modal-overlay').style.display='none';
    showSection('deleteAccount');
    const buttons = document.querySelectorAll('.sidebar button');
    buttons.forEach(btn => btn.classList.remove('active'));
    buttons.forEach(btn => {
        if (btn.textContent.trim().includes('Delete Account')) {
            btn.classList.add('active');
        }
    });
">OK</button>
            </div>
        </div>
    </div>
<% } %>


<div id="confirmModal" class="modal-overlay" style="display:none;">
    <div class="modal-box">
        <p id="confirmText">Are you sure you want to delete this user?</p>
        <div class="modal-buttons">
            <button onclick="submitDeleteForm()">Yes, Delete</button>
            <button onclick="hideDeleteConfirmation()">Cancel</button>
        </div>
    </div>
</div>



   <!-- Change Phone -->
<div id="changePhoneSection" class="form-section">
    <h3 style="font-size:19px;">Update User Phones</h3>
    <form id="changePhoneForm" action="ChangePhoneServlet" method="post">
        <input type="text" name="usernamephone" id="username" placeholder="Username" required>
        <input type="tel" name="old_phone" id="oldPhone" placeholder="Old Phone" pattern="[0-9]{10}" required>
        <input type="tel" name="new_phone" id="newPhone" placeholder="New Phone" pattern="[0-9]{10}" required>
        <button type="button" class="update-button" onclick="showUpdateConfirmation()">Update</button>
    </form>
</div>

<!-- Confirmation Modal -->
<div id="updateConfirmModal" class="modal-overlay" style="display:none;">
    <div class="modal-box">
        <p id="updateConfirmText">Are you sure you want to update this phone?</p>
        <div class="modal-buttons">
            <button class="confirm-button" onclick="submitUpdateForm()">Yes, Update</button>
            <button class="cancel-button" onclick="hideUpdateConfirmation()">Cancel</button>
        </div>
    </div>
</div>

<%
    String userPhoneUpdateMsg = (String) request.getAttribute("userphoneupdatemessage");
    if (userPhoneUpdateMsg != null) {
%>
    <div class="phone-update-msg-overlay">
        <div class="phone-update-msg-box">
            <p class="phone-update-msg-text"><%= userPhoneUpdateMsg %></p>
            <div class="phone-update-msg-buttons">
                <button class="phone-update-msg-close-btn" onclick="
                    this.closest('.phone-update-msg-overlay').style.display='none';
                    const buttons = document.querySelectorAll('.sidebar button');
                    showSection('changePhoneSection')
                    buttons.forEach(btn => btn.classList.remove('active'));
                    buttons.forEach(btn => {
                        if (btn.textContent.trim().includes('Change Phone')) {
                            btn.classList.add('active');
                        }
                    });
                ">OK</button>
            </div>
        </div>
    </div>
<%
    }
%>


 
     <div id="orderupdate" class="form-section" >
    <h3>Update Order Status</h3>
    <form action="UpdateOrderStatus" method="post"  class="order-update-form">       
     <input type="text" name="orderIDstatusupdate" placeholder="Order ID" required>

        <select name="statusdelivery" required>
    <option value="">-- Select Order Status --</option>
    <option value="Shipped">Shipped</option>
    <option value="Out for Delivery">Out for Delivery</option>
    <option value="Delivered">Delivered</option>
    <option value="Cancelled">Cancelled</option>
    <option value="Returned">Returned</option>
    <option value="Refunded">Refunded</option>
</select>


      
        <button type="submit">Update Order Status</button>
    </form>
</div>
    
 
 
 
 
<%
    String updateorderMSg = (String) request.getAttribute("updateorderMSg");
    if (updateorderMSg != null) {
%>
    <div class="order-update-msg-overlay">
        <div class="order-update-msg-box">
            <p class="order-update-msg-text"><%= updateorderMSg %></p>
            <div class="order-update-msg-buttons">
                <button class="order-update-msg-close-btn" onclick="
                    this.closest('.order-update-msg-overlay').style.display='none';
                    const buttons = document.querySelectorAll('.sidebar button');
                    showSection('orderupdate')
                    buttons.forEach(btn => btn.classList.remove('active'));
                    buttons.forEach(btn => {
                        if (btn.textContent.trim().includes('Update Order Status')) {
                            btn.classList.add('active');
                        }
                    });
                ">OK</button>
            </div>
        </div>
    </div>
<%
    }
%>
 

     <!-- Add Product -->
<div id="addProduct" class="form-section">
    <h3>Add Product</h3>
    <form action="AddProductServlet" method="post" enctype="multipart/form-data">
        <input type="text" name="productName" placeholder="Product Name" required>

        <select name="productType" required>
            <option value="">-- Select Product Type --</option>
            <option value="Fruits">Fruits</option>
            <option value="Vegetables">Vegetables</option>
            <option value="Root Items">Root Items</option>
            <option value="Nut Items">Nut Items</option>
            <option value="Leafy Items">Leafy Items</option>
        </select>

        <input type="number" name="price" placeholder="Price (LKR)" required>

        <input type="number" name="quantity" placeholder="Quantity in Stock" min="0" required>

        <textarea name="description" placeholder="Product Description" rows="4" required></textarea>

        <input type="file" name="productImage" accept="image/*" required>

        <button type="submit">Add Product</button>
    </form>
</div>

        
        
             
<%
    String productmsg = (String) request.getAttribute("productmessage");
    if (productmsg != null) {
%>
    <div class="product-msg-modal-overlay">
    <div class="product-msg-overlay">
    <div class="product-msg-box">
        <p class="product-msg-text"><%= productmsg %></p>
        <div class="product-msg-buttons">
            <button class="product-msg-close-btn" onclick="
                this.closest('.product-msg-overlay').style.display='none';
                showSection('addProduct');
                const buttons = document.querySelectorAll('.sidebar button');
                buttons.forEach(btn => btn.classList.remove('active'));
                buttons.forEach(btn => {
                    if (btn.textContent.trim().includes('Add Product')) {
                        btn.classList.add('active');
                    }
                });
            ">OK</button>
        </div>
    </div>
</div>

           
<% } %>
        
        
    </div>
    
    
    
    
    
    
   
    
    
<%@ page import="java.util.LinkedList" %>
<%@ page import="com.ecobarn.model.Contact" %>
<%
    LinkedList<Contact> tickets = (LinkedList<Contact>) request.getAttribute("allticketinfo");
%>

<div class="form-section ticket-form-section" id="ticket-form-section" >
    <% if (tickets != null && !tickets.isEmpty()) { %>
        <div class="ticket-container">
            <% for (Contact ticket : tickets) { %>
                <div class="ticket-card">
                    <h3 style="font-size:18px;">Ticket ID: <%= ticket.getTicketID() %></h3>
                    <p style="font-size:14px; padding:3px;"><strong>Username:</strong> <%= ticket.getUsername() %></p>
                    <p style="font-size:14px; padding:3px;"><strong>Name:</strong> <%= ticket.getName() %></p>
                    <p style="font-size:14px; padding:3px;"><strong>Email:</strong> <%= ticket.getEmail() %></p>
                    <p style="font-size:14px; padding:3px;"><strong>Phone:</strong> <%= ticket.getPhone() %></p>
                    <p style="font-size:14px; padding:3px;"><strong>Concern:</strong> <span class="concern-text"><%= ticket.getConcern() %></span></p>
                    
                    <form action="ReplyTicketServlet" method="post" class="reply-form">
                        <input type="hidden" name="ticketID" value="<%= ticket.getTicketID() %>">
                        <textarea name="respondReply" placeholder="Type your reply..." rows="4" class="reply-textarea"></textarea>
                        <button type="submit" class="reply-button">Submit Reply</button>
                    </form>
                </div>
            <% } %>
        </div>
    <% } else { %>
     <div class="ticket-container" style="background-color:white;">
        <p class="no-ticket-msg">NO TICKETS UP TO NOW</p>
        </div>
    <% } %>
</div>


    
    
   
    
    
    
    </div>
    
    
<%
    String respondreplymsg = (String) request.getAttribute("respondMessage");
    if (respondreplymsg != null) {
%>
    <div class="ticket-update-msg-overlay">
        <div class="ticket-update-msg-box">
            <p class="ticket-update-msg-text"><%= respondreplymsg %></p>
            <div class="ticket-update-msg-buttons">
                <button class="ticket-update-msg-close-btn" onclick="
                    this.closest('.ticket-update-msg-overlay').style.display='none';
                    const buttons = document.querySelectorAll('.sidebar button');
                    showSection('ticket-form-section')
                    buttons.forEach(btn => btn.classList.remove('active'));
                    buttons.forEach(btn => {
                        if (btn.textContent.trim().includes('Respond Tickets')) {
                            btn.classList.add('active');
                        }
                    });
                ">OK</button>
            </div>
        </div>
    </div>
<%
    }
%>





</div>

<script>



    function showSection(sectionId) {
        const sections = document.querySelectorAll('.form-section');
        sections.forEach(section => section.classList.remove('active'));
        document.getElementById(sectionId).classList.add('active');
    }

    
    
    /*
     * Pie Chart Initialization Using Chart.js
     *       
     * This function is executed on window load and initializes a pie chart
     * to visually represent the distribution of user types (e.g., customers and administrators).
     * It uses the Chart.js library to create a pie chart with dynamic data provided
     * via `${usercount}` and `${admincount}` template variables (likely from a server-side language like JSP).
     *
     * Features:
     * - Automatically renders a pie chart inside a canvas element with ID `adminPieChart`.
     * - Uses `type: 'pie'` to define the chart format.
     * - Customizes chart appearance including background colors, legend placement, and title visibility.
     * - Data is dynamically injected and rendered without the need for additional user interaction.
     * 
    
    
     * External References:
     * - Chart.js Official Site: https://www.chartjs.org/
     * - Pie Chart Docs: https://www.chartjs.org/docs/latest/charts/pie.html
     * - Configuration Options: https://www.chartjs.org/docs/latest/configuration/
     * - Canvas Element (MDN): https://developer.mozilla.org/en-US/docs/Web/HTML/Element/canvas
     * - GitHub Repository: https://github.com/chartjs/Chart.js 
     
  */
    
    
    // Show pie chart on load
    window.onload = function () {
        const ctx = document.getElementById('adminPieChart').getContext('2d');
        new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ['Customers', 'Administrators'],
                datasets: [{
                    label: 'User Distribution',
                    data: [${usercount}, ${admincount}], // Replace with dynamic values if needed
                    backgroundColor: ['#3949ab', '#d32f2f']                }]
            },
            options: {
                plugins: {
                    legend: {
                        position: 'bottom'
                    },
                    title: {
                        display: false
                    }
                }
            }
        });
    };
    
    
    
    document.addEventListener("DOMContentLoaded", () => {
        const buttons = document.querySelectorAll('.sidebar button');
        const sections = document.querySelectorAll('.form-section');

        buttons.forEach((button, index) => {
            button.addEventListener('click', () => {
                // Remove 'active' from all buttons
                buttons.forEach(btn => btn.classList.remove('active'));
                // Add 'active' to the clicked button
                button.classList.add('active');

                // Hide all sections
                sections.forEach(sec => sec.classList.remove('active'));
                // Show corresponding section (if using same index)
                if (sections[index]) {
                    sections[index].classList.add('active');
                }
            });
        });

        // Set default active button and section
        if (buttons[0]) buttons[0].classList.add('active');
        if (sections[0]) sections[0].classList.add('active');
    });

    setTimeout(function()
            {
                document.getElementById("messages").innerHTML = "";
            },3000);
</script>
<%@ include file="footer.jsp" %>


</body>
</html>