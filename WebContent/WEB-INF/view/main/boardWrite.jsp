<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="btbp.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="apple-touch-icon" sizes="76x76" href="/BTBP/resources/main/teamup-icon.png">
	<link rel="icon" href="/BTBP/resources/main/teamup-icon.png">
    <title>TeamUP 팀업 - Communication is Everything</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />

<link rel="stylesheet" href="/BTBP/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="/BTBP/resources/css/AdminLTE.min.css">
<link rel="stylesheet" href="/BTBP/resources/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="/BTBP/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/BTBP/resources/js/bootstrap.min.js"></script>
<script src="/BTBP/resources/plugins/fastclick/fastclick.js"></script>
<script src="/BTBP/resources/js/app.min.js"></script>
<script src="/BTBP/resources/js/demo.js"></script>
<script src="https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>
<script src="/BTBP/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<style>
input{
	border-color: #FFFFFF;
}
</style>
<script>
$(function(){
	CKEDITOR.replace('boardContent');
	$(".textarea").wysihtml5();
	
	$('#windowClose').click(function(){
		window.self.close();
	});
	
	$('#okBtn').click(function(){
		
		var boardTitle = $('#boardTitle').val();
		
		if(boardTitle==""){
			return;
		}
		
		alert('글이 입력 되었습니다.');
		$('#frm').submit();
		opener.location.reload();
	});
});
</script>
</head>
<body>
<form id="frm" action="boardWrite.do" method="post">
	<div class="wrapper">
		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-info">
						<div class="box-header">
							<h5 class="box-title">
								<span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;
								<input type="text" id="boardTitle" name="boardTitle" placeholder="제목을 입력해주세요..." size="57">&nbsp;&nbsp;&nbsp;
								<button type="button" id="okBtn" class="btn btn-success" >
									<span class="glyphicon glyphicon-send"></span>
								</button>
								<button class="btn btn-danger" id="windowClose">
									<span class="glyphicon glyphicon-remove"></span>
								</button>
							</h5>
						</div>
						<div class="box-body pad">
							<textarea id="boardContent" name="boardContent" class="form-control"  rows="10" cols="80"></textarea>
	        			</div>
	      			</div>
	      		</div>
			</div>
		</section>
	</div>
</form>
</body>
</html>
