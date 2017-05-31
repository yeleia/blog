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
            <div class="col-md-10" style="height: 40px">
             <a href="<%=request.getContextPath()%>/Index"><button style="margin-top: 6px;width: 60px;color: #1b6d85">首页</button></a>
            </div>
            <%--<div class="col-md-2">
                <span class="head"><a class="manage" href="#">CMS</a><a class="exit" href="#">EXIT</a></span>
            </div>--%>
        </div>
    </div>
</header>
<div class="container">
    <div class="row">
        <div class="col-lg-12 img">
        </div>
    </div>
</div>
<section>
    <div class="container">
        <div class="row">
            <h3>欢迎来到我的博客</h3>
            <main class="col-md-8">
               <c:forEach var="blogs" items="${blogs}">
                <article class="post">
                    <div class="post-head">
                        <h3>${blogs.blogTitle}</h3>
                    </div>
                    <div class="post-content">
                        <p>&nbsp;&nbsp;${blogs.blogContent}.....<a href="${pageContext.request.contextPath}/showBlogByType?id=${blogs.id}">阅读全文</a></p>
                    </div>
                    <div style="margin-top: 20px;margin-left: 20px">
                    <p><span>发布时间：<fmt:formatDate  value="${blogs.blogDate}" type="both" pattern="yyyy-MM-dd" /></span>
                        <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <span>类别：${blogs.blogType}</span>
                    </p>
                    </div>
                </article>
                   </c:forEach>
                <center>
                    <ul class="pagination">

                        ${pageCode}
                    </ul>

                </center>
            </main>
            <aside class="col-md-4">
                <div class="widget">
                    <h4>个人资料</h4>
                    <div class="widget-img">
                        <img src="<%request.getContextPath();%>/static/img/2.png" />
                    </div>
                    <div class="widget-content">
                        <p>昵称：${user.nikeName}</p>
                        <p>个人介绍：${user.title}</p>
                    </div>

                </div>
                <div class="widget">
                    <center><h4>分类</h4></center>
                    <div class="widget-content">
                        <c:forEach items="${types}" var="types">
                        <a href="<%=request.getContextPath()%>/seeType?string=${types.blogType}"> <center><p>${types.blogType}(${types.count})</p></center></a>
                        </c:forEach>
                        <a href="<%=request.getContextPath()%>/seeType?string=无"><center><p>无类型(${i})</p></center></a>

                    </div>
                </div>
            </aside>
        </div>
    </div>
</section>
<aside>

</aside>
<script type="text/javascript" src="<%request.getContextPath();%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%request.getContextPath();%>/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%request.getContextPath();%>/static/js/index2.js"></script>
</body>
</html>
