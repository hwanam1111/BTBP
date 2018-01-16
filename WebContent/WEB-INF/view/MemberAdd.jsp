<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="btbp.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="apple-touch-icon" sizes="76x76" href="/BTBP/resources/main/teamup-icon.png">
	<link rel="icon" href="/BTBP/resources/main/teamup-icon.png">
    <title>TeamUP 팀업 - Communication is Everything</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
	<!--     Fonts and icons     -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
	<!-- CSS Files -->
    <link href="/BTBP/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/BTBP/resources/assets/css/material-kit.css" rel="stylesheet"/>
	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link href="/BTBP/resources/assets/css/demo.css" rel="stylesheet" />
	<!--   Core JS Files   -->
	<script src="/BTBP/resources/assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="/BTBP/resources/assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="/BTBP/resources/assets/js/material.min.js"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="/BTBP/resources/assets/js/nouislider.min.js" type="text/javascript"></script>
	<!--  Plugin for the Datepicker, full documentation here: http://www.eyecon.ro/bootstrap-datepicker/ -->
	<script src="/BTBP/resources/assets/js/bootstrap-datepicker.js" type="text/javascript"></script>
	<!-- Control Center for Material Kit: activating the ripples, parallax effects, scripts from the example pages etc -->
	<script src="/BTBP/resources/assets/js/material-kit.js" type="text/javascript"></script>
	<style type="text/css">
body{
	background-color: #F2FFED;
}
</style>
	<script type="text/javascript">
		$(function(){
			$('#MemberSelBtn').click(function(){
				if($('#memId').val()==""){
					alert('아이디를 입력해주세요.');
					return;
				}
				$('#frm').submit();
			});
			
			$('#MemberAddBtn').click(function(){
				if(confirm($('#memId').val()+'님을 프로젝트 멤버로 초대 하시겠습니까?') == true){
					location.href='MemberAddInsert.do?memberId='+$('#memId').val()+'&grade='+$('#grade').val();
				}
			});
		});
	</script>
	
	<c:if test="${addResult != null}">
		<script type="text/javascript">
			alert("${addResult}");
			opener.location.reload();
			self.close();
		</script>
	</c:if>
</head>
<body>
			<div class="container">
			<br /><br />
				<div class="row">
					<div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
						<div class="card card-signup" align="center">
						<button class="btn btn-success">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							프로젝트 멤버 초대
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</button>
							<form id="frm" method="post" action="MemberAddSelect.do">
								<div class="content">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">face</i>
										</span>
										<input type="text" class="form-control" id="memId" name="memId" placeholder="아이디" value="${mInfo.memberId }">
									</div>
								</div>
							</form>
							${result }
							<c:if test="${mInfo.memberId != sessionScope.memberId}">
								<c:if test="${mInfo.memberName != null}">
								<div class="row">
								<c:if test="${mInfo.memberImageName != null}">
									<img src="/BTBP/resources/upload/Members/${mInfo.memberImageName }" width=40px height=40px class="img-circle img-raised">
								</c:if>
		                       	<c:if test="${mInfo.memberImageName == null}">
									<img src="/BTBP/resources/assets/img/logo.png" width=40px height=40px class="img-circle img-raised">
								</c:if> 
								
								<p class="btn btn-simple btn-warning">${mInfo.memberName } ${mInfo.memberRank } (${mInfo.memberCompany })</p>
								<select id="grade">
									<option>DEV</option>
									<option>DESIGN</option>
									<option>ENGINEER</option>
									<option>PL</option>
									<option>OTHER</option>
								</select>
								<br />
								<button id="MemberAddBtn" class="btn btn-simple btn-danger btn-sm">멤버 초대</button>
								</div>
								</c:if>
							</c:if>
								<div class="footer text-center">
									<button id="MemberSelBtn" class="btn btn-simple btn-success btn-lg">조회</button>
								</div>
						</div>
					</div>
				</div>
			</div>
	
</body>
</html>