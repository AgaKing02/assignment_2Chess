let lastMove;
let message;
let count = 0;
const xCoordinates = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']
const maxYCoordinate = 8

function move() {
    let from = document.getElementById("fromm").value;
    let to = document.getElementById("to").value;
    moveTo(from, to)
}

function moveTo(fromm, to) {
    let classes = document.querySelectorAll(".chessboard>div");
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
            var moveMent = JSON.parse(this.responseText)
            if (moveMent != null) {
                setInterval(waitForMove, 3000)
                lastMove = moveMent
                moveTo(moveMent.from, moveMent.to)

            } else {
                alert("Can not read the response")
            }
        }
    };
    xhttp.open("POST", "http://localhost:8080/assignment_2_war_exploded/second", true);
    xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhttp.send("from=" + from.toString() + "&to=" + to.toString());


}


function waitForMove() {
    let xhttp = new XMLHttpRequest();
    if (count === 0) {
        document.getElementById("buttonWait").style.visibility = "hidden";
        count++;
    }
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let moveMent = JSON.parse(this.responseText)
            if (moveMent !== null) {
                if (typeof (lastMove) === "undefined") {
                    lastMove = moveMent
                    moveTo(moveMent.from, moveMent.to)
                } else if (moveMent.from != lastMove.from || moveMent.to != lastMove.to) {
                    lastMove = moveMent
                    moveTo(moveMent.from, moveMent.to)
                }
            } else {
                alert("Can not read the response")
            }
        }
    };
    xhttp.open("POST", "http://localhost:8080/assignment_2_war_exploded/second", true);
    xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhttp.send("ready=true");

}

function testDatagramSocket() {
    let input = document.getElementById("msg").value;
    let xhttp = new XMLHttpRequest();
    if(input!=message){
        setMessage(input)
        message=input
        input=""
    }

    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let moveMent = this.responseText.replace(/[^a-zA-Z]+/g, '');
            if (moveMent !== null) {
                if (message !== moveMent) {
                    setMessage(moveMent)
                    message = moveMent
                }
            } else {
                alert("Can not read the response")
            }
        }
    };
    xhttp.open("POST", "http://localhost:8080/assignment_2_war_exploded/second", true);
    xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhttp.send("message=" + input);

}

function setMessage(message) {
    let p = document.createElement("p");
    document.getElementById("messages").append(message,p)}

class Move {
    from;
    to;

    constructor(fromm, to) {
        this.from = fromm;
        this.to = to;

    }
}



