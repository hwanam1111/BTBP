<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="btbp.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="apple-touch-icon" sizes="76x76" href="/BTBP/resources/main/teamup-icon.png">
	<link rel="icon" href="/BTBP/resources/main/teamup-icon.png">
    <title>BTBP - Best Teamwork Best Project</title>
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
			$('#friendSelBtn').click(function(){
				if($('#friendId').val()==""){
					alert('아이디를 입력해주세요.');
					return;
				}
				$('#frm').submit();
			});
			
			$('#friendAddBtn').click(function(){
				if(confirm($('#friendId').val()+'님을 친구추가 하시겠습니까?') == true){
					location.href='friendAdd.do?friendId='+$('#friendId').val();
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
							친구 추가
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</button>
							<form id="frm" method="post" action="friendSelect.do">
								<div class="content">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">face</i>
										</span>
										<input type="text" class="form-control" id="friendId" name="friendId" placeholder="아이디" value=${friendId }>
									</div>
								</div>
							</form>
							${result }
							<c:if test="${mvo.memberId != sessionScope.memberId}">
								<c:if test="${mvo.memberName != null}">
								<div class="row">
								<c:if test="${mvo.memberImageName != null}">
									<img src="/BTBP/resources/upload/Members/${mvo.memberImageName }" width=40px height=40px class="img-circle img-raised">
								</c:if>
		                       	<c:if test="${mvo.memberImageName == null}">
									<img src="/BTBP/resources/assets/img/logo.png" width=40px height=40px class="img-circle img-raised">
								</c:if> 
								
								<p class="btn btn-simple btn-warning">${mvo.memberName } ${mvo.memberRank } (${mvo.memberCompany })</p>
								<button id="friendAddBtn" class="btn btn-simple btn-danger btn-sm">친구추가</button>
								</div>
								</c:if>
							</c:if>
								<div class="footer text-center">
									<button id="friendSelBtn" class="btn btn-simple btn-success btn-lg">조회</button>
								</div>
						</div>
					</div>
				</div>
			</div>
	
</body>
</html>