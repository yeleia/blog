<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html><%@ page language="java" contentType="text/html; charset=UTF-8"
                        pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script>
        console.log(1);
    </script>
    <script src="//cdn.bootcss.com/jquery/3.1.0/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/moment.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/daterangepicker-bs3.css"/>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/select2.min.css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/static/js/select2.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/static/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
          function add() {
              var code=$("#code").val();
              var userName=$("#userName").val();
              var status=$('input:radio[name="status"]:checked').val();
              var role=$("#role").val();
              var startime=$("#startDate").val();
              var endtime=$("#endDate").val();
              if(code==null||code==""||userName==null||userName==""||
              status==null||status==""||role==null||role==""||startime==null||startime==""
             || endtime==null||endtime==""){
                  alert("请输入完整信息！");
              }else{
                  $.ajax({
                      url:"${pageContext.request.contextPath}/add",
                      type:"post",
                      dataType:"json",
                      data:{
                          code:code, userName:userName,status:status,role:role,startime:startime,endtime:endtime
                      },
                      success:function (result) {
                          if (result.success==true){

                              alert("该编码已被使用！");

                          }else{
                              if(confirm("添加成功！"))

                                  window.location.href="index";


                          }

                      }

                  })
              }
          }
    </script>

   <%-- <script type="text/javascript">
        function deleteUser() {
            var code=$("#code").val();
            var userName=$("#userName").val();
            var status=$("#status").val();
            var role=$("#role").val();
            var startime=$("#startDate1").val();
            var endtime=$("#endDate1").val();
            $.ajax({
                url:"${pageContext.request.contextPath}/delete",
                type:"post",
                dataType:"json",
                data:{
                    code:code, userName:userName,status:status,role:role,startime:startime,endtime:endtime
                },
                success:function (result) {
                    if (result.success==true){
                        if(confirm("添加成功！"))
                        window.location.href="index";
                    }

                }


            })




        }






    </script>--%>





</head>
<body>
<center><p style="margin-top: 50px;font-size:60px;color: #2aabd2">账户管理</p></center>
<%--//<p style="margin-left: 65px;color: #1b6d85;margin-top: 30px;font-size: 30px">首页</p>--%>
<%--<div class="container" style="margin-top: 20px;background-color: #d1d1cc" >
    <button type="button" class="btn btn-default" style="margin-left: 15px;background-color: #b8bbcc"><a href="add.jsp">增加</a></button> /
    <button type="button" class="btn btn-default" style="margin-left: 15px;background-color: #b8bbcc">删除</button> /
    <button type="button" class="btn btn-default" style="margin-left: 15px;background-color: #b8bbcc">修改</button>
</div>--%>
<div class="container"style="margin-top: 20px;">
    <%--<ul class="list-inline">
        <li style="margin-left: 0px"><input type="text" id="code1" class="form-control" placeholder="number"></li>
        <li><input type="text" class="form-control" id="userName1" placeholder="username"></li>
        <li><input type="radio" name="status" id="status1">封存</li>
        <li><input type="radio" name="status" id="status2">启封</li>
        <li><input type="text" class="form-control" id="startDate" value="03/05/2017"></li>
        <li><input type="text" class="form-control" id="endDate" value="03/05/2017"></li>
        <li><select class="js-example-basic-single" id="role1">
            <option>管理员</option>
            <option>超级管理员</option>
            <option>普通用户</option>
        </select></li>

    </ul>--%>
   <%-- <button type="submit" id="search" class="btn btn-table" onclick="search()">搜索</button>--%>
    <button class="btn btn-table" data-toggle="modal" data-target="#myModal">添加 </button>   <br><br>
    <table id="example" class="display" cellspacing="0" width="100%" <%--class="table table-striped "--%>>
        <thead>
        <tr>
            <th>编码</th>
            <th>姓名</th>
            <th>状态</th>
            <th>创建时间</th>
            <th>最后登录</th>
            <th>账号类型</th>
            <th>操作</th>
        </tr>


        </thead>
        <tbody id="bodyResult">
