<%--
  Created by IntelliJ IDEA.
  User: yelei
  Date: 17-4-15
  Time: 上午11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <link rel="stylesheet" href="<%request.getContextPath();%>/static/css/bootstrap.min.css" />
    <link rel="stylesheet" href="<%request.getContextPath();%>/static/css/index2.css" />
    <title></title>
</head>

<body>
<header>
    <div class="container">
        <div class="row">
            <div class="col-md-10" style="height:40px;margin-top: 15px">
                <span class="head"><a href="<%=request.getContextPath()%>/seeType?string=${blog.blogType}" style="font-size: 30px">返回</a> </span>
            </div>
          <%--  <div class="col-md-2">
                <span class="head"><a class="manage" href="#">CMS</a><a class="exit" href="#">EXIT</a></span>
            </div>--%>
        </div>
    </div>
</header>
<section style="height: auto">
  <center><div style="height:40px;width:600px;float: inherit;margin-top:50px;font-size: 60px">${blog.blogTitle}</div></center>
    <div style="margin-top: 20px;margin-left: 150px;font-size: 20px;width: 1000px;height: auto">
        <div>&nbsp;&nbsp;${blog.blogContent}</div>
        <div style="margin-top: 40px;float: right">发表日期：<fmt:formatDate  value="${blog.blogDate}" type="both" pattern="yyyy-MM-dd" />
        &nbsp;&nbsp;&nbsp;&nbsp;类别：${blog.blogType}</div>
    </div>

</section>
<aside>

</aside>
<script type="text/javascript" src="<%request.getContextPath();%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%request.getContextPath();%>/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%request.getContextPath();%>/static/js/index2.js"></script>
</body>
</html>
