<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%--
  Created by IntelliJ IDEA.
  User: yelei
  Date: 17-5-5
  Time: 下午7:25
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/search-bar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/database.css">
    <title>任务中心</title>
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
    <div class="doc">
        <h2>未完成的任务</h2>

        <table class="table table-responsive">
            <tr>

                <th>任务名</th>
                <th>截止时间</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${task}" var="task">
            <tr>

                <td>${task.title}</td>
                <td><fmt:formatDate  value="${task.endTime}" type="both" pattern="yyyy-MM-dd" /></td>
                <td>
                    <a href="${pageContext.request.contextPath}/loadTask?id=${task.id}"> <button class="btn btn-success btn-sm" title="下载任务表单"><span class="glyphicon glyphicon-save" ></span></button></a>
                    <button class="btn btn-info btn-sm" title="上传表单" data-toggle="modal" data-target="#uploadfile">
                        <span class="glyphicon glyphicon-open"></span>
                    </button>
                </td>
            </tr>
                <!--上传表单模态框-->
                <div class="modal fade" id="uploadfile" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <form action="${pageContext.request.contextPath}/upTask?id=${task.id}" method="post" enctype="multipart/form-data">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">上传文件</h4>
                                </div>
                                <div class="modal-body">
                                    <label>上传表单文件</label>
                                    <input type="file" name="file">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button type="submit"  class="btn btn-primary">确认上传</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </table>
        <h2>已完成的任务</h2>
        <table class="table table-responsive">
            <tr>

                <th>任务名</th>
                <th>提交时间</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${usesTasks}" var="usesTasks">
            <tr>


                <td>${usesTasks.fileName}</td>
                <td><fmt:formatDate  value="${usesTasks.uploadTime}" type="both" pattern="yyyy-MM-dd" /></td>
                <td>
                   <a href="${pageContext.request.contextPath}/deleteUserTask?id=${usesTasks.id}"> <button class="btn btn-success btn-sm" title="下载已填写的表单"><span class="glyphicon glyphicon-save" ></span></button></a>
                     <button class="btn btn-info btn-sm" title="重新上传文件" data-toggle="modal" data-target="#reupload">
                        <span class="glyphicon glyphicon-open"></span>
                    </button>

                </td>
            </tr>
                <div class="modal fade" id="reupload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <form action="${pageContext.request.contextPath}/updateUserTask?id=${usesTasks.id}" method="post" enctype="multipart/form-data">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="">上传文件</h4>
                                </div>
                                <div class="modal-body">
                                    <label>上传表单文件</label>
                                    <input name="file" type="file">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button type="submit" class="btn btn-primary">确认上传</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </table>

    </div>
</div>


<script>

</script>
</body>

</html>
