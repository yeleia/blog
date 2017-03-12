<!DOCTYPE html><%@ page language="java" contentType="text/html; charset=UTF-8"
                        pageEncoding="UTF-8"  import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="static/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="static/js/moment.js"></script>
    <script type="text/javascript" src="static/js/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="static/css/daterangepicker-bs3.css"/>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
    <link href="static/css/select2.min.css" rel="stylesheet"/>
    <script src="static/js/select2.min.js"></script>
    <link href="static/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
    <script src="static/js/jquery.dataTables.min.js"></script>
</head>
<body>
<p style="font-size:30px;color: #1b6d85;margin-left: 40px;margin-top: 40px"><a href="index.jsp">首页</a> </p>
<div class="container">
    <form action="${pageContext.request.contextPath}/add" method="post">
    编码：<input type="text" name="code" class="form-control" style="width: 30%"><br>
    用户名：<input type="text" name="userName" class="form-control" style="width: 30%"><br>
    <input type="radio" name="status">封存
    <input type="radio" name="status">启封<br><br>
    角色：
        <select class="js-example-basic-single" name="role">
            <option value="a">管理员</option>
            <option value="b">超级管理员</option>
            <option value="c">普通用户</option>
        </select><br><br>
    创建时间：
    <input type="text" name="startime" class="form-control" id="startDate" value="<%=(new java.util.Date())%>" style="width: 30%"><br>
    最后登录时间：
    <input type="text" name="endtime" class="form-control" id="endDate" value="<%=(new java.util.Date())%>" style="width: 30%">
        <input type="submit" name="提交">
    </form>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $(".js-example-basic-single").select2();
    });
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
                    format: 'MM/DD/YYYY HH:mm',
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
            if ($('#cancelClass').val().length && $('#cancelClass').val() != 'btn-default')
                options.cancelClass = $('#cancelClass').val();
            $('#config-text').val("$('#demo').daterangepicker(" + JSON.stringify(options, null, '    ') + ", function(start, end, label) {\n  console.log(\"New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')\");\n});");
            $('#config-demo').daterangepicker(options, function(start, end, label) { console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')'); });

        }
    });
    </script>

</body>
</html>