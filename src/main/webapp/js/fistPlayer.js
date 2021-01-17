    let lastMove;

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
    moveTo(moveMent.from, moveMent.to)

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
    if (moveMent !== null) {
    lastMove=moveMent
    moveTo(moveMent.from, moveMent.to)
} else {
    alert("Can not read the response")
}
}
};
    xhttp.open("POST", "http://localhost:8080/assignment_2_war_exploded/first", true);
    xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhttp.send("ready=true");

}

    class Move {
    from;
    to;

    constructor(fromm, to) {
    this.from = fromm;
    this.to = to;

}
}



