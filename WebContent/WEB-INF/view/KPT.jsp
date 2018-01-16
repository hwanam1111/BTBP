<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionScope.memberId eq null}">
<script>
	alert("로그인 후 이용해주세요.");
	location.href="MemberLoginPage.do";
</script>
</c:if>
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
 <link rel="stylesheet" href="/BTBP/resources/plugins/datepicker/datepicker3.css">
<link rel="stylesheet" href="/BTBP/resources/plugins/css/jquery-nestable.css"/>
<link rel="stylesheet" href="/BTBP/resources/plugins/css/modal.css">
<link rel="stylesheet" href="/BTBP/resources/css/kmong_fonts.css"/>
	<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="/BTBP/resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="/BTBP/resources/plugins/app/app.min.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="/BTBP/resources/plugins/jquery-nestable/jquery.nestable.js"></script>
	<script src="/BTBP/resources/plugins/jquery-nestable/sortable-nestable.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script src="/BTBP/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script>
	$(function(){
		var deleteState;
		
		$('li').removeClass('active');
		$('#ProjectTool').addClass('active');
		
		count = 1;
		
// 		alert("${mvo.memberId}"); ==세션에 저장된 아이디
		
		// 모달 창 닫기 이벤트 
		$("#close").click(function(){
			$("#kpt_modal").hide();
			$('#jobTitle').val("");
	  		$('#datepicker').val("");
	  		$('#myImg').attr("src","/BTBP/resources/upload/Members/${mvo.getMemberImageName()}");
	  		$('#wname').text("${mvo.getMemberName()}");
	  		$('#wJob').text("${mvo.getMemberCompany()} - ${mvo.getMemberDept()}(${mvo.getMemberRank()})");
	  		$('#kanbanContent').val("");
		})
		// 동적으로 포스트 잇 추가 부분
		$(".InsertPostIt").click(function(){
			$("#kpt_modal").show();
			var status = $(this).attr("id");
			$('#datepicker').removeAttr("disabled");
			$("#jobStatus").val(status);
			$('#dateInput').hide();
			
				
		})
		// modal 삭제 클릭
		$(".deleteAll").click(function(){
			deleteState = $(this).parent().prev().children().attr("id");
			$('#deleteall_modal').show();
		})
		$('#deleteall_confirm').click(function(){

			location.href="deleteAllKPT.do?jobStatus="+deleteState;
			
		})
		$('#deleteall_cancel').click(function(){
			$('#deleteall_modal').hide();
		})
		
		//Date picker
	    $('#datepicker').datepicker({
	    	dateFormat : "yy/mm/dd",
	    	currentText: '오늘' ,
	     	 autoclose: true
	    });
	
	  $('#enrollBtn').click(function(){
		  if($('#jobTitle').val() == ''){
		  alert("제목을 입력해주세요.");
		  $('#jobTitle').focus();
		  return;
		  }
		  if($('#kanbanContent').val() == ''){
			  alert("내용을 입력해주세요.");
			  $('#kanbanContent').focus();
			  return;
			  }
		  $('#frm1').attr('action','addKPT.do').submit();
		  
	  });
	  $('.viewKpt').each(function(){
		  $(this).click(function(){
			  $("#kpt_modal").show();
			  
			  var jobTitle = $(this).text();
			  var jobRank = $(this).prev().val();
		  		var jobDept = $(this).prev().prev().val();
		  		var company =$(this).prev().prev().prev().val();
		  		var imageName=$(this).parent().prev().attr("src");
		  		var memName=$(this).parent().prev().prev().children().eq(0).text();
		  		var cDate = $(this).parent().prev().prev().children().eq(1).text();
		  		var kcontent = $(this).prev().prev().prev().prev().val();
		  		var jNum=$(this).next().val();//눌린거 글 번호
			  
		  		$('#diaJobNo').val(jNum);
		  		
		  		$('#jobTitle').val(jobTitle);
		  		$('#datepicker').val(cDate);
		  		$('#myImg').attr("src",imageName);
		  		$('#wname').text(memName);
		  		$('#wJob').text(company+" - "+jobDept+"("+jobRank +")");
		  		$('#kanbanContent').val(kcontent);
			  
			  $('#datepicker').attr("disabled","disabled");
			  
			  $('#deleteBtn').click(function(){
				  
				  $('#delete_modal').show();
					  
			  })
			  
			  $('#delete_confirm').click(function(){
				  $('#frm1').attr('action','deleteKpt.do').submit();
			  })
			  $('#delete_cancel').click(function(){
				 
				  $('#delete_modal').hide();
			  })
			  
			  $('#modifyBtn').click(function(){
				  $('#modify_modal').show();
			  })
			  
			  $('#modify_confirm').click(function(){
				  $('#frm1').attr('action','modifyKpt.do').submit();
				  
			  })
			  $('#modify_cancel').click(function(){
				  $('#modify_modal').hide();				 
			  })
			  
		  })
		  
		
		  
		  
	  })
	  
	  
	});
	</script>
