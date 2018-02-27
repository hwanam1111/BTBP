<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="btbp.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% int todoCnt= 0, doingCnt= 0, doneCnt = 0; %>
<c:forEach var="JobVO" items="${kList}">
<c:choose>
	<c:when test="${JobVO.jobStatus eq 'todo' }">
		<%todoCnt++; %>
	</c:when>
	<c:when test="${JobVO.jobStatus eq 'doing' }">
		<%doingCnt++; %>
	</c:when>
	<c:otherwise>
		<%doneCnt++; %>
	</c:otherwise>
</c:choose>
</c:forEach>
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
		<link rel="stylesheet" href="/BTBP/resources/plugins/daterangepicker/daterangepicker.css">
		<link rel="stylesheet" href="/BTBP/resources/plugins/datepicker/datepicker3.css">
		<link rel="stylesheet" href="/BTBP/resources/plugins/iCheck/all.css">
		<link rel="stylesheet" href="/BTBP/resources/plugins/colorpicker/bootstrap-colorpicker.min.css">
		<link rel="stylesheet" href="/BTBP/resources/plugins/timepicker/bootstrap-timepicker.min.css">
		<link rel="stylesheet" href="/BTBP/resources/plugins/select2/select2.min.css">
		<link rel="stylesheet" href="/BTBP/resources/css/AdminLTE.min.css">
		<link rel="stylesheet" href="/BTBP/resources/css/skins/_all-skins.min.css">
		<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
		<script src="/BTBP/resources/js/bootstrap.min.js"></script>
		<script src="/BTBP/resources/plugins/select2/select2.full.min.js"></script>
		<script src="/BTBP/resources/plugins/input-mask/jquery.inputmask.js"></script>
		<script src="/BTBP/resources/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
		<script src="/BTBP/resources/plugins/input-mask/jquery.inputmask.extensions.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
		<script src="/BTBP/resources/plugins/daterangepicker/daterangepicker.js"></script>
		<script src="/BTBP/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
		<script src="/BTBP/resources/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
		<script src="/BTBP/resources/plugins/timepicker/bootstrap-timepicker.min.js"></script>
		<script src="/BTBP/resources/plugins/iCheck/icheck.min.js"></script>
		<script src="/BTBP/resources/plugins/fastclick/fastclick.js"></script>
		<script src="/BTBP/resources/js/app.min.js"></script>
		<script src="/BTBP/resources/js/demo.js"></script>
		<script type="text/javascript" src="/BTBP/resources/js/jquery-ui-1.9.2.custom.js"></script>
		<style type="text/css">
			@import url('https://fonts.googleapis.com/earlyaccess/hanna.css');
			*{font-family: 'Hanna', sans-serif;}
			div.jobList {
				float: left;
				width: 125px;
				height: 130px;
				padding: 10px 0px 0px 20px;
				background: url(/BTBP/resources/images/post.png) no-repeat;
				text-align: left;
			}
			div.form-group{
				padding-left : 20px;
				padding-right : 20px;
			}
			div.invert {
				background:url(/BTBP/resources/images/post2.png) no-repeat;
			}
			p {
				font-size: 12px;
			}
			.glyphicon{
				cursor: pointer;
			}
			.title{
				font-weight: bold;
			}
			.KanbanBoard {
			 	margin-left:15px; 
			 	width: 410px;
				height: 800px;
				border-radius: 30px;
				background:url(/BTBP/resources/images/corchBoard1.jpg) repeat-y;
			}
		</style>
		<script>
			$(function(){
				
				$('li').removeClass('active');
				$('#ProjectTool').addClass('active');
				
				//Date picker
			    $('.datepicker').datepicker({
			      autoclose: true
			    });
				
				// 전체 삭제 버튼 이벤트
				$('.allDel').click(function(){
					var status=$(this).attr("id");
					if(confirm(status+'에 있는 전체 작업을 삭제하시겠습니까?')==true){
						location.href="kanbanAlldel.do?jobStatus="+status;
					}
				})
				
				// 작업 수정버튼 이벤트
				$('.glyphicon-pencil').click(function(){
					var jobNo = $(this).parent().parent().attr("id");
					$('#jobNoUpdate').val(jobNo);
					$('#jobContentUpdate').val($(this).parent().parent().children('.jobContent').text());
					$('#jobTitleUpdate').val($(this).parent().parent().children('.title').text());
					$('#startDateUpdate').val($(this).parent().parent().children('.jobstartDate').val());
					$('#endDateUpdate').val($(this).parent().parent().children('.jobendDate').val());
				});
				
				// 작업 등록버튼 이벤트
				$('.insertBtn').click(function(){
					$('#jobStatus').val($(this).attr("id"));
				});
				
				// 마우스 오버 효과
				$('.glyphicon').hover(function(){
					$(this).css("color", "white");
				}, function(){
				     $(this).css("color", "black");
				});
				
				// 삭제 이벤트
				$('.glyphicon-remove').click(function(){
					if(confirm('삭제하시겠습니까?')){
						var jobNo = $(this).parent().parent().attr("id");
						location.href="jobDelete.do?jobType=kanban&jobNo="+jobNo;
					}
				});
				
				// 드래그 대상 타겟
				$(".jobList").draggable({
					cursor: "move",
					stack: ".jobList",
					opacity: 0.7
				});
				
				// 드래그 했을때 이벤트
				 $(".jobList").bind("dragstart",function(event, ui){
					 $(this).addClass("invert"); // 드래그 했을때 이미지
				 });
				 
				 $(".jobList").bind("dragstop", function(event, ui){
					 $(this).removeClass("invert");
					 var jobNo = $(this).attr("id");
					 var afterX = $(this).offset().left; // 드롭 후 X좌표 값 저장
					 console.log(afterX);
					 if(afterX <= 600){
						 location.href='KanbanStatusUp.do?jobStatus=todo&jobNo='+jobNo;
					 } else if(afterX >= 1020) {
						 location.href='KanbanStatusUp.do?jobStatus=done&jobNo='+jobNo;
					 } else {
						 location.href='KanbanStatusUp.do?jobStatus=doing&jobNo='+jobNo;
					 }
					 
				 });
			});
		</script>
	</head>
	<body class="hold-transition skin-purple sidebar-mini">
		<div class="wrapper">
			<%@include file="header.jsp" %>
			<%@include file="menu.jsp" %>
			
			<div class="content-wrapper">
				<section class="content">
					<div class="row">
						<div id="todo" align="center" class="col-md-4 KanbanBoard">
							<br />
							<div class="btn-group" style="width: 100%;">
								<button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="width: 100%;">
							    	<b>To Do</b> <span class="badge"><%=todoCnt %></span> <span class="caret"></span>
							    </button>
								<ul class="dropdown-menu" role="menu" style="width: 100%;">
									<li><a href="#" id="todo" class="insertBtn" data-toggle="modal" data-target="#myModal">작업 등록</a></li>
								    <li><a href="#" id="todo" class="allDel">전체 삭제</a></li>
								</ul>
							</div><br /><br />
							
							<c:forEach var="JobVO" items="${kList}">
								<c:if test="${JobVO.jobStatus eq 'todo' }">
									<div id="${JobVO.jobNo }" class="jobList">
										<div align="right">
											<span class="glyphicon glyphicon-pencil" data-toggle="modal" data-target="#jobUpdate"></span>&nbsp;
											<span class="glyphicon glyphicon-remove"></span>&nbsp;
										</div>
										<div class="title" >${JobVO.jobTitle }</div>
										<div class="jobContent">${JobVO.jobContent }</div>
										<input type="hidden" class="jobstartDate" value="${JobVO.startDate }">
										<input type="hidden" class="jobendDate" value="${JobVO.endDate }">
										<div style="position:absolute; bottom: 0px;">
											<span class="glyphicon glyphicon-user"></span>
											${JobVO.memberId }
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<div id="doing" align="center"  class="col-md-3 KanbanBoard" >
							<br />
							<div class="btn-group" style="width: 100%;">
								<button type="button" class="btn btn-warning btn-lg dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="width: 100%;">
							    	<b>Doing</b>  <span class="badge"><%=doingCnt %></span> <span class="caret"></span>
							    </button>
								<ul class="dropdown-menu" role="menu" style="width: 100%;">
								    <li><a href="#" id="doing" class="insertBtn" data-toggle="modal" data-target="#myModal">작업 등록</a></li>
								    <li><a href="#" id="doing" class="allDel">전체 삭제</a></li>
								</ul>
							</div><br /><br />
							<c:forEach var="JobVO" items="${kList}">
								<c:if test="${JobVO.jobStatus eq 'doing' }">
									<div id="${JobVO.jobNo }" class="jobList">
										<div align="right">
											<span class="glyphicon glyphicon-pencil" data-toggle="modal" data-target="#jobUpdate"></span>&nbsp;
											<span class="glyphicon glyphicon-remove"></span>&nbsp;
										</div>
										<div class="title" >${JobVO.jobTitle }</div>
										<div class="jobContent">${JobVO.jobContent }</div>
										<input type="hidden" class="jobstartDate" value="${JobVO.startDate }">
										<input type="hidden" class="jobendDate" value="${JobVO.endDate }">
										<div style="position:absolute; bottom: 0px;">
											<span class="glyphicon glyphicon-user"></span>
											${JobVO.memberId }
										</div>
									</div>
								</c:if>
							</c:forEach>					
						</div>
						<div id="done" align="center"  class="col-md-3 KanbanBoard" >
							<br />
							<div class="btn-group" style="width: 100%;">
								<button type="button" class="btn btn-success btn-lg dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="width: 100%;">
							    	<b>Done</b> <span class="badge"><%=doneCnt %></span> <span class="caret"></span>
							    </button>
								<ul class="dropdown-menu" role="menu" style="width: 100%;">
								    <li><a href="#" id="done" class="insertBtn" data-toggle="modal" data-target="#myModal">작업 등록</a></li>
								    <li><a href="#" id="done" class="allDel">작업 목록</a></li>
								</ul>
							</div>
							<br /><br />
							<c:forEach var="JobVO" items="${kList}">
								<c:if test="${JobVO.jobStatus eq 'done' }">
									<div id="${JobVO.jobNo }" class="jobList">
										<div align="right">
											<span class="glyphicon glyphicon-pencil" data-toggle="modal" data-target="#jobUpdate"></span>&nbsp;
											<span class="glyphicon glyphicon-remove"></span>&nbsp;
										</div>
										<div class="title" >${JobVO.jobTitle }</div>
										<div class="jobContent">${JobVO.jobContent }</div>
										<input type="hidden" class="jobstartDate" value="${JobVO.startDate }">
										<input type="hidden" class="jobendDate" value="${JobVO.endDate }">
										<div style="position:absolute; bottom: 0px;">
											<span class="glyphicon glyphicon-user"></span>
											${JobVO.memberId }
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</section>
			</div>
		    <%@include file="footer.jsp" %>
		    <div class="control-sidebar-bg"></div>
		</div>
	
	
	
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
			    <div class="modal-content">
			    	<div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">작업 등록</h4>
			        </div>
			        <form id="frm" action="jobInsert.do" method="post" class="form-horizontal">
			        	<div class="modal-body">
			            	<div class="form-group">
			                	<label>업무명</label>
			                	<div class="input-group">
			                    	<div class="input-group-addon">
			                    		<i class="glyphicon glyphicon-pencil"></i>
			                  		</div>
			                  		<input type="text" name="jobTitle" class="form-control pull-right">
			              		</div>
			              	</div>
			                <div class="form-group">
				                <label>업무 일정 - 시작일</label>
				                <div class="input-group">
					                <div class="input-group-addon">
					                	<i class="fa fa-calendar"></i>
					                </div>
				                	<input type="text" name="startDate" class="form-control pull-right datepicker">
				                </div>
			                </div>
			                <div class="form-group">
				                <label>업무 일정 - 종료일</label>
				                <div class="input-group">
					                <div class="input-group-addon">
					                	<i class="fa fa-calendar"></i>
					                </div>
				                	<input type="text" name="endDate" class="form-control pull-right datepicker">
				                </div>
			                </div>
			                <div class="form-group">
				                <label>업무 내용</label>
				                <div class="input-group">
					                <div class="input-group-addon">
					                	<i class="glyphicon glyphicon-text-size"></i>
					                </div>
					                <textarea class="form-control pull-right" id="jobContent" name="jobContent"  rows="4"></textarea>
									<input type="hidden" name="jobStatus" id="jobStatus" >
									<input type="hidden" name="jobType" value="kanban" >
				                </div>
			                </div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							<button type="submit" class="btn btn-warning">저장</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="modal fade" id="jobUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
			    <div class="modal-content">
				    <div class="modal-header">
					    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					    <h4 class="modal-title" id="myModalLabel">작업 수정</h4>
				    </div>
			    	<form id="frm" action="jobUpdate.do" method="post">
			        	<input type="hidden" name="jobType" id="jobType"  value="kanban">
			        	<div class="modal-body">
			            	<div class="form-group">
				                <label>업무명</label>
				                <div class="input-group">
					                <div class="input-group-addon">
					                	<i class="glyphicon glyphicon-pencil"></i>
					                </div>
				                	<input type="text" name="jobTitle" id="jobTitleUpdate"  class="form-control pull-right">
				                </div>
							</div>
			                <div class="form-group">
				                <label>업무 일정</label>
				                <div class="input-group">
				                	<div class="input-group-addon">
				                    	<i class="fa fa-calendar"></i>
				                    </div>
				                    <input type="text" name="startDate" id="startDateUpdate" class="form-control pull-right datepicker">
				                </div>
			                </div>
			                <div class="form-group">
				                <label>업무 일정</label>
				                <div class="input-group">
				                    <div class="input-group-addon">
				                    	<i class="fa fa-calendar"></i>
				                    </div>
				                    <input type="text" name="endDate" id="endDateUpdate" class="form-control pull-right datepicker">
				                </div>
			                </div>
			                <div class="form-group">
				                <label>업무 내용</label>
				                <div class="input-group">
					                <div class="input-group-addon">
					                	<i class="glyphicon glyphicon-text-size"></i>
					                </div>
					                <textarea class="form-control pull-right" id="jobContentUpdate" name="jobContent"  rows="4"></textarea>
									<input type="hidden" name="jobNo" id="jobNoUpdate">
				                </div>
			                </div>
						</div>
			      		<div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					        <button type="submit" class="btn btn-success">수정</button>
			      		</div>
			      	</form>
			    </div>
			</div>
		</div>
	</body>
</html>
