<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="btbp.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<link rel="apple-touch-icon" sizes="76x76" href="/BTBP/resources/main/teamup-icon.png">
	<link rel="icon" href="/BTBP/resources/main/teamup-icon.png">
    <title>BTBP - Best Teamwork Best Project</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<link rel="stylesheet" href="/BTBP/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="/BTBP/resources/plugins/fullcalendar/fullcalendar.min.css">
<link rel="stylesheet" href="/BTBP/resources/plugins/fullcalendar/fullcalendar.print.css" media="print">
<link rel="stylesheet" href="/BTBP/resources/css/AdminLTE.min.css">
<link rel="stylesheet" href="/BTBP/resources/css/skins/skin-purple.min.css">
<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/BTBP/resources/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="/BTBP/resources/plugins/fastclick/fastclick.js"></script>
<script src="/BTBP/resources/js/app.min.js"></script>
<script src="/BTBP/resources/js/demo.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="/BTBP/resources/plugins/fullcalendar/fullcalendar.js"></script>
<style type="text/css">
		@import url('https://fonts.googleapis.com/earlyaccess/hanna.css');
		*{font-family: 'Hanna', sans-serif;}
</style>
<script>
$(function () {
	
	$('li').removeClass('active');
	$('#ProjectTool').addClass('active');
	  
    function ini_events(ele) {
      ele.each(function () {

        var eventObject = {
          title: $.trim($(this).text()) // use the element's text as the event title
        };

        $(this).data('eventObject', eventObject);

        $(this).draggable({
          zIndex: 1070,
          revert: true, // will cause the event to go back to its
          revertDuration: 0  //  original position after the drag
        });

      });
    }

    ini_events($('#external-events div.external-event'));

    // -----------------------------------------------------------------
    
    var date = new Date();
    var d = date.getDate(),
        m = date.getMonth(),
        y = date.getFullYear();
    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      buttonText: {
        today: 'today',
        month: 'month',
        week: 'week',
        day: 'day'
      },
      // --------------등록된 이벤트----------------------------------------------------
      events: [
        <c:forEach items='${jList}' var='JobVO'>
        {
            title: '${JobVO.jobTitle}',
            content : '${JobVO.jobContent}',
            start: new Date('${JobVO.startDate}'),
            end: new Date('${JobVO.endDate}'),
            allDay: true,
            <c:choose>
		        <c:when test="${JobVO.jobType eq 'gantt'}">
		    		url: 'JobInfo.do?jobNo=${JobVO.jobNo}',	
		    		backgroundColor: "#47C83E",
		       		borderColor: "#47C83E"
		    	</c:when>
		    	<c:when test="${JobVO.jobType eq 'milestone'}">
		    		url: 'JobInfo.do?jobNo=${JobVO.jobNo}',	
		        	backgroundColor: "#008299",
		            borderColor: "#008299"
		    	</c:when>
		    	<c:otherwise>
		        	url: 'JobInfo.do?jobNo=${JobVO.jobNo}',	
		        	backgroundColor: "#FF8224",
		            borderColor: "#FF8224"
		    	</c:otherwise>
        	</c:choose>
          },
        </c:forEach>
      ],
      editable: true,
      droppable: true,
      drop: function (date, allDay) {

        var originalEventObject = $(this).data('eventObject');

        var copiedEventObject = $.extend({}, originalEventObject);

        copiedEventObject.start = date;
        copiedEventObject.allDay = allDay;
        copiedEventObject.backgroundColor = $(this).css("background-color");
        copiedEventObject.borderColor = $(this).css("border-color");

        $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

        if ($('#drop-remove').is(':checked')) {
          $(this).remove();
        }
      }
    });

    var currColor = "#3c8dbc"; 
    var colorChooser = $("#color-chooser-btn");
    $("#color-chooser > li > a").click(function (e) {
      e.preventDefault();
      currColor = $(this).css("color");
      $('#add-new-event').css({"background-color": currColor, "border-color": currColor});
    });
    $("#add-new-event").click(function (e) {
      e.preventDefault();
      var val = $("#new-event").val();
      if (val.length == 0) {
        return;
      }

      var event = $("<div />");
      event.css({"background-color": currColor, "border-color": currColor, "color": "#fff"}).addClass("external-event");
      event.html(val);
      $('#external-events').prepend(event);

      ini_events(event);

      $("#new-event").val("");
    });
  });
</script>
</head>
<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

	<%@include file="header.jsp" %>
	<%@include file="menu.jsp" %>

  <div class="content-wrapper">
  
    <section class="content-header"></section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-primary">
            <div class="box-body no-padding">
              <div id="calendar"></div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
       
<%@include file="footer.jsp" %>
<div class="control-sidebar-bg"></div>
</div>

</body>
</html>