</head>
<style>
button{background-color:gray;color:#fff;border:none;box-shadow:none;font-size:14px;font-weight:500;-webkit-border-radius:4px;border-radius:5px;  padding:8px 28px;cursor:pointer}
</style>
<body class="hold-transition skin-purple sidebar-mini">
	<div class="wrapper">

	<%@include file="header.jsp" %>
	<%@include file="menu.jsp" %>
	
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header"></section>
			<!-- Main content -->
			<section class="content">
				<div class="row clearfix">
		<div class="col-lg-4 col-md-6 col-sm-10 col-xs-10">
			<div class="card">
				<div class="header"
					style="background: #605ca8; text-align: center">
		<!-- 전체 card 부분 style 지정 -->
		<h2>
			<b style="color: #fff">Keep</b><small style="color: #fff">유지해라!</small>
		</h2>
		<!-- 할 일 padding의 오른쪽 상단 포스트 잇 생성 버튼-->
		<ul class="header-dropdown m-r--5">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false"> <i class="material-icons"><i
						class="fa fa-ellipsis-v" style="color: #fff"></i></i>
			</a>
				<ul class="dropdown-menu pull-right">
					<li><a href="#" id="keep" class="InsertPostIt">포스트잇
							추가</a></li>
					<li><a href="#" class="deleteAll">모두 삭제</a></li>
				</ul></li>
		</ul>
	</div>
	<!-- 할 일 padding의 오른쪽 상단 포스트 잇 생성 버튼 -->
	<!-- 포스트 잇이 들어갈 body 부분 -->
	<div class="body" style="padding: 10px;">
		<div class="clearfix m-b-20">
			<div class="dd nestable-with-handle" id="droppa">
				<ul id="todoArea" style="padding-left: 0px;" ondrop="drop(event)">
					<li class="dd-item dd3-item">
						<!-- @@@@포스트잇  UI 부분@@@@ --> <!--기본적으로 있어야함.  --> 
						
						<!-- /@@@@ 포스트잇 UI 부분 끝@@@@-->
					</li>
					
					<c:if test="${!kptList.isEmpty()}">
					<c:forEach var="kvo" items="${kptList}">
							<c:if test="${kvo.jobStatus eq 'keep'}">
<!-- 								1. todo 일때 -->
								<li class="dd-item dd3-item">
<!-- 								@@@@포스트잇  UI 부분@@@@ -->
						<div id="${kvo.jobNo }" class="dd-handle dd3-handle"></div>
						<div class="dd3-content"
							style="height: 100px; border: 3px solid #FFFED7; background-color: #FFFED7">
							<div class="direct-chat-msg">
								<div class="direct-chat-info clearfix">
									<span class="direct-chat-name pull-left"
										style="color: black">${kvo.memberName}</span> 
									<span class="direct-chat-timestamp pull-right"
										style="color: black">${kvo.createDate}</span>
								</div>
								<!-- /.direct-chat-info -->
								<img class="direct-chat-img"
									src="/BTBP/resources/upload/Members/${kvo.memberImageName}"
									alt="message user image"/>
								<!-- /.direct-chat-img -->
								<div class="direct-chat-text"
									style="background-color: white; border: 3px solid white;">
										<input type="hidden" id="contentKan" value="${kvo.jobContent }">
										<input type="hidden" value="${kvo.memberCompany }">
										<input type="hidden" value="${kvo.memberDept }">
										<input type="hidden" value="${kvo.memberRank }">
									<a href="#" class="viewKpt">${kvo.jobTitle}</a>
									<input type="hidden" value="${kvo.jobNo}" id="jobNo">
									<input type="hidden" value="${kvo.jobStatus}">
									</div>
								<!-- /.direct-chat-text -->
							</div>
							</div>
<!-- 						/@@@@ 포스트잇 UI 부분 끝@@@@  -->
								</li>
							</c:if>
						</c:forEach>
				</c:if>
				</ul>
			</div>
		</div>
	</div>
	</div>
</div>
<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
	<div class="card">
		<div class="header"
			style="background: #605ca8; text-align: center;">
		<h2>
			<b style="color: #fff">Problem</b><small style="color: #fff">문제점 발견</small>
		</h2>
		<ul class="header-dropdown m-r--5">
			<li class="dropdown"><a href="javascript:void(0);"
				class="dropdown-toggle" data-toggle="dropdown" role="button"
				aria-haspopup="true" aria-expanded="false"> <i
					class="material-icons"><i class="fa fa-ellipsis-v"
						style="color: #fff"></i></i>
			</a>
				<ul class="dropdown-menu pull-right">
					<li><a href="#" id="problem" class="InsertPostIt">포스트잇
							추가</a></li>
					<li><a href="#" class="deleteAll">모두 삭제</a></li>
				</ul></li>
		</ul>
	</div>
	<div class="body" style="padding: 10px;">
		<div class="clearfix m-b-20">
			<div class="dd nestable-with-handle">
				<ul id="doingArea" style="padding-left: 0px;">
					<li class="dd-item dd3-item" id="doing">
						<!-- @@@@포스트잇  UI 부분@@@@ --> <!-- /@@@@ 포스트잇 UI 부분 끝@@@@-->
					</li>
					<c:if test="${!kptList.isEmpty()}">
					<c:forEach var="kvo" items="${kptList}">
							<c:if test="${kvo.jobStatus eq 'problem' }">
<!-- 								1. todo 일때 -->
								<li class="dd-item dd3-item">
<!-- 								@@@@포스트잇  UI 부분@@@@ -->
						<div class="dd-handle dd3-handle"></div>
						<div class="dd3-content"
							style="height: 100px; border: 3px solid #FFFED7; background-color: #FFFED7">
							<div class="direct-chat-msg">
								<div class="direct-chat-info clearfix">
									<span class="direct-chat-name pull-left"
										style="color: black">${kvo.memberName}</span> 
									<span class="direct-chat-timestamp pull-right"
										style="color: black">${kvo.createDate}</span>
								</div>
								<!-- /.direct-chat-info -->
								<img class="direct-chat-img"
									src="/BTBP/resources/upload/Members/${kvo.memberImageName}"
									alt="message user image"/>
								<!-- /.direct-chat-img -->
								<div class="direct-chat-text"
									style="background-color: white; border: 3px solid white;">
										<input type="hidden" id="contentKan" value="${kvo.jobContent }">
										<input type="hidden" value="${kvo.memberCompany }">
										<input type="hidden" value="${kvo.memberDept }">
										<input type="hidden" value="${kvo.memberRank }">
									<a href="#" class="viewKpt">${kvo.jobTitle}</a>
									<input type="hidden" value="${kvo.jobNo}" id="jobNo">
									<input type="hidden" value="${kvo.jobStatus}">
									</div>
								<!-- /.direct-chat-text -->
							</div>
							</div>
<!-- 								/@@@@ 포스트잇 UI 부분 끝@@@@		 -->
																
								</li>
							</c:if>
						</c:forEach>
				</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
	<div class="card">
		<div class="header"
			style="background-color: #605ca8; text-align: center;">
		<h2>
			<b style="color: #fff">Try</b><small style="color: #fff">노력할 것은?</small>
		</h2>
		<ul class="header-dropdown m-r--5">
			<li class="dropdown"><a href="javascript:void(0);"
				class="dropdown-toggle" data-toggle="dropdown" role="button"
				aria-haspopup="true" aria-expanded="false"> <i
					class="material-icons"><i class="fa fa-ellipsis-v"
						style="color: #fff"></i></i>
			</a>
				<ul class="dropdown-menu pull-right">
					<li><a href="#" id="try" class="InsertPostIt">포스트잇
							추가</a></li>
					<li><a href="#" class="deleteAll">모두 삭제</a></li><!--deleteAllKan.do?jobStatus=done  -->
				</ul></li>
		</ul>
	</div>
	<div class="body" style="padding: 10px;">
		<div class="clearfix m-b-20">
			<div class="dd nestable-with-handle">
			<ol class="dd-list" id="doneArea">
				<li class="dd-item dd3-item" id="done">
						<!-- @@@@포스트잇  UI 부분@@@@ --> 
						<!-- /@@@@ 포스트잇 UI 부분 끝@@@@-->
					</li>
					<c:if test="${!kptList.isEmpty()}">
					<c:forEach var="kvo" items="${kptList}">
					
							<c:if test="${kvo.jobStatus eq 'try' }">
<!-- 								1. todo 일때 -->

								<li class="dd-item dd3-item">
<!-- 								@@@@포스트잇  UI 부분@@@@ -->
						<div id="${kvo.jobNo }" class="dd-handle dd3-handle"></div>
						<div class="dd3-content"
							style="height: 100px; border: 3px solid #FFFED7; background-color: #FFFED7">
							<div class="direct-chat-msg">
								<div class="direct-chat-info clearfix">
									<span class="direct-chat-name pull-left"
										style="color: black">${kvo.memberName}</span> 
									<span class="direct-chat-timestamp pull-right"
										style="color: black">${kvo.createDate}</span>
								</div>
								<!-- /.direct-chat-info -->
								<img class="direct-chat-img"
									src="/BTBP/resources/upload/Members/${kvo.memberImageName}"
									alt="message user image"/>
								<!-- /.direct-chat-img -->
								<div class="direct-chat-text"
									style="background-color: white; border: 3px solid white;">
										<input type="hidden" id="contentKan" value="${kvo.jobContent }">
										<input type="hidden" value="${kvo.memberCompany }">
										<input type="hidden" value="${kvo.memberDept }">
										<input type="hidden" value="${kvo.memberRank }">
									<a href="#" class="viewKpt">${kvo.jobTitle}</a>
									<input type="hidden" value="${kvo.jobNo}" name="jobNo">
									<input type="hidden" value="${kvo.jobStatus}"></div>
								<!-- /.direct-chat-text -->
							</div>
							</div>
<!-- 								/@@@@ 포스트잇 UI 부분 끝@@@@		 -->
																
								</li>
							</c:if>
						</c:forEach>
				</c:if>
				
					</ol>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- #END# Default Example -->
	</div>


			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		 <%@include file="footer.jsp" %>
		<!-- /Main Footer -->		
		<div class="control-sidebar-bg"></div>
	</div>
	
	
	<!--@@@@@@@@@@@@KPT 추가 모달  -->
<div id="kpt_modal" class="sweet-alert showSweetAlert visible"
	data-custom-class="" data-has-cancel-button="true"
	data-has-confirm-button="true" data-allow-outside-click="false"
	data-has-done-function="true" data-animation="pop" data-timer="null"
	style="display: none; margin-top: -300px; margin-right: 10px">
<p style="display: block">
<div>
	<!-- modal 전체 공간 차지하는 부분 -->
<div class="box box-widget widget-user-2"
	style="width: 100%; height: 30%;">
	
<form id="frm1" action="">
<div class="widget-user-header bg-white">
					<!-- 이미지 넣는 부분 -->
					<div class="widget-user-image">
						<img class="img-circle img-bordered-sm"
							src="/BTBP/resources/upload/Members/${mvo.memberImageName}" alt="User Avatar" id="myImg">
					</div>
					<!-- content body -->
						<h2 class="widget-user-username">
							<b id="wname">${mvo.memberName}</b>
						</h2>
						<h4 id="wJob" style="text-align: center;">${mvo.memberCompany } - ${mvo.memberDept }(${mvo.memberRank })</h4>
</div>
<!--/content body -->

<div class="box-footer no-padding">
	<div class="col-md-13">
		<div class="box box-primary" style="overflow: auto;">
		<div class="box-body" style="height: 360px; padding: 20px;">
			<div class="form-group">
				<label>제목</label>
				<div class="input-group">
					<span class="input-group-addon"><i
						class="fa fa-file-o"></i></span> <input type="text" id="jobTitle"
						name="jobTitle" class="form-control" placeholder="제목">
				</div>
			</div>
			<!-- Date range -->
			<div class="form-group" id="dateInput" style="float: left;">
				<label>등록일:</label>
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-calendar"></i>
					</div>
					<input type="text" class="form-control pull-right datepicker"
						id="datepicker" name="createDate" value="" > 
						<input type="hidden" id="jobStatus" name="jobStatus">
				</div>
				<!-- /.input group -->
			</div>
			<!-- /.form group -->
			<div class="form-group">
				<label>세부 내용 :</label>
				<div class="input-group check">
					<span class="input-group-addon"><i
						class="fa fa-clipboard"></i></span>
					<textarea id="kanbanContent" name="jobContent"
						class="form-control" placeholder="세부내용"
						style="height: 100px;"></textarea>
				</div>
			</div>
			<!-- /.box-body -->
		</div>

		<!-- /.box -->
</div>
</div>

<div class="input-group pull-right" style="margin-bottom: 20px;margin-left: 3px;">
					<a class="btn" id="close"><i class="fa fa-sign-out"></i> 취소</a>
				</div>
				<div class="input-group pull-right" style="margin-left: 3px;">
				<a class="btn" id='deleteBtn'><i class="fa fa-trash-o"></i> 삭제</a>
				</div>

				<div class="input-group pull-right" style="margin-left: 3px;">
				<a class="btn" id="modifyBtn"><i
						class="fa fa-file-text"></i> 수정</a>
				</div>
			
				<div class="input-group pull-right" style="margin-left: 3px;">
				<a class="btn" id="enrollBtn"><i class="fa fa-save"></i> 등록</a>
				</div>
			</div>
			<input type='hidden' name='jobNo' id='diaJobNo' value='0'/>		
</form>
<!-- /.box-body -->
<!-- /.box-footer -->
		</div>
	</div>
</div>
<!-- /.widget-user -->
</body>
 <!-- 팝업 창 시작 부분 (삭제 클릭시)-->
	<div id="deleteall_modal" class="sweet-alert showSweetAlert visible"
		data-custom-class="" data-has-cancel-button="true"
		data-has-confirm-button="true" data-allow-outside-click="false"
		data-has-done-function="true" data-animation="pop" data-timer="null"
		style="display: none; margin-top: -220px;">
		<div class="sa-icon sa-error" style="display: none;">
			<span class="sa-x-mark"> <span class="sa-line sa-left"></span>
				<span class="sa-line sa-right"></span>
			</span>
		</div>
		<div class="sa-icon sa-warning pulseWarning" style="display: block;">
			<span class="sa-body pulseWarningIns"></span> <span
				class="sa-dot pulseWarningIns"></span>
		</div>
		<div class="sa-icon sa-info" style="display: none;"></div>
		<div class="sa-icon sa-success" style="display: none;">
			<span class="sa-line sa-tip"></span> <span class="sa-line sa-long"></span>
		</div>
		<div class="sa-icon sa-custom" style="display: none;"></div>
		<h2>삭제</h2>
		<p style="display: block;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭제 시 과거 정보는 삭제됩니다. 삭제하시겠습니까?<br/><br/></p>
		<div class="sa-error-container">
			<div class="icon">!</div>
			<p>Not valid!</p>
		</div>
		<div class="sa-button-container">
			<button class="cancel" tabindex="2" id="deleteall_cancel"
				style="display: inline-block; box-shadow: none; margin-left: 110px">취소</button>
			<div class="sa-confirm-button-container" style="padding-right : 30px">
				<button class="confirm" tabindex="1" id="deleteall_confirm"
					style="display: inline-block; background-color: rgb(243, 134, 91); margin-left: 60px; margin-bottom: 5px">삭제</button>
				<div class="la-ball-fall">
					<div></div>
					<div></div>
					<div></div>
				</div>
			</div>
		</div>
	</div>
  <!-- /.content-wrapper -->
   <!-- 팝업 창 시작 부분 (삭제 클릭시)-->
	<div id="delete_modal" class="sweet-alert showSweetAlert visible"
		data-custom-class="" data-has-cancel-button="true"
		data-has-confirm-button="true" data-allow-outside-click="false"
		data-has-done-function="true" data-animation="pop" data-timer="null"
		style="display: none; margin-top: -220px;">
		<div class="sa-icon sa-error" style="display: none;">
			<span class="sa-x-mark"> <span class="sa-line sa-left"></span>
				<span class="sa-line sa-right"></span>
			</span>
		</div>
		<div class="sa-icon sa-warning pulseWarning" style="display: block;">
			<span class="sa-body pulseWarningIns"></span> <span
				class="sa-dot pulseWarningIns"></span>
		</div>
		<div class="sa-icon sa-info" style="display: none;"></div>
		<div class="sa-icon sa-success" style="display: none;">
			<span class="sa-line sa-tip"></span> <span class="sa-line sa-long"></span>
		</div>
		<div class="sa-icon sa-custom" style="display: none;"></div>
		<h2>삭제</h2>
		<p style="display: block;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭제 시 과거 정보는 삭제됩니다. 삭제하시겠습니까?<br/><br/></p>
		<div class="sa-error-container">
			<div class="icon">!</div>
			<p>Not valid!</p>
		</div>
		<div class="sa-button-container">
			<button class="cancel" tabindex="2" id="delete_cancel"
				style="display: inline-block; box-shadow: none; margin-left: 110px">취소</button>
			<div class="sa-confirm-button-container" style="padding-right : 30px">
				<button class="confirm" tabindex="1" id="delete_confirm"
					style="display: inline-block; background-color: rgb(243, 134, 91); margin-left: 60px; margin-bottom: 5px">삭제</button>
				<div class="la-ball-fall">
					<div></div>
					<div></div>
					<div></div>
				</div>
			</div>
		</div>
	</div>
  <!-- /.content-wrapper -->
   <!-- 팝업 창 시작 부분 (수정 클릭시)-->
	<div id="modify_modal" class="sweet-alert showSweetAlert visible"
		data-custom-class="" data-has-cancel-button="true"
		data-has-confirm-button="true" data-allow-outside-click="false"
		data-has-done-function="true" data-animation="pop" data-timer="null"
		style="display: none; margin-top: -220px;">
		<div class="sa-icon sa-error" style="display: none;">
			<span class="sa-x-mark"> <span class="sa-line sa-left"></span>
				<span class="sa-line sa-right"></span>
			</span>
		</div>
		<div class="sa-icon sa-warning pulseWarning" style="display: block;">
			<span class="sa-body pulseWarningIns"></span> <span
				class="sa-dot pulseWarningIns"></span>
		</div>
		<div class="sa-icon sa-info" style="display: none;"></div>
		<div class="sa-icon sa-success" style="display: none;">
			<span class="sa-line sa-tip"></span> <span class="sa-line sa-long"></span>
		</div>
		<div class="sa-icon sa-custom" style="display: none;"></div>
		<h2>수정</h2>
		<p style="display: block;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수정하시면 과거 정보는 수정집니다. 수정하시겠습니까?<br/><br/></p>
		<div class="sa-error-container">
			<div class="icon">!</div>
			<p>Not valid!</p>
		</div>
		<div class="sa-button-container">
			<button class="cancel" tabindex="2" id="modify_cancel"
				style="display: inline-block; box-shadow: none; margin-left: 110px">취소</button>
			<div class="sa-confirm-button-container" style="padding-right : 30px">
				<button class="confirm" tabindex="1" id="modify_confirm"
					style="display: inline-block; background-color: rgb(243, 134, 91); margin-left: 60px; margin-bottom: 5px">수정</button>
				<div class="la-ball-fall">
					<div></div>
					<div></div>
					<div></div>
				</div>
			</div>
		</div>
	</div>
  <!-- /.content-wrapper -->
</html>
