<%--
  Created by IntelliJ IDEA.
  User: yelei
  Date: 17-5-11
  Time: 上午11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        var url='ws://'+window.location.host+'<% request.getContextPath()%>/hello';
        var sock=new WebSocket(url);//打开webSocket
        sock.onopen=function () {
            console.log('开去WebSocket连接');
            sayHello();
        }
        sock.onmessage=function (e) {
            console.log('接收消息',e.data);
            setTimeout(function () {sayHello()},2000);
        }
        sock.onclose=function () {
            console.log('关闭连接');
        }
        function sayHrllo() {
            console.log('发送消息:hello word!')
            sock.send('send world');
        }
    </script>
</head>
<body>
hello word!
</body>
</html>