<c:forEach var="user" items="${user}">
        <tr>
        <th>${user.code}</th>
        <th>${user.userName}</th>
        <th>${user.status}</th>
        <th>${user.startime}</th>
        <th>${user.endtime}</th>
        <th>${user.role}</th>
        <th><button class="btn btn-table" data-toggle="modal" data-target="#${user.code}">修改</button>
            <button class="btn btn-table"><a href="${pageContext.request.contextPath}/delete?id=${user.code}">删除</a> </button></th>


<!-- 模态框（Modal） -->
<div class="modal fade" id="${user.code}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel1">
                   更改用户信息
                </h4>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/update" method="post">
                    编码：<input type="text" id="codea" name="code" class="form-control" style="width: 30%" value="${user.code}" onfocus=this.blur()><br>
                    用户名：<input type="text" value="${user.userName}" id="userNamea" name="userName" class="form-control" style="width: 30%"><br>
                    <input type="radio" <%--id="statusa"--%> name="status" value="封存">封存
                    <input type="radio" checked <%--id="statusa"--%> name="status" value="启封">启封<br><br>
                    角色：
                    <select class="js-example-basic-single" id="rolea" name="role">
                        <option value="管理员">管理员</option>
                        <option value="超级管理员">超级管理员</option>
                        <option value="普通用户">普通用户</option>
                    </select><br><br>
                    创建时间：
                    <input type="text" name="startime" class="form-control" id="startDate1" value="${user.startime}" style="width: 30%"><br>
                    最后登录时间：
                    <input type="text" name="endtime" class="form-control" id="endDate1" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>" style="width: 30%">
                    <br>
                    <button type="submit" class="btn btn-primary" <%--onclick="updateUser()"--%>>
                        提交
                    </button>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
   <%-- <script type="text/javascript">
        function updateUser(){
            var code=$("#codea").val();
            var userName=$("#userNamea").val();
            var status=$('input:radio[name="status1"]:checked').val();
            var role=$("#rolea").val();
            var startime=$("#startDate1").val();
            var endtime=$("#endDate1").val();
            if(
                    status==null||status==""
            ){
                alert("请输入完整信息！");
            }else{
                $.ajax({
                    url:"${pageContext.request.contextPath}/update",
                    type:"post",
                    dataType:"json",
                    data:{
                        code:code, userName:userName,status:status,role:role,startime:startime,endtime:endtime
                    },
                    success:function (result) {
                        if (result.success==true){

                            alert("该编码已被使用！");

                        }else{
                            if(confirm("更新成功！"))

                                window.location.href="index";
                        }

                    }

                })
            }
        }
    </script>--%>
        </tr>

    </c:forEach>

        </tbody>
    </table>

</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    添加新用户
                </h4>
            </div>
            <div class="modal-body">
                <form <%--action="${pageContext.request.contextPath}/add" method="post"--%>>
                    编码：<input type="text" id="code" name="code" class="form-control" style="width: 30%"><br>
                    用户名：<input type="text" id="userName" name="userName" class="form-control" style="width: 30%"><br>
                    <input type="radio" id="status" name="status" value="封存" checked>封存
                    <input type="radio"  id="status" name="status" value="启封">启封<br><br>
                    角色：
                    <select class="js-example-basic-single" id="role" name="role">
                        <option value="管理员">管理员</option>
                        <option value="超级管理员">超级管理员</option>
                        <option value="普通用户">普通用户</option>
                    </select><br><br>
                    创建时间：
                    <input type="text" name="startime" class="form-control" id="startDate" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%> "style="width: 30%"><br>
                    最后登录时间：
                    <input type="text" name="endtime" class="form-control" id="endDate" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>" style="width: 30%">
                    <br>
                    <button type="button" class="btn btn-primary" onclick="add()">
                        提交
                    </button>

                    </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->



<script type="text/javascript">
    $(document).ready(function() {
        $(".js-example-basic-single").select2();
    });
