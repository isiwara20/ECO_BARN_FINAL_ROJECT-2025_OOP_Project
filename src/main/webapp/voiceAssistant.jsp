<%@ page language="java" contentType="text/html; charset=UTF-8" %>
 <!-- IT23600584 Indievarie H. C -->   

<html>
<head>
   <title>Eco-Barn | Voice Assistance </title>
      <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    <link rel="stylesheet" href="css/orange-theme.css">
  <link rel="icon" type="image/x-icon" href="img/logoblack.png">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #fff8f0;
            color: #333;
            margin: 0;
            padding: 20px;
            background: url('img/food.jpg') no-repeat center center fixed;
    background-size: cover;
    
        }

        .container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            border: 1.5px solid transparent;
            box-shadow: 0 0 10px rgba(255, 145, 0, 0.1);
            text-align: center;
            transition: box-shadow 0.3s ease;
        }

        .container.listening {
            animation: thinRainbowGlow 2s linear infinite;
        }

        @keyframes thinRainbowGlow {
            0%   { box-shadow: 0 0 4px 1.5px red; }
            20%  { box-shadow: 0 0 4px 1.5px orange; }
            40%  { box-shadow: 0 0 4px 1.5px yellow; }
            60%  { box-shadow: 0 0 4px 1.5px green; }
            80%  { box-shadow: 0 0 4px 1.5px blue; }
            100% { box-shadow: 0 0 4px 1.5px violet; }
        }

        h1 {
            color: #ff6f00;
        }

        .mic-bar {
            position: relative;
            width: 80px;
            height: 80px;
            margin: 30px auto;
            background-color: white;
            border-radius: 50%;
            cursor: pointer;
            border: 2px solid transparent;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .mic-icon {
            width: 36px;
            height: 36px;
            z-index: 2;
        }

        .mic-glow {
            position: absolute;
            width: 100%;
            height: 100%;
            border-radius: 50%;
            z-index: 1;
            pointer-events: none;
            display: none;
        }

        .mic-glow.active {
            animation: thinRainbowGlow 1.5s linear infinite;
            display: block;
        }

        .response-box {
            margin-top: 20px;
            background-color: #fff;
            padding: 15px;
            border-left: 5px solid #ff9800;
            border-radius: 8px;
            text-align: left;
        }

        .response-box ul {
            padding: 0;
            list-style: none;
            margin-top: 10px;
        }

        .response-box li {
            background-color: #fff8e1;
            margin-bottom: 8px;
            padding: 10px 15px;
            border-radius: 6px;
            box-shadow: 0 1px 4px rgba(0,0,0,0.1);
            font-weight: 500;
            display: flex;
            justify-content: space-between;
        }

        .response-box li::before {
            content: "🛒 ";
            margin-right: 8px;
        }
    </style>
</head>
<body>

    <div id="mainContainer" class="container">
        <h1>EcoBarn Voice Assistant 🛒</h1>

        <div class="mic-bar" onclick="startListening()">
            <div id="micGlow" class="mic-glow"></div>
            <img src="img/mic.png" alt="Mic" class="mic-icon">
        </div>

        <p><strong>You said:</strong> <span id="spokenText">---</span></p>
        <div id="reply" class="response-box"></div>
    </div>

    <script>
        function startListening() {
            const recognition = new (window.SpeechRecognition || window.webkitSpeechRecognition)();
            recognition.lang = "en-IN";
            const micGlow = document.getElementById("micGlow");
            const container = document.getElementById("mainContainer");

            recognition.start();
            micGlow.classList.add("active");
            container.classList.add("listening");

            recognition.onresult = function(event) {
                micGlow.classList.remove("active");
                container.classList.remove("listening");

                const speech = event.results[0][0].transcript;
                document.getElementById("spokenText").innerText = speech;

                fetch("VoiceController", {
                    method: "POST",
                    headers: { "Content-Type": "application/x-www-form-urlencoded" },
                    body: "command=" + encodeURIComponent(speech)
                })
                .then(res => res.text())
                .then(data => {
                    if (data.startsWith("NAVIGATE:")) {
                        window.location.href = data.split(":")[1];
                    } else {
                        document.getElementById("reply").innerHTML = data;
                    }
                });
            };

            recognition.onerror = function() {
                micGlow.classList.remove("active");
                container.classList.remove("listening");
            };

            recognition.onend = function() {
                micGlow.classList.remove("active");
                container.classList.remove("listening");
            };
        }
    </script>
</body>
</html>
