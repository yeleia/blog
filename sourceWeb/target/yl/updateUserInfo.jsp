<%--
  Created by IntelliJ IDEA.
  User: yelei
  Date: 17-5-5
  Time: 下午12:56
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/nav-common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/upload.css">
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

<div class="content col-lg-10 col-lg-offset-1">
    <h1>个人信息</h1>
    <div id="info">
        <form action="${pageContext.request.contextPath}/adminToUser?id=${user.id}" method="post">
            <label>昵称：</label>
            <input type="text" name="nikeName" value="${user.nikeName}" class="form-control">
            <br>
            <label>修改密码：</label>
            <button class="btn btn-warning" data-toggle="modal" data-target="#changePassword" type="button">
                修改密码</button>
            <br>
            <br>
            <label>权限：</label>
            <input type="text" name="power" value="${user.power}" class="form-control">
            <label>角色：</label>
            <input type="text" name="roler" value="${user.roler}" class="form-control">
            <label>职称：</label>
            <input type="text" name="job" value="${user.job}" class="form-control">
            <label>所在单位：</label>
            <input type="text" name="blongs" value="${user.blongs}" class="form-control">
            <label>联系电话：</label>
            <input type="text" name="phone" value="${user.phone}" class="form-control">
            <label>现居地址：</label>
            <input type="text" name="adress" value="${user.adress}" class="form-control">
            <br>
            <button type="submithh" class="btn btn-success">确认保存</button>
            <!--模态框-->
            <div class="modal fade" id="changePassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form action="${pageContext.request.contextPath}/updatePa?id=${user.id}" method="post">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">修改密码</h4>
                            </div>
                            <div class="modal-body">
                                <label>新密码：</label>
                                <input type="password"  name="password" class="form-control">
                                <label>确认密码：</label>
                                <input type="password" class="form-control">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                <button type="submit" class="btn btn-primary">确认修改</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </form>

    </div>
</div>


</body>
</html>
