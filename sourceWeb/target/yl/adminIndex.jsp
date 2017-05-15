<%--
  Created by IntelliJ IDEA.
  User: yelei
  Date: 17-5-8
  Time: 下午8:33
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
            <a class="navbar-brand" href="${pageContext.request.contextPath}/adminIndex">科研信息管理系统</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">

            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">用户管理<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/addUserso">普通用户</a></li>
                        <li><a href="${pageContext.request.contextPath}/addadmins">添加管理员</a></li>
                        <li><a href="${pageContext.request.contextPath}/own">个人信息</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">科研信息管理<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/Agl">论文管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/projectgl">项目管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/check">审核</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">科研业绩管理<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/userGl">用户业绩管理</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">资料管理<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/adminSource1">资料库</a></li>
                        <li><a href="${pageContext.request.contextPath}/task">任务中心</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="jumbotron">
    <div class="container">
        <h1>欢迎您,${admin.nikeName}</h1>
        <p>欢迎来到科研信息管理系统,请选择你要进行的操作.</p>
    </div>
</div>
<div class="content col-lg-10 col-lg-offset-1">
    <div class="list-group">
        <a href="${pageContext.request.contextPath}/addUserso" class="list-group-item">
            <h4 class="list-group-item-heading">普通用户</h4>
            <p class="list-group-item-text">在这里添加，修改，查看和删除用户信息。</p>
        </a>
        <a href="${pageContext.request.contextPath}/addadmins" class="list-group-item">
            <h4 class="list-group-item-heading">添加管理员</h4>
            <p class="list-group-item-text">在这里添加管理员账户。</p>
        </a>
        <a href="${pageContext.request.contextPath}/own" class="list-group-item">
            <h4 class="list-group-item-heading">个人信息</h4>
            <p class="list-group-item-text">在这里修改你的个人信息。</p>
        </a>
        <a href="${pageContext.request.contextPath}/Agl" class="list-group-item">
            <h4 class="list-group-item-heading">论文管理</h4>
            <p class="list-group-item-text">在这里管理用户的提交论文。</p>
        </a>
        <a href="${pageContext.request.contextPath}/projectgl" class="list-group-item">
            <h4 class="list-group-item-heading">项目管理</h4>
            <p class="list-group-item-text">在这里管理用户的科研项目。</p>
        </a>
        <a href="${pageContext.request.contextPath}/check" class="list-group-item">
            <h4 class="list-group-item-heading">审核</h4>
            <p class="list-group-item-text">在这里审核用户的论文和科研项目。</p>
        </a>
        <a href="${pageContext.request.contextPath}/userGl" class="list-group-item">
            <h4 class="list-group-item-heading">用户业绩管理</h4>
            <p class="list-group-item-text">在这里管理用户的科研业绩。</p>
        </a>
        <a href="${pageContext.request.contextPath}/adminSource1" class="list-group-item">
            <h4 class="list-group-item-heading">资料库</h4>
            <p class="list-group-item-text">在这里可以上传和分享资料。</p>
        </a>
        <a href="${pageContext.request.contextPath}/task" class="list-group-item">
            <h4 class="list-group-item-heading">任务中心</h4>
            <p class="list-group-item-text">在这里发布，修改和查看用户提交的任务。</p>
        </a>
    </div>


</div>

</body>
</html>
