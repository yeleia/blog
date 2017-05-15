<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--
  Created by IntelliJ IDEA.
  User: yelei
  Date: 17-5-4
  Time: 下午8:37
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/sort.css">
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
<div class="content col-lg-10 col-lg-offset-1">
    <h1>任务中心</h1>
    <p>
       <a href="${pageContext.request.contextPath}/toAddTask"> <button class="btn btn-warning btn-block">
            <span class="glyphicon glyphicon-plus-sign"></span>&emsp;
            发布任务</button>
       </a>
    </p>
    <h2>已发布的任务</h2>
    <table class="table table-responsive">
        <tr>
            <th>任务名称</th>
            <th>发布时间</th>
            <th>截止时间</th>
            <th>操作</th>
        </tr>
        <c:forEach var="tasks" items="${tasks}">
        <tr>
            <td>${tasks.title}</td>
            <td><fmt:formatDate  value="${tasks.pushTime}" type="both" pattern="yyyy-MM-dd" /></td>
            <td><fmt:formatDate  value="${tasks.endTime}" type="both" pattern="yyyy-MM-dd" /></td>
            <td>
                <a href="${pageContext.request.contextPath}/seeTask?id=${tasks.id}"><button class="btn btn-info " title="查看已提交">
                    <span class="glyphicon glyphicon-search" ></span>
                </button>
                </a>
                <a href="${pageContext.request.contextPath}/downTask?id=${tasks.id}"> <button class="btn btn-info" title="下载文件">
                    <span class="glyphicon glyphicon-download-alt"></span>
                </button></a>
                <a href="${pageContext.request.contextPath}/toUpdate?id=${tasks.id}"><button class="btn btn-primary" title="修改">
                    <span class="glyphicon glyphicon-pencil"></span>
                </button></a>
                <a href="${pageContext.request.contextPath}/deleteTask?id=${tasks.id}"><button class="btn btn-danger" title="删除">
                    <span class="glyphicon glyphicon-trash"></span>
                </button></a>
            </td>
        </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
