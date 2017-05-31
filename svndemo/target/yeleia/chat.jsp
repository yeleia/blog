<%--
  Created by IntelliJ IDEA.
  User: yelei
  Date: 17-5-7
  Time: 下午7:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-ch">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>后台管理</title>
    <link href="<%=request.getContextPath()%>/static/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/index.css" />
    <script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
</head>

<body>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav">
                <li ><a class="icon-bar" href="#">动态设置</a>
                </li>
                <li><a href="#">好友管理</a>
                </li>
                <li class="active"><a href="#">聊天窗口</a>
                </li>
                <li><a href="#">文件上传</a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a>欢迎您,小夏</a>
                </li>
                <li><a href="#">安全退出</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-2" style="margin-top: 55px">
            <a href="#" class="list-group-item active">动态设置</a>
            <a href="#" class="list-group-item">添加动态</a>
            <a href="#" class="list-group-item">修改动态</a>
        </div>
        <div class="col-sm-10">
            <%--<ol class="breadcrumb">
                <li class="active">动态设置
                </li>
                <li class="active">添加动态
                </li>--%>
            <h3>聊天框</h3>
            </ol>

            <div class="panel panel-default">
                <div class="panel-heading">
                    添加
                </div>
                <div class="panel-body" style="height: 600px">
                   <%-- <form role="form" >
                        <div class="form-group">
                            <label for="name">动态名称:</label>
                            <input type="text" class="form-control" id="name" placeholder="请输入名称">
                        </div>
                        <div class="form-group">
                            <label for="name">动态内容:</label>
                            <textarea class="form-control" id="txt" placeholder="请输入内容"></textarea>
                        </div>
                        <p class="submit-p">
                            <button type="submit" class="btn btn-danger" id="btnSubmit">提交</button>
                        </p>--%>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
<footer class="foot">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <span> &copy;2017-shy&nbsp;</span>
            </div>
        </div>
    </div>
</footer>
</body>

</html>
