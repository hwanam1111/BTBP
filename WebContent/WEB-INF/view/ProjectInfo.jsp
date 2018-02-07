<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="btbp.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
@import url(https://fonts.googleapis.com/earlyaccess/notosanskr.css);

body,table,div,p,h1,h2,h3,h4,h5,h6 {
   font-family: 'Noto Sans KR', serif;
}
.form-control{ 
	border-radius : 20px;
}
.datepicker{
	border-radius : 20px;
	width: 200px;
	text-align: center;
}
</style>
<script type="text/javascript">
$(function(){
	$('li').removeClass('active');
	$('#ProjectInfo').addClass('active');
	
	//Date picker
    $('.datepicker').datepicker({
      autoclose: true
    });
	
	$('#mgrBtn').click(function(){
		cw=screen.availWidth;     //화면 넓이
		ch=screen.availHeight;    //화면 높이
		sw=500;    //띄울 창의 넓이
		sh=500;    //띄울 창의 높이
		ml=(cw-sw)/2;
		mt=(ch-sh)/2; 
		test=window.open('PMtransfer.do?projectNo='+"${pInfo.projectNo}",'PMtransfer','width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=no');
	});
	$('#upBtn').click(function(){
		alert('프로젝트 정보가 수정되었습니다.');
		var budget = $('#projectBudget').val().replace(/,/g, '');
		$('#projectBudget').val(budget);
		$('#frm').submit();
	});
});
</script>
</head>
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
              <h3 class="box-title"><i class="fa fa-edit"></i>&nbsp;프로젝트 정보</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <form id="frm" action="ProjectInfoUpdate.do" method="post" class="form-horizontal">
              <div class="box-body">
              
                <div class="form-group">
                  <label for="projectName" class="col-sm-2 control-label">프로젝트 명</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="projectName" name="projectName" value="${pInfo.projectName }">
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="projectName" class="col-sm-2 control-label">프로젝트 상태</label>
                  <div class="col-sm-10">
                  	<c:choose>
                  		<c:when test="${pInfo.projectStatus eq 'doing'}">
                  			<input type="radio" name="projectStatus" value="doing" checked><span class="badge bg-yellow">진행중</span> &nbsp;&nbsp;
							<input type="radio" name="projectStatus" value="done" ><span class="badge bg-red">완료</span>

                  		</c:when>
                  		<c:otherwise>
                  			<input type="radio" name="projectStatus" value="doing"><span class="badge bg-yellow">진행중</span> &nbsp;&nbsp;
							<input type="radio" name="projectStatus" value="done"  checked><span class="badge bg-red">완료</span>
                  		</c:otherwise>
                  	</c:choose>
                  	<div class="progress progress-xs progress-striped active" style="width: 180px; position: absolute; top: 9px; left: 170px;">
						<c:choose>
							<c:when test="${datePer < 25 }">
								<div class="progress-bar progress-bar-success" style="width: ${datePer}%"></div>
							</c:when>
							<c:when test="${datePer < 50 }">
								<div class="progress-bar progress-bar-primary" style="width: ${datePer}%"></div>
							</c:when>
							<c:when test="${datePer < 75 }">
								<div class="progress-bar progress-bar-warning"  style="width: ${datePer}%"></div>
							</c:when>
							<c:otherwise>
								<div class="progress-bar progress-bar-danger"  style="width: ${datePer}%"></div>
							</c:otherwise>
						</c:choose>
	                </div>
	                		<c:choose>
							<c:when test="${datePer < 25 }">
								<span class="badge bg-green" style="position:absolute;  top: 4px; left: 355px;">${datePer}%</span>
							</c:when>
							<c:when test="${datePer < 50 }">
								<span class="badge bg-blue" style="position:absolute;  top: 4px; left: 355px;">${datePer}%</span>
							</c:when>
							<c:when test="${datePer < 75 }">
								<span class="badge bg-yellow" style="position:absolute;  top: 4px; left: 355px;">${datePer}%</span>
							</c:when>
							<c:otherwise>
								<span class="badge bg-red" style="position:absolute;  top: 4px; left: 355px;">${datePer}%</span>
							</c:otherwise>
						</c:choose>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="projectName" class="col-sm-2 control-label">프로젝트 설명</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="projectDetail" name="projectDetail" value="${pInfo.projectDetail }">
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="projectName" class="col-sm-2 control-label">발주사</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="orderCompany" name="orderCompany" value="${pInfo.orderCompany }">
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="projectName" class="col-sm-2 control-label">수주사</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="obtainCompany" name="obtainCompany" value="${pInfo.obtainCompany }">
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="projectName" class="col-sm-2 control-label">프로젝트 예산 (단위 : 천원)</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="projectBudget" name="projectBudget" value="<fmt:formatNumber value="${pInfo.projectBudget }"  pattern="#,###.##" />">
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="projectName" class="col-sm-2 control-label">프로젝트 기간</label>
                  <div class="col-sm-6">
                    <input type="text" id="startDate" name="startDate" class="datepicker" value="${pInfo.startDate }"> ~ <input type="text" name="endDate" class="datepicker" value="${pInfo.endDate }">
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="projectName" class="col-sm-2 control-label">프로젝트 관리자</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="memberId" name="memberId" value="${pInfo.memberId }" readonly="readonly" />
                  </div>
                </div>
                
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
              	<c:if test="${pInfo.memberId == sessionScope.memberId }">
              		<button type="button" id="mgrBtn" class="btn btn-warning">관리자 인계</button>
                	<button type="button" id="upBtn" class="btn btn-success pull-right">수정</button>
                </c:if>
              </div>
              <!-- /.box-footer -->
              <input type="hidden" name="projectNo" value="${pInfo.projectNo }" />
            </form>
            </div>
            <!-- ./box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      
    </section>
</div>




<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ -->

<%@include file="footer.jsp" %>
<div class="control-sidebar-bg"></div>
</div>
</body>
</html>
