<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%--
  Created by IntelliJ IDEA.
  User: yelei
  Date: 17-5-1
  Time: 上午9:54
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
    <title>审核论文</title>
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
    <h1>待审核的论文</h1>
    <table class="table table-responsive">
        <tr>
            <th>论文名称</th>
            <th>上传者</th>
            <th>期刊名称</th>
            <th>发表时间</th>
            <th>论文类别</th>
            <th>积分</th>
            <th>操作</th>
        </tr>
        <c:forEach var="papers" items="${papers}">
        <tr>
            <td>${papers.title}</td>
            <td>${papers.userName}</td>
            <td>${papers.magazine}</td>
            <td><fmt:formatDate  value="${papers.dateTime}" type="both" pattern="yyyy-MM-dd" /></td>
            <td>${papers.category}</td>
            <td>${papers.integration}</td>
            <td>
                <a href="${pageContext.request.contextPath}/static/filesPDF/${papers.paperUrl}"><button class="btn btn-info" title="查看">
                    <span class="glyphicon glyphicon-search"></span></button></a>
                <a href="${pageContext.request.contextPath}/checkTrue?id=${papers.id}"><button class="btn btn-success btn-sm" title="通过审核"><span class="glyphicon glyphicon-ok"></span></button></a>
                <a href="${pageContext.request.contextPath}/checkfalse?id=${papers.id}"><button class="btn btn-danger btn-sm" title="不通过审核"><span class="glyphicon glyphicon-remove" ></span></button></a>
            </td>
        </tr>
        </c:forEach>
    </table>
    <h1>待审核的项目</h1>
    <table class="table table-responsive">
        <tr>
            <th>用户名</th>
            <th>项目标题</th>
            <th>立题时间</th>
            <th>结题时间</th>
            <th>来源单位</th>
            <th>到款经费</th>
            <th>级别分值</th>
            <th>经费分值</th>
            <th>本人角色</th>
            <th>参与度</th>
            <th>课题积分</th>
            <th>操作</th>
        </tr>
        <c:forEach var="projects" items="${projects}">
        <tr>
            <td>${projects.userName} </td>
            <td>${projects.projectTitle}</td>
            <td><fmt:formatDate  value="${projects.startTime}" type="both" pattern="yyyy-MM-dd" /></td>
            <td><fmt:formatDate  value="${projects.endTime}" type="both" pattern="yyyy-MM-dd" /></td>
            <td>${projects.from}</td>
            <td>${projects.money}</td>
            <td>${projects.score}</td>
            <td>${projects.mark}</td>
            <td>${projects.myRole}</td>
            <td>${projects.involvement}</td>
            <td>${projects.integration}</td>
            <td>
                <a href="${pageContext.request.contextPath}/seeProject?id=${projects.id}"> <button class="btn btn-info" title="查看">
                    <span class="glyphicon glyphicon-search"></span>
                </button>
                </a>

                <a href="${pageContext.request.contextPath}/checkProjectsTrue?id=${projects.id}"><button class="btn btn-success btn-sm" title="通过审核"><span class="glyphicon glyphicon-ok"></span></button></a>
                <a href="${pageContext.request.contextPath}/checkProjectsFalse?id=${projects.id}"><button class="btn btn-danger btn-sm" title="不通过审核"><span class="glyphicon glyphicon-remove" ></span></button></a>
            </td>
        </tr>
        </c:forEach>
    </table>
</div>
</body>

</html>
