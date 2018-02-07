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

	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <link href="/BTBP/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/BTBP/resources/assets/css/material-kit.css" rel="stylesheet"/>
	<link href="/BTBP/resources/assets/css/demo.css" rel="stylesheet" />
	<script src="/BTBP/resources/assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="/BTBP/resources/assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="/BTBP/resources/assets/js/material.min.js"></script>
	<script src="/BTBP/resources/assets/js/nouislider.min.js" type="text/javascript"></script>
	<script src="/BTBP/resources/assets/js/bootstrap-datepicker.js" type="text/javascript"></script>
	<script src="/BTBP/resources/assets/js/material-kit.js" type="text/javascript"></script>
</head>
<style type="text/css">
	@import url('https://fonts.googleapis.com/earlyaccess/hanna.css');
	*{font-family: 'Hanna', sans-serif;}
body{
	background-color: #FAECC5;
}
</style>
<script type="text/javascript">
$(function(){
	$('#memberOutBtn').click(function(){
		if($('#memberPw').val()==""){
			alert('비밀번호를 입력해주세요.');
			return;
		}
		$('#frm').submit();
	});
});
</script>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert('비밀번호를 확인해주세요.');
	</script>
</c:if>
<c:if test="${result == 1 }">
	<script type="text/javascript">
		alert('회원 탈퇴가 완료 되었습니다. 메인페이지로 이동합니다.');
		self.close();
		opener.location.href='main.do';
	</script>
</c:if>
<body>
			<div class="container">
			<br /><br />
				<div class="row">
					<div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
						<div class="card card-signup" align="center">
						<button class="btn btn-warning">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							회원탈퇴
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</button>
							<form id="frm" method="post" action="memberOut.do">
								<div class="content">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">lock_outline</i>
										</span>
										<input type="text" class="form-control" id="memberPw" name="memberPw" placeholder="비밀번호" />
									</div>
								</div>
							</form>
							
							<div class="footer text-center">
								<button id="memberOutBtn" class="btn btn-simple btn-warning btn-lg">회원탈퇴 하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
	
</body>
</html>