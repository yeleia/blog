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
<script type="text/javascript">
    function beforeSubmit() {
        var blogTitle=document.getElementById("blogTitle");
        var blogContent=document.getElementById("container");
        var blogType=document.getElementById("blogType");
        if (blogTitle==""||blogContent==""||blogType==""){
            alert("请输入完整的信息")
            return false;
        }else {
            return true;
        }

    }
</script>
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
                <li class="active"><a class="icon-bar" href="#">动态设置</a>
                </li>
                <li><a class="icon-bar" href="<%request.getContextPath();%>/Index">首页</a> </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <%--  <li><a>欢迎您,小夏</a>
                </li>--%>
                <li><a href="#">安全退出</a>
                </li>
            </ul>
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
                <li class="active">修改博客
                </li>
            </ol>

            <div class="panel panel-default">
                <div class="panel-heading">
                    添加
                </div>
                <div class="panel-body">
                    <form action="<%=request.getContextPath()%>/updateBlog?id=${blog.id}" method="post">
                        标题：<input id="blogTitle" type="text" name="blogTitle" value="${blog.blogTitle}"><br><Br>
                        <textarea style="height:450px;" id="container" name="blogContent" type="text/plain">
                            ${blog.blogContent}
                        </textarea><br>
                       <h4>分类：<select  name="blogType"<%--id="blogType"--%> class="btn btn-success">
                           <c:forEach items="${types}" var="types">
                        <option value="${blog.blogType}" id="blogType">${types.blogType}</option>
                           </c:forEach>
                    </select>
                        <input type="submit"  class="btn btn-success" style="float:right;">
                       </h4>
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
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.js"> </script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
    var ue = UE.getEditor('container');
</script>

</body>

</html>
