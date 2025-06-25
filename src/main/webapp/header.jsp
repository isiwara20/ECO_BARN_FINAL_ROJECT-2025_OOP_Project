<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <!-- IT23600652 Isiwara Wijesinghe -->   
 <!-- IT23600584 Indievarie H. C -->   

<%
    String currentPage = (String) request.getAttribute("currentPage");
    if (currentPage == null) {
        currentPage = "";
    }
%>

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eco-Barn | </title>
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
        
        


        /* Reset & Base Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
body {
    font-family: 'Poppins', sans-serif;
    background-color: #f5f7fa;
    color: #333;
    scroll-behavior: smooth;
}

/* Top Bar */
.top-bar {
    background: black;
    color: #fff;
    text-align: center;
    padding: 5px 0;
    font-size: 14px;
    font-weight: 500;
    letter-spacing: 0.5px;
}

/* Header */
.header {
    background: #fff;
    display: flex;
    align-items: center;
    justify-content: space-between;
   
    box-shadow: 0 4px 12px rgba(0,0,0,0.06);
    position: sticky;
    top: 0;
    z-index: 999;
    flex-wrap: wrap;
}

.logo img {
    height: 60px;
}

/* Search */
.search-container {
    display: flex;
    
    align-items: center;
    background: #edf1f5;
    border-radius: 30px;
    
    width: 320px;
    margin: 1px , 30px , 1px , 30px;
    border: 1px solid #d6e4e5;
    transition: 0.3s;
}

.search-container input {
    border: none;
    background: transparent;
    outline: none;
    width: 100%;
    padding: 12px;
    font-size: 15px;
}

.search-container i {
    color: #2e7d32;
    
    font-size: 18px;
}

/* Header Icons */
.header-icons {
    display: flex;
    align-items: center;
    gap: 25px;
}

.header-icons a i {
    font-size: 22px;
    color: #444;
    transition: all 0.3s ease;
}

.header-icons a:hover i {
    color: #2e7d32;
    transform: scale(1.2);
}

/* User Info */
.user-info {
    display: flex;
    align-items: center;
    gap: 8px;
    position: relative;
}

.user-info span {
    font-size: 14px;
    font-weight: 600;
    color: #333;
}

.profile-btn i {
    font-size: 24px;
    cursor: pointer;
    color: #2e7d32;
    transition: 0.3s;
}

.profile-btn i:hover {
    color: #1b5e20;
}

/* Profile Menu */
.profile-menu {
    display: none;
    position: absolute;
    right: 0;
    top: 10px;
    background: white;
    border: 1px solid #e0e0e0;
    border-radius: 12px;
    box-shadow: 0 5px 25px rgba(0,0,0,0.1);
    min-width: 190px;
    z-index: 1000;
}

.profile-menu.visible {
    display: block;
}

.profile-menu ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.profile-menu ul li a {
    display: block;
    padding: 12px 20px;
    color: #333;
    font-size: 14px;
    text-decoration: none;
    transition: background 0.3s;
}

.profile-menu ul li a:hover {
    background-color: #f1f8e9;
    color: #2e7d32;
}

/* Navigation */
.nav-bar {
background: linear-gradient(90deg, #1b5e20, #388e3c);
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    padding: 10px 0;
    gap: 20px;
    font-weight: 600;
    box-shadow: 0 2px 8px rgba(0,0,0,0.04);
}

.nav-bar a {
    color: #fff;
    text-decoration: none;
    padding: 5px 5px;
    border-radius: 30px;
    transition: all 0.3s ease;
    font-size: 13px;
}

.nav-bar a.active,
.nav-bar a:hover {
    background: #fff;
    color: #2e7d32;
    box-shadow: 0 0 8px rgba(0,128,0,0.2);
}

/* Logout Popup */
#logoutOverlay {
    display: none;
    position: fixed;
    top: 0; left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    justify-content: center;
    align-items: center;
    z-index: 9999;
}

.logout-popup {
    background: white;
    padding: 35px 45px;
    border-radius: 14px;
    text-align: center;
    box-shadow: 0 8px 30px rgba(0,0,0,0.25);
    animation: popupFade 0.3s ease;
    width: 90%;
    max-width: 420px;
}

