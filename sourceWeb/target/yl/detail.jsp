
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/search-bar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/detail.css">
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
            <a class="navbar-brand" href="#">科研信息管理系统</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">

            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">用户名<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/userIn">个人信息</a></li>
                        <li><a href="${pageContext.request.contextPath}/showMe">档案库</a></li>
                        <li><a href="${pageContext.request.contextPath}/mySource">资料库</a></li>
                        <li><a href="${pageContext.request.contextPath}/showTask">任务中心</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="search-bar col-lg-8 col-lg-offset-2">
</div>
<div class="content col-lg-10 col-lg-offset-1">
    <div class="detail">
        <h1>${article.title}</h1>

        <div class="toolbox">

<%--            <a href="${pageContext.request.contextPath}/collect?id=${article.id}"> <button class="btn btn-success"><span class="glyphicon glyphicon-plus"></span>&nbsp;加入资料库</button></a>--%>
            <a href="${pageContext.request.contextPath}/static/filesPDF/${paper.paperUrl}" <%--download="${pageContext.request.contextPath}/static/filesPDF/${article.url}"--%>>
               <a href="${pageContext.request.contextPath}/downA?id=${paper.id}"><button class="btn btn-primary"><span class="glyphicon glyphicon-download-alt"></span>&nbsp;下载pdf</button></a>

            </a>
        </div>
        <hr>
        <iframe src="${pageContext.request.contextPath}/static/filesPDF/${paper.paperUrl}" frameborder="0" width="100%" height="800px"></iframe>

    </div>
</div>
<canvas id="pdf"></canvas>


</body>

</html>