</script>
<script type="text/javascript">
    /*$("#example").DataTable({
        "searching":false,
        "bLengthChange":false,
        "bPaginate":false,
        ajax:{

        }
    })*/
    $(document).ready(function() {
        $('#example').DataTable( {
            "pagingType": "full_numbers"
        } );
    } );

</script>


<script type="text/javascript">
    $(document).ready(function() {

        $('#startDate').daterangepicker({
            singleDatePicker: true,

            startDate: moment().subtract(6, 'days')
        });
        $('#endDate').daterangepicker({
            singleDatePicker: true,

            startDate: moment()
        });
        updateConfig();
        function updateConfig() {
            var options = {};
            if ($('#singleDatePicker').is(':checked'))
                options.singleDatePicker = true;

            if ($('#showDropdowns').is(':checked'))
                options.showDropdowns = true;
            if ($('#showWeekNumbers').is(':checked'))
                options.showWeekNumbers = true;
            if ($('#showISOWeekNumbers').is(':checked'))
                options.showISOWeekNumbers = true;
            if ($('#timePicker').is(':checked'))
                options.timePicker = true;

            if ($('#timePicker24Hour').is(':checked'))
                options.timePicker24Hour = true;
            if ($('#timePickerIncrement').val().length && $('#timePickerIncrement').val() != 1)
                options.timePickerIncrement = parseInt($('#timePickerIncrement').val(), 10);
            if ($('#timePickerSeconds').is(':checked'))
                options.timePickerSeconds = true;

            if ($('#autoApply').is(':checked'))
                options.autoApply = true;
            if ($('#dateLimit').is(':checked'))
                options.dateLimit = { days: 7 };
            if ($('#ranges').is(':checked')) {
                options.ranges = {
                    'Today': [moment(), moment()],
                    'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                    'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                    'This Month': [moment().startOf('month'), moment().endOf('month')],
                    'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                };
            }
            if ($('#locale').is(':checked')) {
                $('#rtl-wrap').show();
                options.locale = {
                    direction: $('#rtl').is(':checked') ? 'rtl' : 'ltr',
                    format: 'YYYY-MM-DD',
                    separator: ' - ',
                    applyLabel: 'Apply',
                    cancelLabel: 'Cancel',
                    fromLabel: 'From',
                    toLabel: 'To',
                    customRangeLabel: 'Custom',
                    daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr','Sa'],
                    monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                    firstDay: 1
                };
            } else {
                $('#rtl-wrap').hide();
            }
            if (!$('#linkedCalendars').is(':checked'))
                options.linkedCalendars = false;
            if (!$('#autoUpdateInput').is(':checked'))
                options.autoUpdateInput = false;
            if (!$('#showCustomRangeLabel').is(':checked'))
                options.showCustomRangeLabel = false;
            if ($('#alwaysShowCalendars').is(':checked'))
                options.alwaysShowCalendars = true;
            if ($('#parentEl').val().length)
                options.parentEl = $('#parentEl').val();
            if ($('#startDate').val().length)
                options.startDate = $('#startDate').val();
            if ($('#endDate').val().length)
                options.endDate = $('#endDate').val();

            if ($('#minDate').val().length)
                options.minDate = $('#minDate').val();
            if ($('#maxDate').val().length)
                options.maxDate = $('#maxDate').val();
            if ($('#opens').val().length && $('#opens').val() != 'right')
                options.opens = $('#opens').val();
            if ($('#drops').val().length && $('#drops').val() != 'down')
                options.drops = $('#drops').val();
            if ($('#buttonClasses').val().length && $('#buttonClasses').val() != 'btn btn-sm')
                options.buttonClasses = $('#buttonClasses').val();
            if ($('#applyClass').val().length && $('#applyClass').val() != 'btn-success')
                options.applyClass = $('#applyClass').val();
            if ($('#cancelClas  s').val().length && $('#cancelClass').val() != 'btn-default')
                options.cancelClass = $('#cancelClass').val();
            $('#config-text').val("$('#demo').daterangepicker(" + JSON.stringify(options, null, '    ') + ", function(start, end, label) {\n  console.log(\"New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')\");\n});");
            $('#config-demo').daterangepicker(options, function(start, end, label) { console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')'); });

        }
    });
