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
    <title>Black</title>
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
    </style>
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
<div class="actions" style="float: right" >
    <button id="buttonMove" onclick="makeAMove()">Move</button>
    <br>
    <button id="buttonWait" onclick="waitForMove()">Wait</button>
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
<script src="js/secondPlayer.js"></script>
</html>
