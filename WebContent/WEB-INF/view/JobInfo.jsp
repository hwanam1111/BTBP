<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="btbp.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
  <link rel="stylesheet" href="/BTBP/resources/plugins/css/modal.css">
  <link rel="stylesheet" href="/BTBP/resources/css/kmong_fonts.css"/>
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
<script>
$(function(){
	$('li').removeClass('active');
	$('#ProjectTool').addClass('active');
	
	//Date picker
    $('.datepicker').datepicker({
      autoclose: true
    });
	
	$('#upBtn').click(function(){
		if ($('#jobTitle').val()==""){
			return;
		} else if ($('#jobContent').val()=="") {
			return;
		} else if ($('#startDate').val()=="") {
			return;
		} else if ($('#endDate').val()=="") {
			return;
		}
		
		$('#modify_modal').show();
	});
	
	$('#modify_confirm').click(function(){
		$('#frm').submit();
	})
	
	$('#modify_cancel').click(function(){
		$('#modify_modal').hide();
	})
		
		
	$('#delBtn').click(function(){

		$('#delete_modal').show();	
	});
	
	$('#delete_confirm').click(function(){
		$('#frm').attr('action', 'jobDelete.do');
		$('#frm').submit();
	})

	$('#delete_cancel').click(function(){
		
		$('#delete_modal').hide();
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

  
  <!-- @@@@@@@@@@@@@@@@@@@@@@@@@ -->




  <div class="content-wrapper">
    <section class="content-header">
    </section>

    <!-- Main content -->
    <section class="content">
      
      <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">업무 정보</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              
              	   <form id="frm" action="jobUpdate.do" method="post">
              
              	   <input type="hidden" name="jobNo" value="${jInfo.jobNo }">
              
                  <label for="jobTitle" class="col-sm-2 control-label">업무 명</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="jobTitle" name="jobTitle" value="${jInfo.jobTitle }">
                  </div>
                
                  <label for="jobContent" class="col-sm-2 control-label">업무 내용</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="jobContent" name=jobContent value="${jInfo.jobContent }">
                  </div>
                
				  <label for="startDate" class="col-sm-2 control-label">업무 시작일</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control datepicker" id="startDate" name="startDate" value="${jInfo.startDate }">
                  </div>
                  
                  <label for="endDate" class="col-sm-2 control-label">업무 종료일</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control datepicker" id="endDate" name="endDate" value="${jInfo.endDate }">
                  </div>
                
                  <label for="jobType" class="col-sm-2 control-label">업무 타입</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="jobType" name="jobType" value="${jInfo.jobType }" readonly>
                  </div>
                
                  <label for="jobStatus" class="col-sm-2 control-label">업무 상태</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="jobStatus" name="jobStatus" value="${jInfo.jobStatus }" readonly>
                  </div>
                 
                  <label for="createDate" class="col-sm-2 control-label">등록일</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="createDate" name="createDate" value="${jInfo.createDate }" readonly>
                  </div>
                 
                  <label for="memberName" class="col-sm-2 control-label">업무 담당자</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="memberName" name="memberName" value="${jInfo.memberName } ${jInfo.memberRank } (${jInfo.memberCompany } ${jInfo.memberDept })" readonly>
                  </div>
                
                  <label for="memberPhone" class="col-sm-2 control-label">담당자 연락처</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="memberPhone" name="memberPhone" value="${jInfo.memberPhone } (${jInfo.memberEmail })" readonly>
                  </div>
                 
                  </form>
            </div>
            <!-- ./box-body -->
            <br />
            
            <div align="center">
            	<button class="btn btn-warning" id="upBtn">수정하기</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            	<button class="btn btn-danger" id="delBtn" >삭제하기</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            	<button class="btn btn-primary" onclick="history.go(-1);">뒤로가기</button>
            </div>
            
            <br />
            
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      
    </section>
</div>
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
		<p style="display: block;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수정하시면 과거 정보는 지워집니다. 수정하시겠습니까?<br/><br/></p>
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
		<p style="display: block;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭제하시면 정보는 지워집니다. 삭제하시겠습니까?<br/><br/></p>
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


<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ -->
       
<%@include file="footer.jsp" %>
<div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

</body>
</html>
