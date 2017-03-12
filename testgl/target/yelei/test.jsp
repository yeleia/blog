<%--
  Created by IntelliJ IDEA.
  User: yelei
  Date: 17-3-5
  Time: 下午5:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <title>A date range picker for Bootstrap</title>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="all" href="static/css/daterangepicker.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/js/moment.js"></script>
    <script type="text/javascript" src="static/js/daterangepicker.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body style="margin: 60px 0">

<div class="container">

    <h1 style="margin: 0 0 20px 0">Configuration Builder</h1>

    <div class="well configurator">

        <form>
            <div class="row">

                <div class="col-md-4">



                    <div class="form-group">
                        <label for="startDate">startDate</label>
                        <input type="text" class="form-control" id="startDate" value="07/01/2015">
                    </div>

                    <div class="form-group">
                        <label for="endDate">endDate</label>
                        <input type="text" class="form-control" id="endDate" value="07/15/2015">
                    </div>



                </div>
            </div>
        </form>

    </div>



</div>

<style type="text/css">

    .demo i {
        position: absolute; bottom: 10px; right: 24px; top: auto; cursor: pointer;
    }
</style>

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

