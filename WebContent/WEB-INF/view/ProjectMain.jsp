<%@page import="org.apache.velocity.runtime.directive.Include"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% int forCnt = 0; %>
<!DOCTYPE html>
<html>
<head>
	<link rel="apple-touch-icon" sizes="76x76" href="/BTBP/resources/main/teamup-icon.png">
	<link rel="icon" href="/BTBP/resources/main/teamup-icon.png">
    <title>TeamUP 팀업 - Communication is Everything</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<link rel="stylesheet" href="/BTBP/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="/BTBP/resources/css/AdminLTE.min.css">
<link rel="stylesheet" href="/BTBP/resources/css/skins/skin-purple.min.css">
<link rel="stylesheet" href="/BTBP/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/BTBP/resources/plugins/bootstrap/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="/BTBP/resources/js/app.min.js"></script>
<script src="/BTBP/resources/plugins/chartjs/Chart.js"></script>
<script src="/BTBP/resources/js/demo.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<style type="text/css">
@import url(https://fonts.googleapis.com/earlyaccess/notosanskr.css);

body,taple,div,p,h1,h2,h3,h4,h5,h6 {
   font-family: 'Noto Sans KR', serif;
}
</style>
<c:if test="${!kList.isEmpty()}">
<c:forEach var="JobVO" items="${kList}" varStatus="status1"> 
<c:choose>
<c:when test="${JobVO.jobStatus eq 'doing'}">
<c:set var="doingtotal" value="${JobVO.count }"/>
</c:when>
<c:when test="${JobVO.jobStatus eq 'todo'}">
<c:set var="todototal" value="${JobVO.count }"/>
</c:when>
<c:when test="${JobVO.jobStatus eq 'done'}">
<c:set var="donetotal" value="${JobVO.count }"/>
</c:when>
</c:choose>	
</c:forEach>
</c:if>   
<script type="text/javascript">
$(function(){

	/* ChartJS
	     * -------
	     * Here we will create a few charts using ChartJS
	     */
	    //Create the line chart
	    var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
		var pieChart = new Chart(pieChartCanvas);
		var PieData = [
		               {
		       		    value: ${donetotal},
		       		    color: "#00a65a",
		       		    highlight: "#00a65a",
		       		    label: "한 일"
		       		  },
		       		  {
		       		    value: ${doingtotal},
		       		    color: "#f39c12",
		       		    highlight: "#f39c12",
		       		    label: "하고 있는 일"
		       		  },
		       		  {
		       		    value: ${todototal},
		       		    color: "#3c8dbc",
		       		    highlight: "#3c8dbc",
		       		    label: "해야 할 일"
		       		  },
		
		 			];

		var pieOptions = {
				    //Boolean - Whether we should show a stroke on each segment
				    segmentShowStroke: true,
				    //String - The colour of each segment stroke
				    segmentStrokeColor: "#fff",
				    //Number - The width of each segment stroke
				    segmentStrokeWidth: 1,
				    //Number - The percentage of the chart that we cut out of the middle
				    percentageInnerCutout: 50, // This is 0 for Pie charts
				    //Number - Amount of animation steps
				    animationSteps: 100,
				    //String - Animation easing effect
				    animationEasing: "easeOutBounce",
				    //Boolean - Whether we animate the rotation of the Doughnut
				    animateRotate: true,
				    //Boolean - Whether we animate scaling the Doughnut from the centre
				    animateScale: false,
				    //Boolean - whether to make the chart responsive to window resizing
				    responsive: true,
				    // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
				    maintainAspectRatio: false,
				    // 화면에 보이는 검은색 탭 부분 출력
				  };
		 pieChart.Doughnut(PieData, pieOptions);
	    //-------------
	    //- BAR CHART -
	    //-------------
	    var barChartCanvas = $("#barChart").get(0).getContext("2d");
	    var barChart = new Chart(barChartCanvas);
	    var barChartData = {
		  	      labels: [${grade}],
		  	      datasets: [
			        {
			          label: "한 일",
			     	  fillColor: "rgba(210, 214, 222, 1)",
			 	      strokeColor: "rgba(210, 214, 222, 1)",
			          pointColor: "rgba(210, 214, 222, 1)",
			          pointStrokeColor: "#c1c7d1",
			          pointHighlightFill: "#fff",
			          pointHighlightStroke: "rgba(220,220,220,1)",
			          data: [${todo}]
			        },
			        {
			         	 label: "하고 있는 일",
			     	     fillColor: "rgba(60,141,188,0.9)",
			       	 	 strokeColor: "rgba(60,141,188,0.8)",
			      	     pointColor: "#3b8bba",
			       	     pointStrokeColor: "rgba(60,141,188,1)",
			       	     pointHighlightFill: "#fff",
			      	     pointHighlightStroke: "rgba(60,141,188,1)",
			     	     data: [${doing}]
			        },
			        {
				          label: "해야 할 일",
				          fillColor: "rgba(60,141,188,0.9)",
				          strokeColor: "rgba(60,141,188,0.8)",
				          pointColor: "#3b8bba",
				          pointStrokeColor: "rgba(60,141,188,1)",
				          pointHighlightFill: "#fff",
				          pointHighlightStroke: "rgba(60,141,188,1)",
				          data: [${done}]
				        }
			      ]
			    };
		    barChartData.datasets[1].fillColor = "#00a65a";
		    barChartData.datasets[1].strokeColor = "#00a65a";
		    barChartData.datasets[1].pointColor = "#00a65a";
	    var barChartOptions = {
	      //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
	      scaleBeginAtZero: true,
	      //Boolean - Whether grid lines are shown across the chart
	      scaleShowGridLines: true,
	      //String - Colour of the grid lines
	      scaleGridLineColor: "rgba(0,0,0,.05)",
	      //Number - Width of the grid lines
	      scaleGridLineWidth: 1,
	      //Boolean - Whether to show horizontal lines (except X axis)
	      scaleShowHorizontalLines: true,
	      //Boolean - Whether to show vertical lines (except Y axis)
	      scaleShowVerticalLines: true,
	      //Boolean - If there is a stroke on each bar
	      barShowStroke: true,
	      //Number - Pixel width of the bar stroke
	      barStrokeWidth: 2,
	      //Number - Spacing between each of the X value sets
	      barValueSpacing: 5,
	      //Number - Spacing between data sets within X values
	      barDatasetSpacing: 1,
	      //Boolean - whether to make the chart responsive
	      responsive: true,
	      maintainAspectRatio: true
	    };

	    barChartOptions.datasetFill = false;
	    barChart.Bar(barChartData, barChartOptions);
// 	  });
	    
	$('.paging').each(function(){
		if($(this).children().text() == <%=request.getParameter("pageNo")%>){
			$(this).addClass('active');
		}
	})
	
	$('.pMemEvt').click(function(){
		var friendId = $(this).parent().attr("id");
		var memberId = "${sessionScope.memberId}";
		if(friendId == memberId) {
			return;
		}
		window.open('ProjectMemberInfo.do?friendId='+friendId, 'projectMemInfo', "width=500, height=500, left=600, top=100, resizable=no, scrollbars=no, status=no;");
	});
	
	$('.pMem').hover(
			function(){$(this).css('background-color', '#FFFFE6')},
			function(){$(this).css('background-color', 'white')}
	);
	 
})
</script>
</head>
<body class="hold-transition skin-purple sidebar-mini">
<div class="wrapper">
<%@include file="header.jsp" %>
<%@include file="menu.jsp" %>

  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header"></section>

    <!-- Main content -->
    <section class="content">
      <!-- Info boxes -->
      <div class="row">
        <div class="col-md-12">
          <div class="box" style="display: none;" >
            <div class="box-header with-border">
              <h3 class="box-title">Monthly Recap Report</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-wrench"></i></button>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                  </ul>
                </div>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="row">
                <div class="col-md-8">
                  <p class="text-center">
                    <strong>Sales: 1 Jan, 2014 - 30 Jul, 2014</strong>
                  </p>
                  <div class="chart">
                    Sales Chart Canvas
                    <canvas id="salesChart" style="height: 180px;"></canvas>
                  </div>
                  <!-- /.chart-responsive -->
                </div>
                <!-- /.col -->
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <!-- Main row -->
      <div class="row">
               <div class="col-md-4">
          <!-- Info Boxes Style 2 -->
           <div class="box box-warning">
            <div class="box-header with-border">
              <h3 class="box-title">팀 전체 작업현황(칸반)</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="row">
                <div class="col-md-8">
                  <div class="chart-responsive">
                    <canvas id="pieChart" height="150"></canvas>
                  </div>
                  <!-- ./chart-responsive -->
                </div>
                <!-- /.col -->
                <div class="col-md-4">
                  <ul class="chart-legend clearfix">
                    <li><i class="fa fa-circle-o text-green"></i>  한 일<br/></li>
                    <li><i class="fa fa-circle-o text-yellow"></i>  하고 있는 일</li>
                    <li><i class="fa fa-circle-o text-blue"></i>  해야 할 일</li>
                  </ul>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer no-padding">
              <ul class="nav nav-pills nav-stacked">
                <li><a href="Kanban.do">한 일
                  <span class="pull-right text-green">${donetotal} 개</span></a></li>
                <li><a href="Kanban.do">하고 있는 일<span class="pull-right text-yellow">${doingtotal} 개</span></a>
                </li>
                <li><a href="Kanban.do">할 일
                  <span class="pull-right text-blue">${todototal} 개</span></a></li>
              </ul>
            </div>
            <!-- /.footer -->
          </div>
          <!-- /.box -->
          <!-- /.box -->
        <!-- /.col (LEFT) -->
        <div class="col-md-14" >
          <!-- BAR CHART -->
          <div class="box box-primary">
            <div class="box-header with-border" style="height:90px;">
              <h3 class="box-title">각 직책 별 작업현황</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="barChart" style="height:230px"></canvas>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
        <!-- /.col (RIGHT) -->
     
      </div>
      <!-- /.row -->
      
        <!-- Left col -->
        <div class="col-md-8">
             <!-- TABLE: LATEST ORDERS -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">최신 뉴스</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body" style="height: 407px;">
              <div class="table-responsive">
                <table class="table no-margin">
                  <thead>
                  <tr>
                    <th>멤버</th>
                    <th>제목</th>
                    <th>종류</th>
                    <th>날짜</th>
                    <th>파일</th>
                  </tr>
                  </thead>
                  <tbody>
                   <c:if test="${!bList.isEmpty()}">
                    <c:set var="stringPlus" value="...."/>
                  <c:forEach var="ProjectVO" items="${bList}">
                   <c:set var="boardtitle" value="${ProjectVO.boardTitle}"/>
                   <c:set var="boardtitleLength" value="${fn:length(boardtitle)}"/>
                   <c:if test="${boardtitleLength > '15' }">
                   <c:set var="boardtitle" value="${fn:substring(ProjectVO.boardTitle,0,15)}"/>  
                   <c:set var= "boardtitle" value="${boardtitle}${stringPlus}"/>
                   </c:if>
                  <tr>
                    <td>${ProjectVO.memberId}</td>
                    <td><a href="ProjectBoardDetail.do?boardNo=${ProjectVO.boardNo}&boardType=${ProjectVO.boardType}&pageNo=1" title="${ProjectVO.boardTitle}">${boardtitle}</a></td>
                    <td>
                    <c:choose>
                    <c:when test="${ProjectVO.boardType eq 'fileShare'}">
                    <span class="label label-success">파일공유</span></td>
                    </c:when>
                     <c:when test="${ProjectVO.boardType eq 'board'}">
                    <span class="label label-warning">게시판</span></td>
                    </c:when>
                    <c:when test="${ProjectVO.boardType eq 'version'}">
                    <span class="label label-danger">버전</span></td>
                    </c:when>
                    <c:when test="${ProjectVO.boardType eq 'notice'}">
                    <span class="label label-danger">공지사항</span></td>
                    </c:when>
                    </c:choose>
                    <td>
                      <div class="sparkbar" data-color="#00a65a" data-height="20">${ProjectVO.createDate}</div>
                    </td>
                    <td>
                   <c:if test="${ProjectVO.fileName ne null }">
                   <a href="fileDownload.do?boardNo=${ProjectVO.boardNo}">
								<button type="button" title="${ProjectVO.fileName}" class="btn btn-block btn-default btn-xs" style= "width: 30px; margin-left: 3px; display:inline-block;" >
									<i class="fa fa-save"></i>
								</button>
							</a>
					</c:if>		
                    </td>
                  </tr>
                  </c:forEach>
                  </c:if>
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
               <div class="box-footer clearfix">
               <c:if test="${!bList.isEmpty()}">
              <ul class="pagination pagination-sm no-margin pull-right">
                <li><a href="ProjectMain.do?projectNo=${projectNo}&pageNo=${pageList.prev}">&laquo;</a></li>
               <c:forEach var="j" begin="${pageList.sNo}" end="${pageList.eNo}" step="1">
                <li class=paging><a href="ProjectMain.do?projectNo=${projectNo}&pageNo=${j}">${j}</a></li>
                </c:forEach>
                <li><a href="ProjectMain.do?projectNo=${projectNo}&pageNo=${pageList.next}">&raquo;</a></li>
              </ul>
              </c:if>
            </div>
            </div>
             <!-- BAR CHART -->
          <!-- /.box -->
        </div>
        <!-- /.col -->
          <!-- MAP & BOX PANE -->
          <!-- 최근 멤버 List~!!!! @@@@@@@@@@@@@@@@@@@@@ -->
          <div class="row">
            <!-- /.col -->
            <div class="col-md-12">
              <!-- USERS LIST -->
              <div class="box box-danger">
                <div class="box-header with-border">
                  <h3 class="box-title">최근 멤버</h3>
                  <div class="box-tools pull-right">
                    <span class="label label-danger">${MemberCount} New Members</span>
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>
                    </button>
                  </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                              <ul class="users-list clearfix">
                    <c:forEach var="ProjectMemberVO" items="${pList}" begin="0" end="3" step="1">
                    	<% forCnt++; %>
	                    <li id="${ProjectMemberVO.memberId}" class="pMem" style="cursor: pointer;">
	                    	<c:choose>
	                    		<c:when test="${ProjectMemberVO.memberImageName != null}">
	                    			<img src="/BTBP/resources/upload/Members/${ProjectMemberVO.memberImageName }"  style="width:100px;  height:100px;" class="img-circle img-raised pMemEvt" >
	                    		</c:when>
	                    		<c:otherwise>
	                    			<img src="/BTBP/resources/assets/img/logo.png" style="width:100px;  height:100px;" class="img-circle img-raised pMemEvt" >
	                    		</c:otherwise>
	                    	</c:choose>
	                      <span class="users-list-name pMemEvt">${ProjectMemberVO.memberName } ${ProjectMemberVO.memberRank } (${ProjectMemberVO.memberCompany })</span>
	                      <span class="users-list-date pMemEvt">${ProjectMemberVO.grade }</span>
	                    </li>
                    </c:forEach>
                  </ul>
                  <!-- /.users-list -->
                </div>
                <!-- /.box-body -->
                <div class="box-footer text-center">
                  <a href="ProjectMember.do" class="uppercase">View All Users</a>
                </div>
                <!-- /.box-footer -->
              </div>
              <!--/.box -->
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->

		</div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<%@include file="footer.jsp" %>
<div class="control-sidebar-bg"></div>
</div>
</body>
</html>
