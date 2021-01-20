<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 13.01.2021
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>White</title>
    <style>
        .chessboard {
            width: 640px;
            height: 640px;
            margin: 20px;
            border: 25px solid #333;
        }

        .black {
            float: left;
            width: 80px;
            height: 80px;
            background-color: #999;
            font-size: 50px;
            text-align: center;
            display: table-cell;
            vertical-align: middle;
        }

        .white {
            float: left;
            width: 80px;
            height: 80px;
            background-color: #fff;
            font-size: 50px;
            text-align: center;
            display: table-cell;
            vertical-align: middle;
        }
        {box-sizing: border-box;}

        /* Button used to open the chat form - fixed at the bottom of the page */
        .open-button {
            background-color: #555;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            opacity: 0.8;
            position: fixed;
            bottom: 23px;
            right: 28px;
            width: 280px;
        }

        /* The popup chat - hidden by default */
        .form-popup {
            display: none;
            position: fixed;
            bottom: 0;
            right: 15px;
            border: 3px solid #f1f1f1;
            z-index: 9;
        }

        /* Add styles to the form container */
        .form-container {
            max-width: 300px;
            padding: 10px;
            background-color: white;
        }

        /* Full-width textarea */
        .form-container textarea {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            border: none;
            background: #f1f1f1;
            resize: none;
            min-height: 200px;
        }

        /* When the textarea gets focus, do something */
        .form-container textarea:focus {
            background-color: #ddd;
            outline: none;
        }

        /* Set a style for the submit/login button */
        .form-container .btn {
            background-color: #4CAF50;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            width: 100%;
            margin-bottom:10px;
            opacity: 0.8;
        }

        /* Add a red background color to the cancel button */
        .form-container .cancel {
            background-color: red;
        }

        /* Add some hover effects to buttons */
        .form-container .btn:hover, .open-button:hover {
            opacity: 1;
        }

        #messages{
            border: 1px solid silver;
        }    </style>
</head>
<body>
<div class="form">
    <form style="float: right" action="<%=request.getContextPath()%>/move" method="post">
        <label for="fromm">From</label><input type="text" id="fromm" name="from">
        <br>
        <label for="to">To</label><input type="text" id="to" name="to">
        <%--    <input onsubmit="move()" type="submit" value="Move">--%>
    </form>
</div>
<br>
<div class="actions" style="float: right">
    <button id="buttonMove" onclick="makeAMove()">Move</button>
    <br>
<%--    <button id="buttonWait" onclick="waitForMove()">Wait</button>--%>
</div>
<br>
<div class="chat-popup" id="myForm" style="float: right">
    <div id="messages">

    </div>
    <form action="" class="form-container">
        <h1>Chat</h1>
        <label for="msg"><b>Message</b></label>
        <input type="text" id="msg" name="msg" placeholder="Type">
        <button type="button" onclick="testDatagramSocket()" class="btn">Send</button>
    </form>
</div>
<br>

<main class="chessboard">
    <!-- 1st -->
    <div class="white">&#9820;</div>
    <div class="black">&#9822;</div>
    <div class="white">&#9821;</div>
    <div class="black">&#9819;</div>
    <div class="white">&#9818;</div>
    <div class="black">&#9821;</div>
    <div class="white">&#9822;</div>
    <div class="black">&#9820;</div>
    <!-- 2nd -->
    <div class="black">&#9823;</div>
    <div class="white">&#9823;</div>
    <div class="black">&#9823;</div>
    <div class="white">&#9823;</div>
    <div class="black">&#9823;</div>
    <div class="white">&#9823;</div>
    <div class="black">&#9823;</div>
    <div class="white">&#9823;</div>
    <!-- 3th -->
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <!-- 4st -->
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <!-- 5th -->
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <!-- 6th -->
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <div class="black"></div>
    <div class="white"></div>
    <!-- 7th -->
    <div class="white">&#9817;</div>
    <div class="black">&#9817;</div>
    <div class="white">&#9817;</div>
    <div class="black">&#9817;</div>
    <div class="white">&#9817;</div>
    <div class="black">&#9817;</div>
    <div class="white">&#9817;</div>
    <div class="black">&#9817;</div>
    <!-- 8th -->
    <div class="black">&#9814;</div>
    <div class="white">&#9816;</div>
    <div class="black">&#9815;</div>
    <div class="white">&#9813;</div>
    <div class="black">&#9812;</div>
    <div class="white">&#9815;</div>
    <div class="black">&#9816;</div>
    <div class="white">&#9814;</div>
</main>


</body>
<script src="js/fistPlayer.js"></script>
</html>
