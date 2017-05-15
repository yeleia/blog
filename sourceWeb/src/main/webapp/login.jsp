
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.0.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/nav-home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css">
    <title>首页</title>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">科研信息管理系统</a>
        </div>
    </div>
</nav>

<div class="content">
    <div class="col-md-6 left">
        <h1>资源管理</h1>
        <p>在这里管理你的资源</p>
    </div>
    <div class="col-md-4 col-lg-offset-1 right">
        <div class="login">
            <ul id="loginTab" class="nav nav-tabs">
                <li class="active">
                    <a href="#loginform" data-toggle="tab">用户登录</a>
                </li>
                <li>
                    <a href="#regisform" data-toggle="tab">管理员登录</a>
                </li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="loginform">
                    <form action="${pageContext.request.contextPath}/login" method="post">
                        <div class="loginformbox">
                            <input type="text" name="userName" class="form-control" placeholder="用户名">
                            <input type="password" name="password" class="form-control" placeholder="密码">
                            <button class="btn btn-warning">登录</button>
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade in" id="regisform">
                    <form action="${pageContext.request.contextPath}/adminLogin" method="post">
                        <div class="loginformbox">
                            <input type="text" name="adminName" class="form-control" placeholder="用户名">
                            <input type="password" name="password" class="form-control" placeholder="密码">
                            <button class="btn btn-warning">登录</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/static/js/page-height.js"></script>
</body>

</html>