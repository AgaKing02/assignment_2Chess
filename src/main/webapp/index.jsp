<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <script>
        function makeAMove() {
            let xhttp = new XMLHttpRequest();
            let move = document.getElementById("moveOut").value;
            if (move === "") {
                document.getElementById("moveOut").value = "please enter something 1";
                return;
            }
            xhttp.onreadystatechange = function () {
                if (this.readyState === 4 && this.status === 200) {
                    var moveMent = JSON.parse(this.responseText);
                    if (moveMent.length > 0) {
                        document.getElementById("moveIn").value = moveMent;
                    } else {
                        document.getElementById("moveIn").value = "Could not receive a movement";
                    }
                }
            };
            xhttp.open("POST", "${pageContext.request.contextPath}/hello-servlet", true);
            xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            xhttp.send("move=" + move);
            console.log(xhttp.responseText)


        }
        function getResponse(responseText){
            alert(responseText)
        }
    </script>
</head>
<body>
<input type="button" style="width: 15%;" name="Move" value="Move" onclick="makeAMove()"><br><br>
<input type="text" placeholder="move From partner" id="moveIn" name="moveIn"><br><br>
<input type="text" placeholder="my Move" id="moveOut" name="moveOut"><br><br>
</body>
</html>