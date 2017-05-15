<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yelei
  Date: 17-5-9
  Time: 上午10:33
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
    <title>用户管理</title>
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
    <button class="btn btn-warning btn-block" data-toggle="modal" data-target="#addUser">
        <span class="glyphicon glyphicon-plus"></span>添加用户
    </button>
    <h1>用户管理</h1>
    <table class="table table-responsive">
        <tr>
            <th>用户名</th>
            <th>昵称</th>
            <th>权限</th>
            <th>角色</th>
            <th>职称</th>
            <th>所在单位</th>
            <th>联系电话</th>
            <th>现居地址</th>
            <th>操作</th>
        </tr>
        <c:forEach var="users" items="${users}">
        <tr>
            <td>${users.userName} </td>
            <td>${users.nikeName}</td>
            <td>${users.power}</td>
            <td>${users.roler}</td>
            <td>${users.job}</td>
            <td>${users.blongs}</td>
            <td>${users.phone}</td>
            <td>${users.adress}</td>
            <td>
               <a href="${pageContext.request.contextPath}/userDatile?id=${users.id}"><button class="btn btn-success" title="查看详情">
                    <span class="glyphicon glyphicon-search"></span>
                </button>
               </a>
                <a href="${pageContext.request.contextPath}/updateInformation?id=${users.id}"> <button class="btn btn-info" title="修改">
                    <span class="glyphicon glyphicon-pencil"></span>
                </button>
                    </a>
                <a href="${pageContext.request.contextPath}/deleteUs?id=${users.id}"> <button class="btn btn-danger" title="删除">
                    <span class="glyphicon glyphicon-trash"></span>
                </button>
                </a>
            </td>
        </tr>
        </c:forEach>
    </table>
</div>
<!--添加用户模态框-->
<div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/userRegister" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加用户</h4>
                </div>
                <div class="modal-body">

                    <label>用户名:</label>
                    <input type="text" name="userName" class="form-control">


                    <label>密码:</label>
                    <input type="password" name="password" class="form-control">

                    <label>确认密码:</label>
                    <input type="password" class="form-control">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-warning">确认添加</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