</script>
    <script type="text/javascript">
        $(document).ready(function() {

            $('#startDate1 ').daterangepicker({
                singleDatePicker: true,

                startDate: moment().subtract(6, 'days')
            });
            $('#endDate1 ').daterangepicker({
                singleDatePicker: true,

                startDate: moment()
            });
            updateConfig();
            function updateConfig() {
                var options = {};
                if ($('#singleDatePicker').is(':checked'))
                    options.singleDatePicker = true;

                if ($('#showDropdowns').is(':checked'))
                    options.showDropdowns = true;
                if ($('#showWeekNumbers').is(':checked'))
                    options.showWeekNumbers = true;
                if ($('#showISOWeekNumbers').is(':checked'))
                    options.showISOWeekNumbers = true;
                if ($('#timePicker').is(':checked'))
                    options.timePicker = true;

                if ($('#timePicker24Hour').is(':checked'))
                    options.timePicker24Hour = true;
                if ($('#timePickerIncrement').val().length && $('#timePickerIncrement').val() != 1)
                    options.timePickerIncrement = parseInt($('#timePickerIncrement').val(), 10);
                if ($('#timePickerSeconds').is(':checked'))
                    options.timePickerSeconds = true;

                if ($('#autoApply').is(':checked'))
                    options.autoApply = true;
                if ($('#dateLimit').is(':checked'))
                    options.dateLimit = { days: 7 };
                if ($('#ranges').is(':checked')) {
                    options.ranges = {
                        'Today': [moment(), moment()],
                        'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                        'This Month': [moment().startOf('month'), moment().endOf('month')],
                        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                    };
                }
                if ($('#locale').is(':checked')) {
                    $('#rtl-wrap').show();
                    options.locale = {
                        direction: $('#rtl').is(':checked') ? 'rtl' : 'ltr',
                        format: "YYYY-MM-DD",
                        toLabel: 'To',
                        customRangeLabel: 'Custom',
                        daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr','Sa'],
                        monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                        firstDay: 1
                    };
                } else {
                    $('#rtl-wrap').hide();
                }
                if (!$('#linkedCalendars').is(':checked'))
                    options.linkedCalendars = false;
                if (!$('#autoUpdateInput').is(':checked'))
                    options.autoUpdateInput = false;
                if (!$('#showCustomRangeLabel').is(':checked'))
                    options.showCustomRangeLabel = false;
                if ($('#alwaysShowCalendars').is(':checked'))
                    options.alwaysShowCalendars = true;
                if ($('#parentEl').val().length)
                    options.parentEl = $('#parentEl').val();
                if ($('#startDate').val().length)
                    options.startDate = $('#startDate').val();
                if ($('#endDate').val().length)
                    options.endDate = $('#endDate').val();

                if ($('#minDate').val().length)
                    options.minDate = $('#minDate').val();
                if ($('#maxDate').val().length)
                    options.maxDate = $('#maxDate').val();
                if ($('#opens').val().length && $('#opens').val() != 'right')
                    options.opens = $('#opens').val();
                if ($('#drops').val().length && $('#drops').val() != 'down')
                    options.drops = $('#drops').val();
                if ($('#buttonClasses').val().length && $('#buttonClasses').val() != 'btn btn-sm')
                    options.buttonClasses = $('#buttonClasses').val();
                if ($('#applyClass').val().length && $('#applyClass').val() != 'btn-success')
                    options.applyClass = $('#applyClass').val();
                if ($('#cancelClas  s').val().length && $('#cancelClass').val() != 'btn-default')
                    options.cancelClass = $('#cancelClass').val();
                $('#config-text').val("$('#demo').daterangepicker(" + JSON.stringify(options, null, '    ') + ", function(start, end, label) {\n  console.log(\"New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')\");\n});");
                $('#config-demo').daterangepicker(options, function(start, end, label) { console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')'); });

            }
        });
    </script>



</body>
</html>
