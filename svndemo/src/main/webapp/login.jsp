<%--
  Created by IntelliJ IDEA.
  User: yelei
  Date: 17-4-17
  Time: 下午1:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/index1.css" />
    <title>login</title>
    <script type="text/javascript">
        function check(){
            var userName=document.getElementById("userName");
            var password=document.getElementById("password");
            if(userName==""||password==""){
                alert("请输入完整的信息")
                return false;
            }
            return true;
            
        }
    </script>
</head>

<body class="container">
<header class="page-header">
    <h1>Login</h1>
</header>
<div class="row">
    <div class="col-sm-6 col-sm-offset-3 login">
        <form class="form-horizontal" name="form" method="post" action="${pageContext.request.contextPath}/login" onsubmit="return check()">
            <div class="form-group">
                <label class="col-sm-offset-1 col-sm-2 control-lable" for="userName">UserName</label>
                <div class="col-sm-6">
                    <input type="text"  class="form-control" name="userName" id="userName" placeholder="userName" required>
                    <span class=""></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-sm-offset-1 control-lable" for="password">Password</label>
                <div class="col-sm-6">
                    <input type="password"  class="form-control" name="password" id="password" placeholder="password" required>
                    <span class=""> </span>
                </div>
            </div>
            <p class="text-center">
                <button type="submit" class="btn btn-danger" id="btnSubmit">Login</button>
                <a class="forget" href="${pageContext.request.contextPath}/register"><%--没有账号？点击注册--%></a>
            </p>
        </form>
    </div>
</div>

<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/code.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/index1.js"></script>
</body>
</html>
