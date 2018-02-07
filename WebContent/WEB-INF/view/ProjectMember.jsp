<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="btbp.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% int forCnt = 0; %>
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
<link rel="stylesheet" href="/BTBP/resources/css/AdminLTE.min.css">
<link rel="stylesheet" href="/BTBP/resources/css/skins/skin-purple.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/BTBP/resources/plugins/bootstrap/bootstrap.min.js"></script>
<script src="/BTBP/resources/js/app.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
		@import url('https://fonts.googleapis.com/earlyaccess/hanna.css');
		*{font-family: 'Hanna', sans-serif;}
	</style>
<script type="text/javascript">
$(function(){
	$('li').removeClass('active');
	$('#ProjectMember').addClass('active');
	
	$('.gradeList').hide();
	
	$('.btn-group').click(function(){
		$('.gradeList').hide();
	});
	
	$('#MemberAddBtn').click(function(){
		window.open('MemberAdd.do', 'MemberAdd', "width=400, height=400, left=900, top=200, resizable=no, scrollbars=no, status=no;");
	});
	
	// 멤버 등급 수정 버튼 클릭시
	$('.gradeList').click(function(){
		var grade = $(this).attr("id");
		var memberId = $(this).parent().parent().parent().parent().attr("id");
		location.href="MemberGradeUpdate.do?memberId="+memberId+"&grade="+grade;
	});
	
	// 멤버 등급 수정
	$('.member-upBtn').hover(
		function(){$('.gradeList').slideDown();},
		function(){}
	);
	
	// 관리 버튼 hover 이벤트
	$('.glyphicon-menu-hamburger').hover(
		function(){$(this).css('color', 'red')},
		function(){$(this).css('color', '#FFBB00')}
	);
	
	// 멤버 삭제 버튼
	$('.member-remove').click(function(){
		var memberId = $(this).parent().parent().parent().parent().parent().attr("id");
		
		if(confirm(memberId+'님을 프로젝트 멤버에서 탈퇴시키겠습니까?')==true){
			location.href="MemberDel.do?memberId="+memberId;
		}
	});
	
	$('#MemberDelBtn').click(function(){
		
		var pm = "${pInfo.memberId}";
		var my = "${sessionScope.memberId}";
		
		if(pm == my){
			if(confirm('프로젝트 관리자는 권한 인계 후 탈퇴할 수 있습니다. 인계 페이지를 여시겠습니까?')==true){
				cw=screen.availWidth;     //화면 넓이
				ch=screen.availHeight;    //화면 높이
				sw=500;    //띄울 창의 넓이
				sh=500;    //띄울 창의 높이
				ml=(cw-sw)/2;
				mt=(ch-sh)/2; 
				test=window.open('PMtransfer.do?projectNo='+"${pInfo.projectNo}",'PMtransfer','width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=no');
			} 
			return;
		}
		
		if(confirm('해당 프로젝트에서 탈퇴하시겠습니까?')==true){
			location.href="MemberDel.do?memberId="+"${sessionScope.memberId}";
		}
	});
	
	// 멤버 선택 버튼
	$('.pMem').hover(
		function(){$(this).css('background-color', '#FFFFE6')},
		function(){$(this).css('background-color', 'white')}
	);
		
	
	$('.pMemEvt').click(function(){
		var friendId = $(this).parent().attr("id");
		var memberId = "${sessionScope.memberId}";
		if(friendId == memberId) {
			return;
		}
		window.open('ProjectMemberInfo.do?friendId='+friendId, 'projectMemInfo', "width=500, height=500, left=600, top=100, resizable=no, scrollbars=no, status=no;");
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

    <section class="content">
		<div class="col-md-12">
        	<div class="box box-danger">
				
				<div class="box-header with-border">
					<h3 class="box-title"><i class="fa fa-group"></i>&nbsp;프로젝트 멤버 (총 ${pList.size()}명)</h3>
					<div align="right">
						<button class="btn btn-danger" id="MemberDelBtn">멤버 탈퇴</button>
						<c:if test="${pInfo.memberId == sessionScope.memberId }">
							<button class="btn btn-warning" id="MemberAddBtn">멤버 초대 +</button>
						</c:if>
					</div>
                </div>
                
                <div class="box-body no-padding">
                  <ul class="users-list clearfix">
                    <c:forEach var="ProjectMemberVO" items="${pList }">
                    	<% forCnt++; %>
                    	
	                    <li id="${ProjectMemberVO.memberId}" class="pMem" style="cursor: pointer;">
	                    
	                    <c:if test="${pInfo.memberId == sessionScope.memberId }">
							<div align="right">
							
							<!-- Single button -->
							<div class="btn-group">
							  <span class="glyphicon glyphicon-menu-hamburger" data-toggle="dropdown" aria-expanded="false" style="color: #FFBB00; cursor: pointer;"></span>
							  <% if(forCnt % 4 == 0){ %>
							  <ul class="dropdown-menu dropdown-menu-right" role="menu">
							  <% } else { %>
							  <ul class="dropdown-menu" role="menu">
							  <% } %>
							    <li><a href="#" class="member-upBtn"><span class="glyphicon glyphicon-ok"></span>등급 수정 ▼</a></li>
							    <li class="gradeList" id="DEV"><a href="#">- DEV</a></li>
							    <li class="gradeList" id="DESIGN"><a href="#">- DESIGN</a></li>
							    <li class="gradeList" id="ENGINEER"><a href="#">- ENGINEER</a></li>
							    <li class="gradeList" id="PL"><a href="#">- PL</a></li>
							    <li class="gradeList" id="OTHER"><a href="#">- OTHER</a></li>
							    <li><a href="#" class="member-remove"><span class="glyphicon glyphicon-ok"></span>멤버 삭제</a></li>
							  </ul>
							</div>
							
							</div>
						</c:if>
	                    
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
                </div><!-- /.box-body -->
                
			</div><!--/.box -->
		</div><!-- /.col -->
	</section><!-- /.content -->
</div><!-- /.content-wrapper -->
    
</div>

<%@include file="footer.jsp" %>
<div class="control-sidebar-bg"></div>

</body>
</html>
