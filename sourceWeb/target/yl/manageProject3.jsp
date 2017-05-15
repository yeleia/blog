<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--
  Created by IntelliJ IDEA.
  User: yelei
  Date: 17-5-4
  Time: 上午10:00
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/search-bar.css">
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
<div class="search-bar col-lg-8 col-lg-offset-2">
    <form action="${pageContext.request.contextPath}/projectgl" method="post">
        <div class="input-group">
            <input type="text" name="string" class="form-control" placeholder="输入你想查找的关键字">
            <span class="input-group-btn">
        <button class="btn btn-default search-button" type="submit"><span class="glyphicon glyphicon-search"></span>&nbsp;搜索</button>
      </span>
        </div><!-- /input-group -->
    </form>
</div>
<div class="content col-lg-10 col-lg-offset-1">
    <div class="sort">
        <form action="${pageContext.request.contextPath}/exportProject" method="post" id="exportForm">
            <span>排序：</span>
            <div class="btn-group" role="group" aria-label="...">
                <a href="${pageContext.request.contextPath}/projectgl?type=1"><button type="button" class="btn btn-default ">用户名</button></a>
                <a href="${pageContext.request.contextPath}/projectgl?type=2"><button type="button" class="btn btn-default ">项目名称</button></a>
                <a href="${pageContext.request.contextPath}/projectgl?type=3"><button type="button" class="btn btn-default ">立题时间</button></a>
                <a href="${pageContext.request.contextPath}/projectgl?type=4"><button type="button" class="btn btn-default active">级别分值</button></a>
                <a href="${pageContext.request.contextPath}/projectgl?type=5"><button type="button" class="btn btn-default">积分</button></a>
                <input type="hidden" id="exportList" name="checks[]">
            </div>
            <button type="button" id="export" onclick="exports()" class="btn btn-warning">导出为excel</button>

        </form>
    </div>
    <h1>课题项目管理</h1>
    <table class="table table-responsive">
        <tr>
            <th>
                <input type="checkbox" id="selectAll">
            </th>
            <th>用户名</th>
            <th>项目标题</th>
            <th>立题时间</th>
            <th>结题时间</th>
            <th>来源单位</th>
            <th>到款经费</th>
            <th>级别分值</th>
            <th>本人角色</th>
            <th>参与度</th>
            <th>课题积分</th>
            <th>操作</th>
        </tr>
        <c:forEach var="projects" items="${projects}">
            <tr>
                <td>
                    <input type="checkbox" name="checkbox" class="select" value="${projects.id}">
                </td>
                <td>${projects.userName}</td>
                <td>${projects.projectTitle}</td>
                <td><fmt:formatDate  value="${projects.startTime}" type="both" pattern="yyyy-MM-dd" /></td>
                <td><fmt:formatDate  value="${projects.endTime}" type="both" pattern="yyyy-MM-dd" /></td>
                <td>${projects.from}</td>
                <td>${projects.money}</td>
                <td>${projects.score}</td>
                <td>${projects.myRole}</td>
                <td>${projects.involvement}</td>
                <td>${projects.integration}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/Aup?id=${projects.id}">
                        <button class="btn btn-info" title="下载上传的文件">
                            <span class="glyphicon glyphicon-download-alt"></span>
                        </button>
                    </a>
                    <a href="${pageContext.request.contextPath}/Ade?id=${projects.id}">
                        <button class="btn btn-danger" title="删除">
                            <span class="glyphicon glyphicon-trash"></span>
                        </button>
                    </a>
                </td>
            </tr>
            <script>
                function exports(){

                    var checks=[];
                    $('input[name="checkbox"]:checked').each(function(){
                        checks.push($(this).val());

                    });

                    console.log(checks)

                    if (checks==0){
                        alert("没有选择任何记录")
                    }else {
                        $('#exportList')[0].value=checks;
                        console.log($('#exportList')[0].value);
                        $('#exportForm').submit();
                    }

                }

            </script>
        </c:forEach>
    </table>
</div>
<script src="${pageContext.request.contextPath}/static/js/selectAll.js"></script>
</body>
</html>
