<%--
  Created by IntelliJ IDEA.
  User: yelei
  Date: 17-5-1
  Time: 下午8:49
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
    <script src="${pageContext.request.contextPath}/static/js/bootstrap-datetimepicker.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/nav-common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/upload.css">

    <title>添加课题</title>
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
    <h1>填写课题信息</h1>
    <hr>
    <form id="info" action="${pageContext.request.contextPath}/addProjects" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label>课题名</label>
            <input type="text" name="projectTitle" class="form-control" placeholder="请输入项目名称">
        </div>
        <div class="form-group">
            <label>来源单位</label>
            <input type="text" name="from" class="form-control" placeholder="来源单位">
        </div>
        <div class="form-group">
            <label>到款经费</label>
            <input type="text" name="money" class="form-control" placeholder="到款经费">
        </div>
        <div class="form-group">
            <label>级别分值</label>
            <input type="text" name="score" class="form-control" placeholder="级别分值">
        </div>
        <div class="form-group">
            <label>经费分值</label>
            <input type="text" name="mark" class="form-control" placeholder="经费分值">
        </div>
        <div class="form-group">
            <label>本人角色</label>
            <input type="text" name="myRole" class="form-control" placeholder="本人角色">
        </div>
        <div class="form-group">
            <label>参与度</label>
            <input type="text" name="involvement" class="form-control" placeholder="参与度">
        </div>
        <div class="form-group">
            <label>课题积分</label>
            <input type="text" name="integration" class="form-control" placeholder="课题积分">
        </div>
        <div class="form-group">
            <label>立题时间</label>
            <input type="text" name="startTime" class="form-control" placeholder="请输入开始时间" id="datetimepicker1" data-date-format="yyyy-mm-dd">
        </div>
        <div class="form-group">
            <label>结题时间</label>
            <input type="text" name="endTime" class="form-control" placeholder="请输入结束时间" id="datetimepicker2" data-date-format="yyyy-mm-dd">
        </div>
        <div class="form-group">
            <label>上传项目文件</label>
            <input type="file" name="file">
        </div>
        <button class="btn btn-success" type="submit"><span class="glyphicon glyphicon-open"></span>&nbsp;确认提交</button>
    </form>
</div>

<script>
    $('#datetimepicker1').datetimepicker({
        format:"yyyy-mm-dd",
        minView:'month',
        autoclose: true,
        todayBtn: true

    });
    $('#datetimepicker2').datetimepicker(
            {
                format:"yyyy-mm-dd",
                minView:'month',
                autoclose: true,
                todayBtn: true
            }
    );
</script>
</body>

</html>
