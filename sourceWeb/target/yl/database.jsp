<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--
  Created by IntelliJ IDEA.
  User: yelei
  Date: 17-5-5
  Time: 下午2:23
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
    <title>档案库</title>
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
    <div class="head">
        <div class="intro">
            <img src="${pageContext.request.contextPath}/static/img/user.svg" alt="" class="headimg">
        </div>
        <div class="property">
            <h2>${user.nikeName}</h2>
            <div class="list">
                <div class="item">
                    <p class="number">${user.fileCount}</p>
                    <p>上传数</p>
                </div>
                <div class="item">
                    <p class="number">${user.projectCount}</p>
                    <p>课题数</p>
                </div>
                <div class="item">
                    <p class="number">${user.integration}</p>
                    <p>积分</p>
                </div>
            </div>
        </div>
       <a href="${pageContext.request.contextPath}/userAddFile"> <button class="btn btn-warning btn-lg" id="uploadBtn"><span class="glyphicon glyphicon-open"></span>&nbsp;上传论文</button></a>
        <a href="${pageContext.request.contextPath}/userAddProject"><button class="btn btn-warning btn-lg" id="addBtn"><span class="glyphicon glyphicon-plus"></span>&nbsp;添加课题</button></a>
    </div>
    <div class="doc">
        <h2>${user.nikeName}的论文</h2>

        <table class="table table-responsive">
            <tr>

                <th>论文标题</th>
                <th>期刊名称</th>
                <th>发表时间</th>
                <th>论文类别</th>
                <th>论文积分</th>
                <th>操作</th>
            </tr>
            <c:forEach var="papers" items="${papers}">
            <tr>

                <td>${papers.title}</td>
                <td>${papers.magazine}</td>
                <td><fmt:formatDate  value="${papers.dateTime}" type="both" pattern="yyyy-MM-dd" /></td>
                <td>${papers.category}</td>
                <td>${papers.integration}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/detail?id=${papers.id}"><button class="btn btn-info btn-sm" title="查看"><span class="glyphicon glyphicon-search" ></span></button></a>
                    <a href="${pageContext.request.contextPath}/downA?id=${papers.id}"><button class="btn btn-success btn-sm" title="下载"><span class="glyphicon glyphicon-save" ></span></button></a>
                    <a href="${pageContext.request.contextPath}/deleteB?id=${papers.id}"><button class="btn btn-danger btn-sm" title="删除"><span class="glyphicon glyphicon-trash"></span></button></a>

                </td>

            </tr>
            </c:forEach>
        </table>
        <h2>${user.nikeName}的课题项目</h2>
        <table class="table table-responsive">
            <tr>

                <th>项目标题</th>
                <th>立题时间</th>
                <th>结题时间</th>
                <th>来源单位</th>
                <th>到款经费</th>
                <th>级别分值</th>
                <th>经费分值</th>
                <th>本人角色</th>
                <th>参与度</th>
                <th>课题积分</th>
                <th>操作</th>
            </tr>
            <c:forEach var="projects" items="${projects}">
            <tr>
                <td>${projects.projectTitle} </td>
                <td><fmt:formatDate  value="${projects.startTime}" type="both" pattern="yyyy-MM-dd" /></td>
                <td><fmt:formatDate  value="${projects.endTime}" type="both" pattern="yyyy-MM-dd" /></td>
                <td>${projects.from}</td>
                <td>${projects.money}</td>
                <td>${projects.score}</td>
                <td>${projects.mark}</td>
                <td>${projects.myRole}</td>
                <td>${projects.involvement}</td>
                <td>${projects.integration}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/toUpdateProject?id=${projects.id}"><button class="btn btn-info btn-sm" title="查看">
                        <span class="glyphicon glyphicon-search" ></span>
                    </button>
                    </a>
                   <button class="btn btn-info btn-sm" title="修改" data-toggle="modal" data-target="#change">
                        <span class="glyphicon glyphicon-pencil"></span>
                    </button>

                    <a href="${pageContext.request.contextPath}/deleteProject?id=${projects.id}"> <button class="btn btn-danger btn-sm" title="删除">
                        <span class="glyphicon glyphicon-trash"></span>
                    </button>
                       </a>
                </td>
            </tr>
                <!--上传文件模态框-->
                <div class="modal fade" id="change" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <form action="${pageContext.request.contextPath}/updateProject?id=${projects.id}" method="post" enctype="multipart/form-data">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">修改信息</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>课题名</label>
                                        <input type="text" name="projectTitle" class="form-control" placeholder="请输入项目名称" value="${projects.projectTitle}">
                                    </div>
                                    <div class="form-group">
                                        <label>来源单位</label>
                                        <input type="text" name="from" class="form-control" placeholder="来源单位" value="${projects.from}">
                                    </div>
                                    <div class="form-group">
                                        <label>到款经费</label>
                                        <input type="text" name="money" class="form-control" placeholder="到款经费" value="${projects.money}">
                                    </div>
                                    <div class="form-group">
                                        <label>级别分值</label>
                                        <input type="text" name="score" class="form-control" placeholder="级别分值" value="${projects.score}">
                                    </div>
                                    <div class="form-group">
                                        <label>经费分值</label>
                                        <input type="text" name="mark" class="form-control" placeholder="经费分值"value="${projects.mark}">
                                    </div>
                                    <div class="form-group">
                                        <label>本人角色</label>
                                        <input type="text" name="myRole" class="form-control" placeholder="本人角色" value="${projects.myRole}">
                                    </div>
                                    <div class="form-group">
                                        <label>参与度</label>
                                        <input type="text" name="involvement" class="form-control" placeholder="参与度" value="${projects.involvement}">
                                    </div>
                                    <div class="form-group">
                                        <label>课题积分</label>
                                        <input type="text" name="integration" class="form-control" placeholder="课题积分" value="${projects.integration}">
                                    </div>
                                    <div class="form-group">
                                        <label>立题时间</label>
                                        <input type="text" name="startTime" class="form-control" placeholder="请输入开始时间" id="datetimepicker1"  data-date-format="yyyy-mm-dd">
                                    </div>
                                    <div class="form-group">
                                        <label>结题时间</label>
                                        <input type="text" name="endTime" class="form-control" placeholder="请输入结束时间" id="datetimepicker2" data-date-format="yyyy-mm-dd">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button type="submit" class="btn btn-warning">确认保存</button>
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
