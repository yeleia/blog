<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8">
    <title>Title</title>
    <script type="text/javascript" language="javascript">
        var echo_websocket;
        function init() {
            output=document.getElementById("output");
        }
        function send_echo(){
            var wsUri="ws://localhost:8080/echoserver/echo";
            writeToScreen("Connecting to"+wsUri);
            echo_websocket=new WebSocket(wsUri);
            echo_websocket.onopen=function (evt) {
                writeToScreen("Connected!");
                doSend(textID.value);

            };
            echo_websocket.onmessage=function (evt) {
                writeToScreen("Received message:"+evt.data);
                echo_websocket.close();
            };
            echo_websocket.onerror=function (evt) {
              writeToScreen('<span style="color:red;">' +
                      'ERROR:</span>'+evt.data);
                echo_websocket.close();
            };

        }
        function dosend(message) {
            echo_websocket.send(message);
            writeToScreen("Send message:"+message);
        }
        function writeToScreen(message) {
            var pre=document.createElement("p");
            pre.style.wordWrap="break-word";
            pre.innerHTML=message;
            output.appendChild(pre);
        }
        window.addEventListener("load",init,false);
    </script>
</head>
<body>
<h1>echo Server</h1>
<div style="text-align:left;">
    <form action="">
        <input onclick="send_echo()" value="Press to send" type="button">
        <input id="textID" name="message" value="hello web sockets" type="text">
        <br>
    </form>
</div>
<div id="output"></div>

</body>
</html>