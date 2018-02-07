<%@ page contentType="text/html; charset=UTF-8"%>
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
<style type="text/css">
@import url('https://fonts.googleapis.com/earlyaccess/hanna.css');
*{font-family: 'Hanna', sans-serif;}
body{
	background-color: #E8D9FF;
}
</style>
<script type="text/javascript">
$(function(){
	$('#createBtn').click(function(){
		if($('#projectName').val()=="") {
			$('#projectName').focus();
			return;
		} else if($('#projectDetail').val()=="") {
			$('#projectDetail').focus();
			return;
		} else if($('#orderCompany').val()=="") {
			$('#orderCompany').focus();
			return;
		} else if($('#obtainCompany').val()=="") {
			$('#obtainCompany').focus();
			return;
		} else if($('#startDate').val()=="") {
			$('#startDate').focus();
			return;
		} else if($('#endDate').val()=="") {
			$('#endDate').focus();
			return;
		} else if($('#projectBudget').val()=="") {
			$('#projectBudget').focus();
			return;
		}
		
		var sdate = $('#startDate').val().split('/');
		var edate = $('#endDate').val().split('/');
		
		if(sdate > edate) {
			alert('프로젝트 종료기간이 시작기간보다 빠릅니다.');
			return;
		}
		
		$('#frm').submit();
		alert('프로젝트가 생성 되었습니다.');
		opener.location.reload();
	});
});
</script>
</head>
<body>
<div class="container">
	<br /><br />
	<div id="inputs">
	<div class="row">
		<div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
		
			<div class="card card-signup" align="center">
				<button class="btn btn-primary">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				신규 프로젝트 생성
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</button>
							
							<form id="frm" method="post" action="ProjectSave.do">
								<div class="content">
									<div class="input-group">
										<span class="input-group-addon">
										</span>
										<input type="text" class="form-control" id="projectName" name="projectName" placeholder="프로젝트 명" >
									</div>
									<div class="input-group">
										<span class="input-group-addon">
										</span>
										<input type="text" class="form-control" id="projectDetail" name="projectDetail" placeholder="프로젝트 설명" >
									</div>
									<div class="input-group">
										<span class="input-group-addon">
										</span>
										<input type="text" class="form-control" id="orderCompany" name="orderCompany" placeholder="발주사" >
									</div>
									<div class="input-group">
										<span class="input-group-addon">
										</span>
										<input type="text" class="form-control" id="obtainCompany" name="obtainCompany" placeholder="수주사" >
									</div>
									<div class="input-group">
										<span class="input-group-addon">
										</span>
										<input type="number" class="form-control" id="projectBudget" name="projectBudget" placeholder="프로젝트 예산 (단위 : 천원)" >
									</div>
									<div class="input-group">
										<span class="input-group-addon">
										</span>
										<input type="text" id="startDate" name="startDate" class="datepicker form-control"  placeholder="시작날짜" >
									</div>
									<div class="input-group">
										<span class="input-group-addon">
										</span>
										<input type="text" id="endDate" name="endDate" class="datepicker form-control" placeholder="종료날짜"  />
									</div>
								</div>
							</form>
							
					<div class="footer text-center">
						<button id="createBtn" class="btn btn-simple btn-primary btn-lg">프로젝트 만들기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>