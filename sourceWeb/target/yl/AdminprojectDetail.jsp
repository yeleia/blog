<%--
  Created by IntelliJ IDEA.
  User: yelei
  Date: 17-5-8
  Time: 下午3:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<div class="container col-lg-offset-1 col-lg-10">
    <div class="well">
        <h2>${project.projectTitle}</h2>
        <p>项目时间:
            <span><fmt:formatDate  value="${project.endTime}" type="both" pattern="yyyy-MM-dd" /></span>
            到
            <span><fmt:formatDate  value="${project.endTime}" type="both" pattern="yyyy-MM-dd" /></span>
        </p>
        <p>来源单位：<span>${project.from}</span></p>
        <p>到款经费：<span>${project.money}</span></p>
        <p>级别分值：<span>${project.score}</span></p>
        <p>经费分值：<span>${project.mark}</span></p>
        <p>本人角色：<span>${project.myRole}</span></p>
        <p>参与度：<span>${project.involvement}</span></p>
        <p>课题积分：<span>${project.integration}</span></p>
    </div>

    <h2>该项目拥有的文件
       <%-- <button class="btn btn-warning" data-toggle="modal" data-target="#addFile">
            添加项目文件</button>--%>
    </h2>
    <table class="table">
        <tr>
            <th>文件名</th>
            <th>上传时间</th>
            <th>操作</th>
        </tr>
        <c:forEach var="projectSource" items="${projectSources}">
        <tr>
            <td>${projectSource.title}</td>
            <td><fmt:formatDate  value="${projectSource.sendTime}" type="both" pattern="yyyy-MM-dd" /></td>
            <td>
            <a href="${pageContext.request.contextPath}/upProject?id=${projectSource.id}">  <button class="btn btn-success btn-sm" title="下载">
                    <span class="glyphicon glyphicon-download-alt"></span>
                </button>
            </a>
               <%--<a href="${pageContext.request.contextPath}/deleteProjectSource?id=${projectSource.id}&projectId=${projectSource.projectId}"> <button class="btn btn-danger btn-sm" title="删除">
                    <span class="glyphicon glyphicon-trash"></span>
                </button>
               </a>--%>
            </td>
        </tr>
            <!--上传文件模态框-->
            <div class="modal fade" id="addFile" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form action="${pageContext.request.contextPath}/adminAddFiles?id=${projectSource.projectId}" method="post" enctype="multipart/form-data">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">添加项目文件</h4>
                            </div>
                            <div class="modal-body">
                                <input type="file" name="file">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                <button type="submit" class="btn btn-warning">确认添加</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </table>
</div>


</body>
</html>