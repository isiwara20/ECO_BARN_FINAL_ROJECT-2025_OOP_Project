<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ecobarn.model.shipping" %>
 <!-- IT23600652 Isiwara Wijesinghe -->   

<!DOCTYPE html>
<html lang="en">
<head>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eco-Barn | Shipping Details </title>
  <link rel="icon" type="image/x-icon" href="img/logoblack.png">

    
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <!-- Custom Styles -->
    
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
        }
        
        .header {
    background: #3a9838;
    padding: 15px 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}


.logo h1 {
    font-size: 28px;
    font-weight: bold;
    color: white;
}

/* Search Bar */
.search-container {
    flex-grow: 1;
    margin: 0 20px;
}

.search-container input {
    width: 100%;
    padding: 8px 40px 8px 10px;
    font-size: 16px;
    border: none;
    border-radius: 5px;
}

.search-container i {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 18px;
    color: #666;
}

/* Header Icons */
.header-icons {
    display: flex;
    align-items: center;
    gap: 20px;
}

.header-icons i {
    font-size: 22px;
    color: white;
    cursor: pointer;
}
        
        .paycontainer {
            display: flex;
            max-width: 1200px;
            
            margin: auto;
            margin-top:20px;
            margin-bottom:20px;
            
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }
        .form-section {
 flex: 2;
             padding: 30px;
            background-color: #ffffff;
        }
        .summary-section {
            flex: 1;
            padding: 30px;
            background-color: #fafafa;
            border-left: 1px solid #eee;
        }
        h2 {
            font-weight: 600;
            margin-bottom: 20px;
            font-size: 20px;
        }
        .form-group {
    display: block;
    clear: both;  /* Clear any floated elements */
    margin-bottom: 15px;
}

        label {
            font-weight: 500;
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
       input[type="text"],
input[type="tel"],
select {
    display: block;       /* <-- This is the key */
    width: 100%;
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
    font-size: 14px;
    margin-top: 5px;      /* Optional: spacing between label and field */
}
       
     .row-2 {
    display: block; /* Makes each item take up the full width */
}

.row-2 .form-group {
    display: block;  /* Ensures each form group stays on its own line */
    margin-bottom: 15px;
}

        .radio-group {
            display: flex;
            gap: 20px;
            margin-top: 10px;
        }
        .radio-group label {
            display: flex;
            align-items: center;
            gap: 6px;
            font-weight: normal;
        }
        .summary-box {
            background-color: #fff;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.05);
        }
        .summary-box div {
            margin-bottom: 15px;
            font-size: 15px;
        }
        .total {
            color: #e47911;
            font-size: 18px;
            font-weight: bold;
        }
        .btn {
            margin-top: 20px;
            width: 100%;
            background-color: #f57224;
            color: white;
            border: none;
            padding: 12px;
            font-size: 15px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }
        .btn:hover {
            background-color: #e4631a;
        }

        @media (max-width: 900px) {
            .container {
                flex-direction: column;
            }
            .form-section, .summary-section {
                border-left: none;
                padding: 20px;
            }
            .row-2 {
                flex-direction: column;
            }
        }
        
        
        




       .address-list {
    display: flex;
    flex-direction: column;
    gap: 1rem;
}

.address-card {
    border: 1px solid #ddd;
    padding: 15px;
    border-radius: 10px;
    background-color: #f9f9f9;
    transition: 0.3s;
}

.address-card:hover {
    background-color: #f1f1f1;
}

.address-card input[type="radio"] {
    margin-right: 10px;
}

.card-content p {
    margin: 5px 0;
}
        
    </style>
 <script>

////////////////

     const deliveryRates = {
            "Central": 250,
            "Eastern": 260,
            "North Central": 300,
            "Northern": 350,
            "North Western": 280,
            "Sabaragamuwa": 270,
            "Southern": 240,
            "Uva": 290,
            "Western": 200 ///ewplCW 200
        };

        //const itemTotal = 1000;

        function updateDeliveryAndTotal() {
            const selectedProvince = document.getElementById('provinceSelect').value;
            const fee = deliveryRates[selectedProvince] || 0;
            
            var itemtotal 
           

            const itemTotal = parseFloat(document.getElementById('itemTotal').textContent);
            
            const total = itemTotal + fee;
            
            document.getElementById('deliveryFee').textContent = fee;
            document.getElementById('totalAmount').textContent = total;

            document.getElementById('deliveryFeeInput').value = fee;
            document.getElementById('finalAmountInput').value = total;
        }
        
        
        function updateDeliveryAndTotalnew() {
            const selectedProvince = document.getElementById('provinceSelectnew').value;
            const fee = deliveryRates[selectedProvince] || 0;
            
            var itemtotal 
           

            const itemTotal = parseFloat(document.getElementById('itemTotalnew').textContent);
            
            const total = itemTotal + fee;
            
            document.getElementById('deliveryFeenew').textContent = fee;
            document.getElementById('totalAmountnew').textContent = total;

            document.getElementById('deliveryFeeInputnew').value = fee;
            document.getElementById('finalAmountInputnew').value = total;
        }
        
        function updateDeliveryAndTotalexisting(province) {
            const deliveryRates = {
                "Central": 250,
                "Eastern": 260,
                "North Central": 300,
                "Northern": 350,
                "North Western": 280,
                "Sabaragamuwa": 270,
                "Southern": 240,
                "Uva": 290,
                "Western": 200
            };

            const fee = deliveryRates[province] || 0;
            const itemTotal = parseFloat(document.getElementById('itemTotalnew1').textContent);

            const total = itemTotal + fee;

            document.getElementById('deliveryFeenew1').textContent = fee;
            document.getElementById('totalAmountnew1').textContent = total;

            document.getElementById('deliveryFeeInputnew1').value = fee;
            document.getElementById('finalAmountInputnew1').value = total;
        }

        
        
        function handleAddressSelect(radio) {
            const card = radio.closest(".address-card");

            // Remove highlight from all cards
            document.querySelectorAll(".address-card").forEach(c => {
                c.style.borderColor = "#ddd";
                c.style.backgroundColor = "#f9f9f9";
            });

            // Highlight selected card
            card.style.borderColor = "#4CAF50";
            card.style.backgroundColor = "#e8f5e9";

            // Set hidden field values
            document.getElementById("selectedName").value = card.dataset.name;
            document.getElementById("selectedPhone").value = card.dataset.phone;
            document.getElementById("selectedAddress").value = card.dataset.address;

            // Get province from selected card and update delivery
            const province = card.dataset.province;
            updateDeliveryAndTotalexisting(province);
        }


        
        function showNewAddressForm() {
            // Hide the existing saved address section
            
                        var exisiingdetails = document.getElementById('exisiingdetails');

            
            
            var existingForm = document.querySelector('.form-section');
            if (existingForm) {
                existingForm.style.display = 'none';
                exisiingdetails.style.display = 'none';
                
            }

            // Show the new address form
            var newForm = document.getElementById('newAddressForm');
            if (newForm) {
                newForm.style.display = 'block';
            }
        }
        
        
        function showexistingAddressForm()
        {
        	
            var exisiingdetails = document.getElementById('exisiingdetails');

        	   // Hide the existing saved address section
            var existingForm = document.querySelector('.form-section');
            if (existingForm) {
                existingForm.style.display = 'block';
                exisiingdetails.style.display = 'block';

            }

            // Show the new address form
            var newForm = document.getElementById('newAddressForm');
            if (newForm) {
                newForm.style.display = 'none';
            }
        	
        	
        }
        
        
        
        document.addEventListener("DOMContentLoaded", function () {
            const proceedBtn = document.getElementById("proceedBtn");
            const radioButtons = document.querySelectorAll("input[name='selectedAddressId']");

            radioButtons.forEach(radio => {
                radio.addEventListener("change", function () {
                    proceedBtn.disabled = false;
                });
            });
        });
    </script>
</head>

<body>

<jsp:include page="header.jsp"/>


   <div class="paycontainer">
   
   
   
   
    
    <% ArrayList<shipping> details = (ArrayList<shipping>) request.getAttribute("allShippingDetails");
   if (details != null && !details.isEmpty()) {
%>

 <div class="form-section">
 <h2>Select a Shipping Address</h2>
<form action="confirm_shippingServlet" method="post">
    <div class="address-list">
        <% int index = 0; %>
<% for (shipping s : details) { %>
    <div class="address-card" 
         data-name="<%= s.getFullname() %>" 
         data-phone="<%= s.getPhone() %>" 
         data-address="<%= s.getAddress() %>"
         data-province="<%= s.getProvince() %>">
        <label>
            <input type="radio" 
                   name="selectedAddressId" 
                   value="<%= index %>" 
                   onchange="handleAddressSelect(this)">
            <div class="card-content">
                <p><strong>Name:</strong> <%= s.getFullname() %></p>
                <p><strong>Phone:</strong> <%= s.getPhone() %></p>
                <p><strong>Province:</strong> <%= s.getProvince() %></p>
                <p><strong>Full Address:</strong> <%= s.getAddress() %></p>
            </div>
        </label>
    </div>
    <% index++; %>
<% } %>

    </div>
    
    <button type="button" onclick="showNewAddressForm()" class="btn">+ Add New Shipping Address</button>
    <!-- Hidden Inputs -->
<input type="hidden" id="selectedName" name="selectedName">
<input type="hidden" id="selectedPhone" name="selectedPhone">
<input type="hidden" id="selectedAddress" name="selectedAddress">
<input type="hidden" id="deliveryFeeInputnew1" name="deliveryFee">
<input type="hidden" id="finalAmountInputnew1" name="finalAmount">
    

</div>






    <!-- Summary Section -->
         <div class="summary-section" id="exisiingdetails">
    <h2>Order Summary</h2>
    <div class="summary-box">
        <div><strong>Item Total:</strong> Rs. <span id="itemTotalnew1">${TotalAmount}</span></div>
        <div><strong>Delivery Fee:</strong> Rs. <span id="deliveryFeenew1">0</span></div>
        <div class="total">Total to Pay: Rs. <span id="totalAmountnew1">${TotalAmount}</span></div>
    </div>

    <input type="hidden" name="deliveryFee" id="deliveryFeeInput1" value="0">
    <input type="hidden" name="finalAmount" id="finalAmountInput1" value="10">

<button type="submit" class="btn" id="proceedBtn" disabled>Proceed to Pay</button></div>

        </div>
    
 </form>

<% } else { %>


   
     <div class="form-section">
     
            <!-- Form Section -->
          
                <h2>Shipping & Billing</h2>
    <form action="shipping_detailsServlet" method="post">

				
                <div class="form-group">
                
                    <label>Username</label>
<input type="text" name="username" value="${username}" readonly style="background-color: #f9f9f9; border: none; pointer-events: none;">
                </div>

                <div class="form-group">
                
                    <label>Full Name</label>
                    <input type="text" name="fullName" placeholder="Enter your full name" required>
                </div>

                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="tel" name="phone" placeholder="Enter your phone number" required pattern="[0-9]{10}">
                </div>

                <div class="form-group">
                    <label>House No </label>
                    <input type="text" name="street" placeholder="Ex: 1973/A " required>
                </div>

                

                <div class="row-2">
                    <div class="form-group">
                        <label>Province</label>
                      
                      
                      
                      <select name="province" id="provinceSelect"  onchange="updateDeliveryAndTotal()" required>
    <option value="">Select Province</option>
    <option value="Central">Central</option>
    <option value="Eastern">Eastern</option>
    <option value="North Central">North Central</option>
    <option value="Northern">Northern</option>
    <option value="North Western">North Western</option>
    <option value="Sabaragamuwa">Sabaragamuwa</option>
    <option value="Southern">Southern</option>
    <option value="Uva">Uva</option>
    <option value="Western">Western</option>
</select>
                      
                    </div>
                    <div class="form-group">
                        <label>District</label>
                        <select name="district" required>
    <option value="">Select District</option>
    <option value="Ampara">Ampara</option>
    <option value="Anuradhapura">Anuradhapura</option>
    <option value="Badulla">Badulla</option>
    <option value="Batticaloa">Batticaloa</option>
    <option value="Colombo">Colombo</option>
    <option value="Galle">Galle</option>
    <option value="Gampaha">Gampaha</option>
    <option value="Hambantota">Hambantota</option>
    <option value="Jaffna">Jaffna</option>
    <option value="Kalutara">Kalutara</option>
    <option value="Kandy">Kandy</option>
    <option value="Kegalle">Kegalle</option>
    <option value="Kilinochchi">Kilinochchi</option>
    <option value="Kurunegala">Kurunegala</option>
    <option value="Mannar">Mannar</option>
    <option value="Matale">Matale</option>
    <option value="Matara">Matara</option>
    <option value="Monaragala">Monaragala</option>
    <option value="Mullaitivu">Mullaitivu</option>
    <option value="Nuwara Eliya">Nuwara Eliya</option>
    <option value="Polonnaruwa">Polonnaruwa</option>
    <option value="Puttalam">Puttalam</option>
    <option value="Ratnapura">Ratnapura</option>
    <option value="Trincomalee">Trincomalee</option>
    <option value="Vavuniya">Vavuniya</option>
</select>

                    </div>
                </div>

                <div class="row-2">
                    <div class="form-group">
                        <label>City</label>
  
                        
                        
                        <select name="city" required>
    <option value="">Select City</option>
    <option value="Ampara">Ampara</option>
    <option value="Anuradhapura">Anuradhapura</option>
    <option value="Badulla">Badulla</option>
    <option value="Batticaloa">Batticaloa</option>
    <option value="Colombo">Colombo</option>
    <option value="Galle">Galle</option>
    <option value="Gampaha">Gampaha</option>
    <option value="Hambantota">Hambantota</option>
    <option value="Jaffna">Jaffna</option>
    <option value="Kalutara">Kalutara</option>
    <option value="Kandy">Kandy</option>
    <option value="Kegalle">Kegalle</option>
    <option value="Kilinochchi">Kilinochchi</option>
    <option value="Kurunegala">Kurunegala</option>
    <option value="Mannar">Mannar</option>
    <option value="Matale">Matale</option>
    <option value="Matara">Matara</option>
    <option value="Monaragala">Monaragala</option>
    <option value="Mullaitivu">Mullaitivu</option>
    <option value="Nuwara Eliya">Nuwara Eliya</option>
    <option value="Polonnaruwa">Polonnaruwa</option>
    <option value="Puttalam">Puttalam</option>
    <option value="Ratnapura">Ratnapura</option>
    <option value="Trincomalee">Trincomalee</option>
    <option value="Vavuniya">Vavuniya</option>
</select>
                        
                    </div>
                    
                </div>

                <div class="form-group">
                    <label>Full Address</label>
                    <input type="text" name="fullAddress" placeholder="Ex: No 20 , Hill Street, Moratuwa" required>
                </div>
               
            </div>
            
            
            
             <!-- Summary Section -->
         <div class="summary-section">
    <h2>Order Summary</h2>
    <div class="summary-box">
        <div><strong>Item Total:</strong> Rs. <span id="itemTotal">${TotalAmount}</span></div>
        <div><strong>Delivery Fee:</strong> Rs. <span id="deliveryFee">0</span></div>
        <div class="total">Total to Pay: Rs. <span id="totalAmount">${TotalAmount}</span></div>
    </div>

    <input type="hidden" name="deliveryFee" id="deliveryFeeInput" value="0">
    <input type="hidden" name="finalAmount" id="finalAmountInput" value="1000">

    <button type="submit" class="btn">Proceed to Pay</button>
</div>

        </div>
    
 </form>
<%
    }
%>
    


   
  <div id="newAddressForm" style="display: none;">
  
     <div class="paycontainer">
     
          <div class="form-section">
     
            <!-- Form Section -->
          
                <h2>Shipping & Billing</h2>
    <form action="shipping_detailsServlet" method="post">

				
                <div class="form-group">
                
                    <label>Username</label>
<input type="text" name="username" value="${username}" readonly style="background-color: #f9f9f9; border: none; pointer-events: none;">
                </div>

                <div class="form-group">
                
                    <label>Full Name</label>
                    <input type="text" name="fullName" placeholder="Enter your full name" required>
                </div>

                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="tel" name="phone" placeholder="Enter your phone number" required pattern="[0-9]{10}">
                </div>

                <div class="form-group">
                    <label>House No </label>
                    <input type="text" name="street" placeholder="Ex: 1973/A " required>
                </div>

                

                <div class="row-2">
                    <div class="form-group">
                        <label>Province</label>
                      
                      
                      
                      <select name="province" id="provinceSelectnew"  onchange="updateDeliveryAndTotalnew()" required>
    <option value="">Select Province</option>
    <option value="Central">Central</option>
    <option value="Eastern">Eastern</option>
    <option value="North Central">North Central</option>
    <option value="Northern">Northern</option>
    <option value="North Western">North Western</option>
    <option value="Sabaragamuwa">Sabaragamuwa</option>
    <option value="Southern">Southern</option>
    <option value="Uva">Uva</option>
    <option value="Western">Western</option>
</select>
                      
                    </div>
                    <div class="form-group">
                        <label>District</label>
                        <select name="district" required>
    <option value="">Select District</option>
    <option value="Ampara">Ampara</option>
    <option value="Anuradhapura">Anuradhapura</option>
    <option value="Badulla">Badulla</option>
    <option value="Batticaloa">Batticaloa</option>
    <option value="Colombo">Colombo</option>
    <option value="Galle">Galle</option>
    <option value="Gampaha">Gampaha</option>
    <option value="Hambantota">Hambantota</option>
    <option value="Jaffna">Jaffna</option>
    <option value="Kalutara">Kalutara</option>
    <option value="Kandy">Kandy</option>
    <option value="Kegalle">Kegalle</option>
    <option value="Kilinochchi">Kilinochchi</option>
    <option value="Kurunegala">Kurunegala</option>
    <option value="Mannar">Mannar</option>
    <option value="Matale">Matale</option>
    <option value="Matara">Matara</option>
    <option value="Monaragala">Monaragala</option>
    <option value="Mullaitivu">Mullaitivu</option>
    <option value="Nuwara Eliya">Nuwara Eliya</option>
    <option value="Polonnaruwa">Polonnaruwa</option>
    <option value="Puttalam">Puttalam</option>
    <option value="Ratnapura">Ratnapura</option>
    <option value="Trincomalee">Trincomalee</option>
    <option value="Vavuniya">Vavuniya</option>
</select>

                    </div>
                </div>

                <div class="row-2">
                    <div class="form-group">
                        <label>City</label>
  
                        
                        
                        <select name="city" required>
    <option value="">Select City</option>
    <option value="Ampara">Ampara</option>
    <option value="Anuradhapura">Anuradhapura</option>
    <option value="Badulla">Badulla</option>
    <option value="Batticaloa">Batticaloa</option>
    <option value="Colombo">Colombo</option>
    <option value="Galle">Galle</option>
    <option value="Gampaha">Gampaha</option>
    <option value="Hambantota">Hambantota</option>
    <option value="Jaffna">Jaffna</option>
    <option value="Kalutara">Kalutara</option>
    <option value="Kandy">Kandy</option>
    <option value="Kegalle">Kegalle</option>
    <option value="Kilinochchi">Kilinochchi</option>
    <option value="Kurunegala">Kurunegala</option>
    <option value="Mannar">Mannar</option>
    <option value="Matale">Matale</option>
    <option value="Matara">Matara</option>
    <option value="Monaragala">Monaragala</option>
    <option value="Mullaitivu">Mullaitivu</option>
    <option value="Nuwara Eliya">Nuwara Eliya</option>
    <option value="Polonnaruwa">Polonnaruwa</option>
    <option value="Puttalam">Puttalam</option>
    <option value="Ratnapura">Ratnapura</option>
    <option value="Trincomalee">Trincomalee</option>
    <option value="Vavuniya">Vavuniya</option>
</select>
                        
                    </div>
                    
                </div>

                <div class="form-group">
                    <label>Full Address</label>
                    <input type="text" name="fullAddress" placeholder="Ex: No 20 , Hill Street, Moratuwa" required>
                </div>
                 <button type="button" class="btn" onclick="showexistingAddressForm()" class="btn-secondary">← Back to Saved Addresses</button>
               
            </div>
     
     
     

 <!-- Summary Section -->
         <div class="summary-section">
    <h2>Order Summary</h2>
    <div class="summary-box">
        <div><strong>Item Total:</strong> Rs. <span id="itemTotalnew">${TotalAmount}</span></div>
        <div><strong>Delivery Fee:</strong> Rs. <span id="deliveryFeenew">0</span></div>
        <div class="total">Total to Pay: Rs. <span id="totalAmountnew">${TotalAmount}</span></div>
    </div>

    <input type="hidden" name="deliveryFee" id="deliveryFeeInputnew" value="0">
    <input type="hidden" name="finalAmount" id="finalAmountInputnew" value="1000">

    <button type="submit" class="btn">Proceed to Pay</button>
</div>

        </div>
    
 </form>
 
</div>
   
   
   
   
  

<jsp:include page="footer.jsp"/>

    
    
</body>
</html>
    