.logout-popup h2 {
    color: #e53935;
    margin-bottom: 15px;
    font-size: 22px;
}

.logout-popup p {
    color: #555;
    margin-bottom: 25px;
    font-size: 16px;
}

.logout-buttons {
    display: flex;
    justify-content: center;
    gap: 20px;
}

.btn-confirm, .btn-cancel {
    padding: 10px 22px;
    border: none;
    border-radius: 30px;
    font-size: 14px;
    cursor: pointer;
    transition: 0.3s;
}

.btn-confirm {
    background-color: #e53935;
    color: white;
}

.btn-confirm:hover {
    background-color: #c62828;
}

.btn-cancel {
    background-color: #2e7d32;
    color: white;
}

.btn-cancel:hover {
    background-color: #1b5e20;
}

/* Animation */
@keyframes popupFade {
    from { opacity: 0; transform: scale(0.9); }
    to { opacity: 1; transform: scale(1); }
}

/* Responsive */
@media (max-width: 768px) {
    .header {
        flex-direction: column;
        align-items: center;
        padding: 15px 20px;
    }

    .search-container {
        width: 90%;
        margin-top: 10px;
    }

    .header-icons {
        margin-top: 10px;
    }

    .nav-bar {
        flex-direction: column;
        gap: 10px;
    }
}

@media (max-width: 480px) {
    .search-container {
        width: 100%;
    }

    .logo img {
        height: 45px;
    }

    .nav-bar a {
        font-size: 14px;
        padding: 8px 16px;
    }
}


.search-container input:focus {
    background-color: #fff;
    border-radius: 30px;
    outline: none;
    box-shadow: 0 0 1px rgba(40, 167, 69, 0.4);
    transition: box-shadow 0.3s ease, background-color 0.3s ease;
}


/* Normal typing state */
.search-container.typing {
    box-shadow: 0 0 12px rgba(40, 167, 69, 0.5); /* Green when typing */
    background-color: #ffffff;
    border: 1px solid #28a745; /* Green border */
}

/* Listening state (when microphone is active) */
.search-container.listening {
    box-shadow: 0 0 12px rgba(255, 0, 0, 0.5); /* Red when listening */
    background-color: #ffffff;
    border: 1px solid #e53935; /* Red border */
}



.signin-btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 8px 16px;
    background-color: #28a745;
    color: #fff;
    border-radius: 25px;
    font-weight: 600;
    font-size: 14px;
    text-decoration: none;
    transition: background-color 0.3s, transform 0.2s;
    box-shadow: 0 4px 10px rgba(0, 128, 0, 0.2);
}

.signin-btn i {
    font-size: 18px;
}

.signin-btn:hover {
    background-color: #1e7e34;
    transform: translateY(-1px);
}


.search-container {
    position: relative;
}

.search-container i {
    color: #28a745;
    font-size: 18px;
    margin-left: 10px;
    cursor: pointer;
}

.mic-btn {
    margin-left: 10px;
    margin-right:35px;
    font-size: 18px;
    color: #555;
    transition: color 0.3s ease;
}

.mic-btn:hover {
    color: #28a745;
}


