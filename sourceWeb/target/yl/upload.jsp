
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
    <title>详情页</title>
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

<div class="content col-lg-10 col-lg-offset-1">
    <h1>填写文件信息</h1>
    <hr>
    <form id="info" action="${pageContext.request.contextPath}/upLoadFile" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label>论文标题</label>
            <input type="text" name="title" class="form-control" placeholder="请输入论文标题">
        </div>
        <div class="form-group">
            <label>期刊名称</label>
            <input type="text" name="magazine" class="form-control" placeholder="请输入期刊名称">
        </div>
        <div class="form-group">
            <label>论文类别</label>
            <input type="text" name="category" class="form-control" placeholder="如：计算机">
        </div>
        <div class="form-group">
            <label>发布日期</label>
            <input type="text" name="dateTime" class="form-control" id="timePicker">
        </div>
        <div class="form-group">
            <label>论文积分</label>
            <input type="text" name="integration" class="form-control" placeholder="如：5">
        </div>
        <div class="form-group">
            <label>上传文件(请上传以.pdf,.docx,.txt,.doc类型的文件)</label>
            <input name="file" type="file">
        </div>
        <input class="btn btn-success" type="submit">
    </form>
</div>

<script>
    $('#timePicker').datetimepicker({
        format:"yyyy-mm-dd",
        autoclose: true,
        todayBtn: true,
    });

</script>
</body>

</html>
