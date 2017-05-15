<%--
  Created by IntelliJ IDEA.
  User: yelei
  Date: 17-5-8
  Time: 上午9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.0.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/nav-common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/welcome.css">
    <title></title>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">科研信息管理系统</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/userIndexA">科研信息管理系统</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">

            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/userIn">个人信息</a></li>
                <li><a href="${pageContext.request.contextPath}/showMe">科研信息管理</a></li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">资料管理<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/mySource">资料库</a></li>
                        <li><a href="${pageContext.request.contextPath}/showTask">任务中心</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="jumbotron">
    <div class="container">
        <h1>欢迎您,${user.nikeName}</h1>
        <p>欢迎来到科研信息管理系统,请选择你要进行的操作.</p>
    </div>
</div>
<div class="content col-lg-10 col-lg-offset-1">
    <div class="list-group">
        <a href="${pageContext.request.contextPath}/userIn" class="list-group-item">
            <h4 class="list-group-item-heading">个人信息</h4>
            <p class="list-group-item-text">在这里添加，修改，查看和你的个人信息。</p>
        </a>
        <a href="${pageContext.request.contextPath}/showMe" class="list-group-item">
            <h4 class="list-group-item-heading">科研信息管理</h4>
            <p class="list-group-item-text">在这里管理你的科研信息。</p>
        </a>
        <a href="${pageContext.request.contextPath}/mySource" class="list-group-item">
            <h4 class="list-group-item-heading">资料库</h4>
            <p class="list-group-item-text">在这里下载和分享资料。</p>
        </a>

        <a href="${pageContext.request.contextPath}/showTask" class="list-group-item">
            <h4 class="list-group-item-heading">任务中心</h4>
            <p class="list-group-item-text">在这里查看和提交任务。</p>
        </a>
    </div>


</div>

</body>
</html>
