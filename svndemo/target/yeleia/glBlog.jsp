<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <li><a class="icon-bar" href="<%request.getContextPath();%>/Index">首页</a> </li>

            </ul>
          <%--  <ul class="nav navbar-nav navbar-right">
                <li><a>欢迎您,小夏</a>
                </li>
                <li><a href="#">安全退出</a>
                </li>
            </ul>--%>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-2">
            <a href="#" class="list-group-item active">动态设置</a>
            <a href="<%=request.getContextPath()%>/addBlogPage" class="list-group-item">添加博客</a>
            <a href="<%=request.getContextPath()%>/toGlBlog" class="list-group-item">管理博客</a>
            <a href="<%=request.getContextPath()%>/type" class="list-group-item">编辑分类</a>
        </div>
        <div class="col-sm-10">
            <ol class="breadcrumb">
                <li class="active">动态设置
                </li>
                <li class="active">管理博客
                </li>

            </ol>

            <div class="panel panel-default">
                <div class="panel-heading">
                    管理
                </div>
                <div class="panel-body" style="">

                    <table class="table">
                        <caption><h3></h3></caption>
                        <thead>
                        <tr>
                            <th>标题</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="blogs" items="${blogs}">
                            <tr>
                               <td style="font-size: 30px;"><a href="<%=request.getContextPath()%>/toSeeBlog?id=${blogs.id}">${blogs.blogTitle}</a></td>
                                <td>
                                   <a href="<%=request.getContextPath()%>/toUpdateBlog?id=${blogs.id}"><button class="btn btn-info">修改</button></a>
                                   <a href="<%=request.getContextPath()%>/deleteBlog?id=${blogs.id}"><button class="btn btn-info">删除</button></a>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
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
