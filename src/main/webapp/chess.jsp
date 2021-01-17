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
    <title>Chess</title>
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
<form style="float: right" action="<%=request.getContextPath()%>/move" method="post">
    <label for="fromm">From</label><input type="text" id="fromm" name="from">
    <label for="to">To</label><input type="text" id="to" name="to">
    <%--    <input onsubmit="move()" type="submit" value="Move">--%>
</form>
<button id="buttonMove" onclick="makeAMove()">Move</button>
<button id="buttonWait" onclick="waitForMove()">Wait</button>

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
<script>



    const xCoordinates = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']
    const maxYCoordinate = 8

    function move() {
        let from = document.getElementById("fromm").value;
        let to = document.getElementById("to").value;
        moveTo(from, to)
    }

    function moveTo(fromm, to) {
        let classes = document.querySelectorAll("div");
        let fromChess;

        let fromFigure;
        let toChess;
        for (let i = 0; i < classes.length; i++) {
            if (((maxYCoordinate - fromm[0]) * maxYCoordinate + xCoordinates.indexOf(fromm[1])) === i) {
                fromChess = i;
                fromFigure = classes[i].innerText
            }
            if (((maxYCoordinate - to[0]) * maxYCoordinate + xCoordinates.indexOf(to[1])) === i) {
                toChess = i;
            }
        }
        classes[fromChess].innerText = "";
        classes[toChess].innerText = fromFigure;
    }

    function makeAMove() {
        let from = document.getElementById("fromm").value;
        let to = document.getElementById("to").value;

        let xhttp = new XMLHttpRequest();

        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                var moveMent =JSON.parse(this.responseText)
                if (moveMent!=null) {
                    moveTo(moveMent.from,moveMent.to)
                } else {
                    alert("Can not read the response")
                }
            }
        };
        xhttp.open("POST", "http://localhost:8080/assignment_2_war_exploded/first", true);
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhttp.send("from=" + from.toString() + "&to=" + to.toString());


    }


    function waitForMove() {
        let xhttp = new XMLHttpRequest();

        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                let moveMent = JSON.parse(this.responseText)
                if (moveMent!==null) {
                    moveTo(moveMent.from,moveMent.to)
                } else {
                    alert("Can not read the response")
                }
            }
        };
        xhttp.open("POST", "http://localhost:8080/assignment_2_war_exploded/first", true);
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhttp.send("ready=true");
    }
    class Move{
        from;
        to;
        constructor(fromm,to) {
            this.from=fromm;
            this.to=to;

        }
    }


</script>
</html>
