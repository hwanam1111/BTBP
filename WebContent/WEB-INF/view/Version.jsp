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
<link rel="stylesheet" href="/BTBP/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="/BTBP/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet" href="/BTBP/resources/css/AdminLTE.min.css">
<link rel="stylesheet" href="/BTBP/resources/css/skins/_all-skins.min.css">
<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/BTBP/resources/js/bootstrap.min.js"></script>
<script src="/BTBP/resources/plugins/fastclick/fastclick.js"></script>
<script src="/BTBP/resources/js/app.min.js"></script>
<script src="/BTBP/resources/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="/BTBP/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="/BTBP/resources/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="/BTBP/resources/plugins/chartjs/Chart.min.js"></script>
<!-- <script src="/BTBP/resources/js/pages/dashboard2.js"></script> -->
<script src="/BTBP/resources/js/demo.js"></script>
<style type="text/css">
@import url(https://fonts.googleapis.com/earlyaccess/notosanskr.css);

body,table,div,p,h1,h2,h3,h4,h5,h6 {
   font-family: 'Noto Sans KR', serif;
}
.title{
	font-weight: bold;
}
</style>
<script type="text/javascript">
$(function(){
	$('li').removeClass('active');
	$('#Version').addClass('active');
	
	$('.conDiv').hover(
		function(){
			$(this).css("color", "#FFBB00");
		},
		function(){
			$(this).css("color", "black");
		}
	)
	
	$('.conDiv').click(function(){
		var boardNo = $(this).attr("id");
		if(confirm('해당 버전을 삭제하시겠습니까?')==true){
			location.href="boardDelete.do?boardType=version&boardNo="+boardNo;
		}
	});
	
	$('#versionBtn').click(function(){
		var lastVal = parseFloat($('#lastVal').val().replace('v', ''))+0.1;
		$('#boardTitle').val(lastVal.toFixed(1)+'v');
	});
	
	$('#saveBtn').click(function(){
		if($('#boardTitle').val()==""){
			return;
		} else if($('#boardContent').val()==""){
			return;
		} else if($('#file').val()==""){
			return;
		}
		
		$('#frm').attr('action', 'VersionSave.do');
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
				<h1>형상관리</h1>
			</section>
			<section class="content">
				<div class="col-md-12">
        			<div class="box box-danger">
						<div class="box-header with-border">
							<h3 class="box-title"><i class="fa fa-folder-open"></i>&nbsp;형상 관리 (${bList.size()})</h3>
							<div align="right">
								<!-- Button trigger modal -->
								<button type="button" id="versionBtn" class="btn btn-warning" data-toggle="modal" data-target="#myModal">
								  버전 등록
								</button>
							</div>
							
								<div class="box-body" style="border-color: red; border-bottom: 5px;">
										
										<c:if test="${!bList.isEmpty()}">
										  <c:forEach var="BoardVO" items="${bList}" varStatus="status"> 
						           			<c:if test="${status.first }"> <input type="hidden" id="lastVal" value=${BoardVO.boardTitle }> </c:if>
											<div class="col-md-4" style="border-color: red; border-bottom: 5px;">
											<div class="info-box" style="border-color: red; border-bottom: 5px;">
												<span>
													<c:choose>
							                    		<c:when test="${BoardVO.memberImageName != null}">
							                    			<img src="/BTBP/resources/upload/Members/${BoardVO.memberImageName }"  style="width:80px;  height:80px; border-radius: 30px;" >
							                    		</c:when>
							                    		<c:otherwise>
							                    			<img src="/BTBP/resources/assets/img/logo.png" style="width:80px;  height:80px; border-radius: 30px; " >
							                    		</c:otherwise>
							                    	</c:choose>
												</span>

												<div class="info-box-content">
													<div class="title" style="position: absolute; top:0px;">${BoardVO.boardTitle }</div>
													<div class="title" style="position: absolute; top:0px; right: 25px;">${BoardVO.createDate }</div>
													
													<div style="position: absolute; top:40px;">${BoardVO.boardContent }</div>
													<div style="position: absolute; bottom:20px; right: 25px; cursor: pointer;">
													<c:if test="${BoardVO.memberId == sessionScope.memberId}">
														<span id="${BoardVO.boardNo}" class="conDiv glyphicon glyphicon-remove" style="color:red"></span> &nbsp;&nbsp;
													</c:if>	
														<a href="fileDownload.do?boardNo=${BoardVO.boardNo}" download>
															<span title="${BoardVO.fileName}" class="glyphicon glyphicon-file"></span>
														</a>
													</div>
													
												</div>
											</div>
										</div>
						
						                  </c:forEach>
										</c:if>
						               
										<c:if test="${bList.isEmpty()}">
											작성된 게시물이 없습니다.
										</c:if>
										
									</div>
							</div>
						</div>
					</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->




		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ -->

<%@include file="footer.jsp" %>
<div class="control-sidebar-bg"></div>
</div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">버전 등록 창</h4>
      </div>
      <div class="modal-body">
         <form id="frm" action="#" method="post" enctype="multipart/form-data">
         	<div class="form-group">
         		<label for="boardTitle">버전</label>
         		<input type="text" id="boardTitle" name="boardTitle" class="form-control" />
         	</div>
         	<div class="form-group">
         		<label for="boardContent">내용</label>
         		<textarea id="boardContent" name="boardContent" class="form-control" rows="4" cols="4"></textarea>
         	</div>
         	<div class="form-group">
			    <label for="file">파일 업로드</label>
			    <input type="file" id="file" name="file">
			 </div>
			 <input type="hidden" name="boardType" value="version" >
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-warning" id="saveBtn">등록</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->

</body>
</html>