#confirmation-overlay {
    /* Initially hidden */
    display: none;
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background: rgba(0, 0, 0, 0.6);
    z-index: 9999;
    align-items: center;
    justify-content: center;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  }
  
 
  #confirmation-overlay.active {
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .overlay-box {
    background: #fefefe;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.3);
    text-align: center;
    width: 320px;
    animation: pop-in 0.3s ease-out;
  }

  .overlay-box h3 {
    margin-bottom: 15px;
    color: #333;
    font-size: 20px;
  }

  .overlay-box p {
    margin-bottom: 20px;
    font-size: 16px;
    color: #555;
  }

  .overlay-box button {
    margin: 0 10px;
    padding: 10px 18px;
    font-size: 14px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  .overlay-box button:first-of-type {
    background-color: #4CAF50;
    color: white;
  }

  .overlay-box button:first-of-type:hover {
    background-color: #45a049;
  }

  .overlay-box button:last-of-type {
    background-color: #f44336;
    color: white;
  }

  .overlay-box button:last-of-type:hover {
    background-color: #d32f2f;
  }

  @keyframes pop-in {
    0% { transform: scale(0.9); opacity: 0; }
    100% { transform: scale(1); opacity: 1; }
  }
  
  
  .dropdown {
  position: relative;
  display: inline-block;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.dropdown > a {
  color: white;
  padding: 8px 10px;
  text-decoration: none;
  border: 2px solid #ccc;
  border-radius: 1px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  display: inline-block;
}

.dropdown > a:hover {
  background-color: #e6e6e6;
}



/* LATEST Category Menu Styling */
.cat-menu {
  display: none;
  position: absolute;
  top: 110%;
  left: 0;
  background-color: #fff;
  border: 1px solid #e3e3e3;
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.08);
  width: 174px;
  z-index: 9999;
  font-family: 'Segoe UI', Tahoma, sans-serif;
  font-size: 14px;
  letter-spacing: 0.2px;
}

.cat-menu.visible {
  display: block;
  animation: fadeIn 0.15s ease-in-out;
}

.cat-menu ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

.cat-menu ul li {
  border-bottom: 1px solid #f1f1f1;
}

.cat-menu ul li:last-child {
  border-bottom: none;
}

.cat-menu ul li a {
  display: block;
  padding: 14px 20px;
  color: #222;
  text-decoration: none;
  transition: all 0.2s ease-in-out;
  font-weight: 500;
}

.cat-menu ul li a:hover {
  color: #1a73e8;
}

/* Optional: Smooth fade-in animation */
@keyframes fadeIn {
  from { opacity: 0; transform: translateY(5px); }
  to { opacity: 1; transform: translateY(0); }
}







.footer {
  background: #0f1111;
  color: #e0e0e0;
  padding: 40px 40px 10px;
  font-family: 'Segoe UI', sans-serif;
  font-size: 14px;
}

.footer-row {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 30px;
  max-width: 1300px;
  margin: auto;
}

.footer-col {
  flex: 1;
  min-width: 180px;
  max-width: 200px;
}

.footer-logo {
  height: 90px;
  margin-bottom: 5px;
  filter: brightness(0) invert(1); /* white logo on dark bg */
}

.footer-col h4 {
  font-size: 14px;
  margin-bottom: 10px;
  font-weight: 600;
  color: #ffffff;
  border-bottom: 2px solid #4caf50;
  display: inline-block;
  padding-bottom: 5px;
}

.footer-col p {
  color: #bbb;
  line-height: 1.6;
}

.footer-col ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.footer-col ul li {
  margin-bottom: 10px;
}

.footer-col ul li a {
  color: #ccc;
  text-decoration: none;
  transition: all 0.3s ease;
}

.footer-col ul li a:hover {
  color: #4caf50;
  padding-left: 5px;
}

.about-text {
  font-size: 14px;
  text-align: justify;
  color: #ccc;
}

.social-icons a i {
  color: white !important;
  background: none !important;
  border: none !important;
  padding: 0 !important;
  font-size: 13px;
  transition: transform 0.3s ease, color 0.3s ease;
}

.social-icons a i:hover {
  color: #4caf50;
  transform: scale(1.2);
}
.footer-subscribe-contact {
  padding: 6px 20px;
  background-color: #1c1c1c;
  color: #ccc;
  border-radius: 8px;
  margin-top: 5px;
}

.footer-subscribe-contact h4 {
  font-size: 16px;
  margin-bottom: 12px;
  font-weight: 600;
  color: #ffffff;
  border-bottom: 2px solid #4caf50;
  display: inline-block;
  padding-bottom: 5px;
}

.newsletter-form {
  display: flex;
  flex-direction: column;
  gap: 10px;
  margin-bottom: 20px;
}

.newsletter-form input[type="email"] {
  padding: 10px 12px;
  border-radius: 5px;
  border: none;
  background: white;
  color: black;
  font-size: 14px;
}

.newsletter-form input::placeholder {
  color: #aaa;
}

.newsletter-form button {
  background-color: #4caf50;
  color: white;
  padding: 10px 14px;
  font-size: 14px;
  font-weight: 600;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background 0.3s ease;
}

.newsletter-form button:hover {
  background-color: #43a047;
}

.footer-subscribe-contact p {
  color: #ccc;
  font-size: 12px;
  line-height: 1.6;
  margin: 8px 0;
}

.footer-subscribe-contact p i {
  color: #ffffff;
  margin-right: 8px;
}


.footer-col i {
  margin-right: 8px;
  color: #4caf50;
}

.footer-bottom {
  text-align: center;
  padding-top: 10px;
  margin-top: 10px;
  border-top: 1px solid #333;
  color: #aaa;
  font-size: 12px;
}


.footer-col i,
.social-icons a i {
  color: #ffffff !important;
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
        function selectOption(cardId) {
            const cards = document.querySelectorAll('.option-card');
            cards.forEach(card => card.classList.remove('selected'));
            document.getElementById(cardId).classList.add('selected');
            document.getElementById(cardId + '-input').checked = true;
        }
       
        document.addEventListener("DOMContentLoaded", function() {
            // Profile Menu Toggle
            const profileBtn = document.querySelector('.profile-btn');
            const profileMenu = document.querySelector('.profile-menu');
            if (profileBtn && profileMenu) {
                profileBtn.addEventListener('click', function(e) {
                    e.stopPropagation(); // prevent event bubbling
                    profileMenu.classList.toggle('visible');
                });

                // Close menu if clicked outside
                document.addEventListener('click', function(event) {
                    if (!profileBtn.contains(event.target) && !profileMenu.contains(event.target)) {
                        profileMenu.classList.remove('visible');
                    }
                });
            }

            const logoutBtn = document.getElementById('logoutBtn');
            const logoutOverlay = document.getElementById('logoutOverlay');
            const confirmLogout = document.getElementById('confirmLogout');
            const cancelLogout = document.getElementById('cancelLogout');

            // Always hide overlay when page loads (reset state)
            if (logoutOverlay) {
                logoutOverlay.style.display = 'none';
            }

            if (logoutBtn && logoutOverlay && confirmLogout && cancelLogout) {
                logoutBtn.addEventListener('click', function(e) {
                    e.preventDefault();
                    logoutOverlay.style.display = 'flex';
                });

                cancelLogout.addEventListener('click', function() {
                    logoutOverlay.style.display = 'none';
                });

                confirmLogout.addEventListener('click', function() {
                    window.location.href = 'signout.jsp?confirm=true';
                });
            }
        });

        
        document.addEventListener("DOMContentLoaded", function () {
            const searchInput = document.querySelector(".search-container input");
            const searchContainer = document.querySelector(".search-container");

            if (searchInput && searchContainer) {
                searchInput.addEventListener("input", function () {
                    if (searchInput.value.trim() !== "") {
                        searchContainer.classList.add("typing");
                    } else {
                        searchContainer.classList.remove("typing");
                    }
                });

                searchInput.addEventListener("focus", function () {
                    searchContainer.classList.add("typing");
                });

                searchInput.addEventListener("blur", function () {
                    if (searchInput.value.trim() === "") {
                        searchContainer.classList.remove("typing");
                    }
                });
            }
        });
        
        

     
     //set of keywords that facilaotates navigation
        let keywordMap = {
        	    'home': 'index.jsp',
        	    'homepage': 'index.jsp',
        	    'vegetables': 'ItemDetailsController?category=vegetables&name=Carrots',
        	    'vegetable': 'ItemDetailsController?category=vegetables&name=Carrots',
        	    'fruits': 'ItemDetailsController?category=fruits&name=Apples',
        	    'fruit': 'ItemDetailsController?category=fruits&name=Apples',
        	    'nut': 'ItemDetailsController?category=freshnuts&name=Almonds"><i class="fas fa-seedling',
        	    'nuts': 'ItemDetailsController?category=freshnuts&name=Almonds"><i class="fas fa-seedling',
        	    'freshnut': 'ItemDetailsController?category=freshnuts&name=Almonds"><i class="fas fa-seedling',
        	    'freshnuts': 'ItemDetailsController?category=freshnuts&name=Almonds"><i class="fas fa-seedling',
        	    'Leafy Green': 'ItemDetailsController?category=leafygreen&name=Spinach',
        	    'Root Products': 'ItemDetailsController?category=root&name=Sweet+Potato',
        	    'Root Product': 'ItemDetailsController?category=root&name=Sweet+Potato',

        	};

        	let typingTimer;
        	let pendingURL = "";

        	
        	//to confrim redirect which send for user asked url
        	function confirmRedirect() {
        	    if (pendingURL) {
        	        window.location.href = pendingURL;
        	    }
        	}

        	//cancel redirect
        	function cancelRedirect() {
        	    pendingURL = "";
        	    document.getElementById("confirmation-overlay").style.display = "none";
        	}

        	
        	
        	function delayedKeywordCheck() {
        		
        		
        	    clearTimeout(typingTimer);
        	    typingTimer = setTimeout(() => {
        	        let input = document.getElementById("output").value.trim().toLowerCase();
        	        for (let keyword in keywordMap) {
        	            if (input.includes(keyword)) {
        	                pendingURL = keywordMap[keyword];
        	                showOverlay(keyword);
        	                return;
        	            }
        	        }
        	    }, 1000);
        	    
        	    
        	    
        	   
        	}
        	
        	
        	//when user typed and pressd enter key, they search for his or her search
        	function checkEnter(event) {
        	    if (event.key === "Enter") {
        	        let input = document.getElementById("output").value.trim().toLowerCase();
        	        for (let keyword in keywordMap) {
        	            if (input.includes(keyword)) {
        	                pendingURL = keywordMap[keyword];
        	                showOverlay(keyword);
        	                return;
        	            }
        	        }
        	    }
        	}
        	
        	//to display the reuslt
        	function showOverlay(keyword) {
        	    const overlay = document.getElementById("confirmation-overlay");
        	    const message = document.getElementById("confirm-message");
        	    message.textContent = "Are you sure you want to go to the " + keyword + " page?";
        	    overlay.style.display = "flex";
        	    
        	    speakMessage(keyword);
        	}

        	
        	
        	/**
        	 * This function uses the Web Speech API's SpeechSynthesis interface to read out a confirmation message aloud.
        	 * It is typically triggered after recognizing a voice command to confirm navigation intent to the user.
        	 * 
        	 * Features:
        	 * - Constructs a spoken message informing the user that a page was detected from their input.
        	 * - Creates a `SpeechSynthesisUtterance` object with customizable voice and rate.
        	 * - Plays the spoken message using `speechSynthesis.speak()`.
        	 * 
        	 * Parameters:
        	 *  @param {string} keyword - The keyword that triggered the page detection (not directly spoken but can be used for context).
        	 * 
        	 * Source: Based on the Web Speech API for speech synthesis.
        	 * Reference:
        	 *  - SpeechSynthesis API: https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis
        	 *  - SpeechSynthesisUtterance: https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisUtterance
        	 */
        	 
        	 
        	
        	function speakMessage(keyword) {
        		
        		
        		const message = `Based on your input, we detected what you want. Would you like to proceed to that page?`;
        	    const utterance = new SpeechSynthesisUtterance(message);
        	    
        	    // You can modify properties like voice and rate if necessary
        	    utterance.voice = speechSynthesis.getVoices()[0]; // Choose a voice, e.g., the first available
        	    utterance.rate = 1; // Normal speaking rate (1 is the default)
        	    speechSynthesis.speak(utterance);
        	}

        	
        	function simulateTyping(text) {
        	    let output = document.getElementById("output");
        	    output.value = "";
        	    let i = 0;
        	    function typeChar() {
        	        if (i < text.length) {
        	            output.value += text.charAt(i);
        	            i++;
        	            setTimeout(typeChar, 100); // Adjust speed here
        	        } else {
        	            delayedKeywordCheck(); // Trigger keyword check after simulated typing
        	        }
        	    }
        	    typeChar();
        	}
     
        	
        	
        	/**
        	 * This function initializes and starts speech recognition using the Web Speech API (specifically `webkitSpeechRecognition`).
        	 * It listens to the user's voice input, provides real-time UI feedback, and triggers a simulated typing effect upon recognition.
        	 * 
        	 * Features:
        	 * - Checks for browser compatibility (only works in Chrome).
        	 * - Sets language to English (US) and listens for a single, complete phrase.
        	 * - Visually indicates when the system is listening (`listening` CSS class).
        	 * - Displays status messages in a text input field (`output`).
        	 * - On successful recognition, triggers `simulateTyping()` with the transcribed speech.
        	 * - Handles and displays errors gracefully.
        	 * 
        	 * Source: Based on standard implementations of the Web Speech API.
        	 * Reference:
        		 -Google Chrome's speech recognition.
        	 *  - Web Speech API Docs: https://developer.mozilla.org/en-US/docs/Web/API/Web_Speech_API
        	 *  - Chrome-specific implementation: https://developer.mozilla.org/en-US/docs/Web/API/SpeechRecognition
        	 */
        	 
        	 
        function startRecognition() {
            if (!('webkitSpeechRecognition' in window)) {
                alert('Please use Google Chrome! Your browser does not support Speech Recognition.');
                return;
            }

            const recognition = new webkitSpeechRecognition();
            recognition.lang = 'en-US';
            recognition.interimResults = false;
            recognition.maxAlternatives = 1;
            recognition.continuous = false;

            const searchContainer = document.querySelector(".search-container");
            const output = document.getElementById('output');

            recognition.onstart = function () {
                console.log('Recognition started');
                searchContainer.classList.add('listening');  // Add listening class to turn border red
                output.value = 'Listening to your Requirement...';
            };

            recognition.onspeechstart = function () {
                console.log('Speech has been detected.');
                output.value = 'We Are Recognizing Your speech...';
            };

            recognition.onspeechend = function () {
                console.log('Speech has stopped.');
            };

            recognition.onresult = function (event) {
                const spokenText = event.results[0][0].transcript;
                console.log('Recognized:', spokenText);
                simulateTyping(spokenText); // use animated typing           
                searchContainer.classList.remove('listening');
                
                
                
            };


            recognition.onerror = function (event) {
                console.error('Error occurred:', event.error);
                output.value = '';
                alert('Error occurred: ' + event.error);
                searchContainer.classList.remove('listening'); // Ensure class is removed on error
            };

            recognition.start();
        }


        
        window.onload = function () {
            document.getElementById("output").value = "";
        };

        
        
        
        
        
        ///newly added

      
    document.addEventListener('DOMContentLoaded', function () {
        const categoryBtn = document.getElementById('categoryBtn');
        const categoryMenu = document.getElementById('categoryMenu');

        // Toggle menu on click
        categoryBtn.addEventListener('click', function (e) {
            e.preventDefault();
            categoryMenu.classList.toggle('visible');
        });

        // Close if clicked outside
        document.addEventListener('click', function (e) {
            if (!categoryBtn.contains(e.target) && !categoryMenu.contains(e.target)) {
                categoryMenu.classList.remove('visible');
            }
        });
    });

      
     

    ////////////////
    
     document.addEventListener("DOMContentLoaded", function () {
        const form = document.querySelector("form");
        const codInput = document.getElementById("cod-input");
        const onlineInput = document.getElementById("online-input");

        form.addEventListener("submit", function (event) {
            if (codInput.checked) {
                // Redirect to cashondelivery.jsp instead of submitting the form
                event.preventDefault(); // Stop default form submission
                
                window.location.href = 'forwardToCashOnDelivery';            }
            // If online payment selected, allow form to proceed to final_paymentServlet
        });
    });

        </script>
</head>
<body>
 <div class="top-bar">
        <span>35% Exclusive discount plus free next day delivery, excludes sale</span>
    </div>

    <!-- Header Section -->
    <header class="header">
        <div class="logo">
           <a href="index.jsp"><img src="${pageContext.request.contextPath}/img/logoblack.png" alt="ECO_BARN"></a> 
            
        </div>
      <div class="search-container">
<input type="text" id="output" placeholder="Search..." oninput="delayedKeywordCheck()" onkeydown="checkEnter(event)">
    <i class="fas fa-search"></i>
    <i class="fas fa-microphone mic-btn" onclick="startRecognition()"></i>
</div>

        <div class="header-icons">
          
        

<c:if test="${not empty username}">
    <a href="cart.jsp" style="text-decoration: none; color: inherit;">
        <i class="fas fa-shopping-cart"></i> 
    </a>
</c:if>


    <c:if test="${empty username}">
   <a href="signin.jsp" style="text-decoration: none; color: inherit;">
        <i class="fas fa-shopping-cart"></i> 
    </a>

</c:if>

    
           
          

            <div class="user-info">
               
          
<c:if test="${not empty username}">
    <span>Welcome, ${username}!</span>
    <div class="profile-btn" >
        <i class="fas fa-user"></i>
    </div>
</c:if>

<c:if test="${empty username}">
   <a href="signin.jsp" class="signin-btn">
    <i class="fas fa-user-circle"></i> Sign In
</a>

</c:if>





 <div class="profile-menu hidden">
                <ul>
                    <c:choose>
            <c:when test="${fn:substring(username, 0, 5) == 'Admin'}">
                <li><a href="directToAdminDashboardfromMenuServlet">Admin Dashboard</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="userprofile.jsp">My Account</a></li>
            </c:otherwise>
        </c:choose>
                    <li><a href="myprofilereviews.jsp">Add Reviews</a></li>
                    <li><a href="trackOrder.jsp">Track Order</a></li>
					<li><a href="#" id="logoutBtn">Log Out</a></li>               
					
			 </ul>
   </div>
                
            </div>
            
           
        </div>
    </header>
    
    

<div class="menu-toggle" onclick="toggleMenu()"></div>


    <!-- Navigation Bar -->
    <nav class="nav-bar">
    	&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
      <div class="dropdown">
    <a href="#" id="categoryBtn">
     Browse All Categories &ensp;<i class="fas fa-chevron-down"></i>
	</a>
  <div class="cat-menu" id="categoryMenu">
  <!-- Categories List -->
<ul>
    <li><a href="ItemDetailsController?category=fruits&name=Apples"><i class="fas fa-apple-alt"></i> Fruits</a></li>
    <li><a href="ItemDetailsController?category=vegetables&name=Carrots"><i class="fas fa-leaf"></i> Vegetables</a></li>
    <li><a href="ItemDetailsController?category=freshnuts&name=Almonds"><i class="fas fa-seedling"></i> Fresh Nuts</a></li>
    <li><a href="ItemDetailsController?category=leafygreen&name=Spinach"><i class="fas fa-leaf"></i>Leafy Green</a></li>
    <li><a href="ItemDetailsController?category=root&name=Sweet+Potato"><i class="fas fa-birthday-cake"></i> Root Products</a></li>
</ul>

</div>

  </div>

      <a href="${pageContext.request.contextPath}/index.jsp"
   class="<%= "home".equals(currentPage) ? "active" : "" %>">HOME</a>

<a href="DealDetailServlet"
   class="<%= "deals".equals(currentPage) ? "active" : "" %>">DAILY DEALS</a>

<a href="AllItemsDisplayDAO"
   class="<%= "shop".equals(currentPage) ? "active" : "" %>">SHOP</a>

<a href="help.jsp"
   class="<%= "help".equals(currentPage) ? "active" : "" %>">HELP CENTER</a>

<a href="contact.jsp"
   class="<%= "contact".equals(currentPage) ? "active" : "" %>">CONTACT US</a>

        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
        
    </nav>
    
  <!-- Logout Confirmation Overlay -->
<div id="logoutOverlay">
    <div class="logout-popup">
        <h2>Confirm Logout</h2>
        <p>Are you sure you want to log out?</p>
        <div class="logout-buttons">
            <button id="confirmLogout" class="btn-confirm">Yes, Logout</button>
            <button id="cancelLogout" class="btn-cancel">Cancel</button>
        </div>
    </div>
</div>

<div id="confirmation-overlay">
  <div class="overlay-box">
    <h3>🤖 Search Assistant</h3>
    <p id="confirm-message">Do you want to go to this page?</p>
    <button onclick="confirmRedirect()">Yes</button>
    <button onclick="cancelRedirect()">No</button>
  </div>
</div>




</body>
</html>