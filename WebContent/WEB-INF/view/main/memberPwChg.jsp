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
	$('#memberPwChgBtn').click(function(){
		if($('#memberPw').val()==""){
			alert('새 비밀번호를 입력해주세요.');
			$('#memberPw').focus();
			return;
		}
		if($('#memberPw2').val()==""){
			alert('비밀번호 확인란을 입력해주세요.');
			$('#memberPw2').focus();
			return;
		}
		if($('#memberPw').val() != $('#memberPw2').val()){
			alert('비밀번호가 일치하지 않습니다.');
			$('#memberPw2').focus();
			return;
		}
		$('#frm').submit();
	});
});
</script>
<c:if test="${result == 1 }">
	<script type="text/javascript">
		alert('비밀번호 변경 완료 되었습니다.');
		self.close();
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
							비밀번호 변경
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</button>
							<form id="frm" method="post" action="memberPwChgOk.do">
								<div class="content">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">lock_outline</i>
										</span>
										<input type="password" class="form-control" id="memberPw" name="memberPw" placeholder="새 비밀번호" />
										<span class="material-icons form-control-feedback">clear</span>
									</div>
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">lock_outline</i>
										</span>
										<input type="password" class="form-control" id="memberPw2" name="memberPw2" placeholder="새 비밀번호 확인" />
									</div>
								</div>
							</form>
							
							<div class="footer text-center">
								<button id="memberPwChgBtn" class="btn btn-simple btn-warning btn-lg">비밀번호 변경</button>
							</div>
						</div>
					</div>
				</div>
			</div>
	
</body>
</html>