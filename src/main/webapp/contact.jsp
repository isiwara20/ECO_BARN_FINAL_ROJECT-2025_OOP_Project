 <!-- IT23600584 Indievarie H. C -->   


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Eco-Barn | Contact Us</title>
    <link rel="icon" type="image/x-icon" href="img/logoblack.png">
  
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: url('img/ava.jpg') no-repeat center center fixed;
      background-size: cover;
    }

    .container {
      max-width: 1200px;
      margin: auto;
      padding: 40px 20px;
      color: #333;
    }

    h1 {
      text-align: center;
      color: #28a745;
      font-size: 24px;
      margin-bottom: 30px;
    }

    .contact-form, .contact-details {
      background-color: rgba(255, 255, 255, 0.95);
      border-radius: 12px;
      padding: 30px;
      box-shadow: 0 8px 20px rgba(0, 100, 0, 0.3);
    }

    .contact-form {
      max-width: 500px;
      margin: auto;
      margin-bottom: 40px;
    }

    form input, form textarea {
      width: 100%;
      padding: 12px 15px;
      margin-bottom: 20px;
      border: 1px solid #c3e6cb;
      border-radius: 8px;
      font-size: 16px;
      transition: all 0.3s ease;
    }

    form input:focus, form textarea:focus {
      outline: none;
      border-color: #28a745;
      box-shadow: 0 0 5px rgba(40, 167, 69, 0.5);
    }

    form textarea {
      resize: vertical;
      min-height: 120px;
    }

    button[type="submit"] {
      background-color: #28a745;
      color: white;
      border: none;
      padding: 12px 20px;
      font-size: 16px;
      border-radius: 8px;
      cursor: pointer;
      width: 100%;
      transition: background-color 0.3s ease;
    }

    button[type="submit"]:hover {
      background-color: #218838;
    }

    ::placeholder {
      color: #6c757d;
      opacity: 1;
    }

    .contact-info {
      margin-top: 40px;
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 10px;
      text-align: center;
    }

    .contact-info p {
      margin: 0;
      font-size: 16px;
    }

    .map {
      margin-top: 20px;
      display: flex;
      justify-content: center;
    }

    iframe {
      border: 0;
      width: 100%;
      max-width: 600px;
      height: 300px;
      border-radius: 10px;
    }
  </style>
</head>
<body>


<%
    request.setAttribute("currentPage", "contact");
%>
<jsp:include page="header.jsp" />



  <div class="container">
    <h1>Contact Us</h1>

    <div class="contact-form">
      <form action="${pageContext.request.contextPath}/ContactUsServlet" method="post">
        <input type="text" name="name" placeholder="Your Name" required />
        <input type="email" name="email" placeholder="Email" required />
        <input type="text" name="phone" placeholder="Phone (10 digits)" pattern="[0-9]{10}" required />
        <textarea name="concern" placeholder="Write your concern" required></textarea>
        <button type="submit">Raise Ticket</button>
      </form>
    </div>

    <div class="contact-details contact-info">
      <p><strong>Phone:</strong> +94 76 123 4567</p>
      <p><strong>Email:</strong> support@ecobarn.lk</p>
      <p><strong>Address:</strong> No. 123, Kothalawala, Malabe, Sri Lanka</p>

      <div class="map">
        <iframe 
          src="https://www.google.com/maps?q=Kothalawala+Malabe+Sri+Lanka&output=embed" 
          allowfullscreen 
          loading="lazy">
        </iframe>
      </div>
    </div>
  </div>
<jsp:include page="footer.jsp"/>

</body>
</html>
