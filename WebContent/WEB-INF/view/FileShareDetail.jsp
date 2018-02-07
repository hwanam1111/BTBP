<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="/BTBP/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="/BTBP/resources/css/AdminLTE.min.css">
  <link rel="stylesheet" href="/BTBP/resources/css/skins/skin-purple.min.css">
  <link rel="stylesheet" href="/BTBP/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="/BTBP/resources/plugins/css/modal.css">
    
 <!-- REQUIRED JS SCRIPTS -->

<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/BTBP/resources/plugins/bootstrap/bootstrap.min.js"></script>
<script src="/BTBP/resources/plugins/app/app.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="/BTBP/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<style>
		@import url('https://fonts.googleapis.com/earlyaccess/hanna.css');
		*{font-family: 'Hanna', sans-serif;}
	</style>
<script >
$(function () {
    //Add text editor
   
	$('#FileShareDelete').click(function(){	
		$('#delete_modal').show();
	})
	
	// 삭제 버튼
	$('#delete_confirm').click(function(){ 
		
	location.href='fileShareDelete.do?boardNo=${bvo.boardNo}&boardType=${bvo.boardType}&pageNo=${nowpagenum}'; 
	});

	// 취소하기 버튼
	
	$('#delete_cancel').click(function(){ 
		location.href="FileShareDetail.do?boardNo=${BoardVO.boardNo}&boardType=${bvo.boardType}&pageNo=${nowpagenum}";
	});
    
	 $("#compose-textarea").wysihtml5();
	 
	 
  });
</script>   
    
<script type="text/javascript">
$(function(){
	$('li').removeClass('active');
	$('#FileShareMenu').addClass('active');
});
</script>   
</head>
<style>
button{background-color:gray;color:#fff;border:none;box-shadow:none;font-size:14px;font-weight:500;-webkit-border-radius:4px;border-radius:5px;  padding:8px 28px;cursor:pointer}
</style>
<body class="hold-transition skin-purple sidebar-mini">
<div class="wrapper">
	<!-- Main Header -->
	<%@include file="header.jsp" %>			
	<!-- Left side column. contains the logo and sidebar -->
	<%@include file="menu.jsp" %>
  <!-- Content Wrapper. Contains page content -->
 
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header"></section>

 <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-11">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-inbox"></i> 파일 공유</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
            
              <div class="mailbox-read-info">
                <h3>${BoardVO.boardTitle}</h3>
					<div align="right"><span class="glyphicon glyphicon-user"></span> <b>${BoardVO.memberId }</b> &nbsp;&nbsp;&nbsp;${BoardVO.createDate }</div>
              </div>
              <!-- /.mailbox-read-info -->

              <div class="mailbox-read-message">
             	${BoardVO.boardContent}
              </div>
              <!-- /.mailbox-read-message -->

<div class="box-footer">
    <ul class="mailbox-attachments clearfix">
              
                <c:set var="string1" value="${BoardVO.fileName}"/>
                <c:set var="FileShareType" value="${fmt:substringAfter(string1,'.')}"/>  
                <c:set var="memberId" value="${BoardVO.memberId}"/>
                <c:set var="boardNo" value="${BoardVO.boardNo}"/>
                              
            <li>
               
		                <c:choose>
		                
		                  <c:when test="${FileShareType == 'png' || FileShareType == 'img' || FileShareType == 'gif' || FileShareType == 'jpg' ||FileShareType == 'JPEG' }">
		                  	<span class="mailbox-attachment-icon has-img" style="width: 200px; height: 150px;">
		                  		<img src="/BTBP/resources/upload/BoardFiles/${BoardVO.fileSaveName}" alt="Attachment" style="width: 200px; height: 150px;">
		                  	</span>
		                	<div class="mailbox-attachment-info" style="width: 198.4px; height: 60px;">
		                    	<a href="fileDownload.do?boardNo=${BoardVO.boardNo}" class="mailbox-attachment-name">
		                    		<i class="fa fa-camera"></i>&nbsp; ${BoardVO.fileName}
		                    	</a>
		                     </div>		                  	
		                  </c:when>
		                  
		                  <c:when test="${FileShareType == 'docx'}">
		                  	<span class="mailbox-attachment-icon" style="width: 200px; height: 150px;">
		                  		<i class="fa fa-file-word-o"></i>
		                  	</span>
		                	<div class="mailbox-attachment-info">
		                    	<a href="fileDownload.do?boardNo=${BoardVO.boardNo}" class="mailbox-attachment-name">
		                    		<i class="fa fa-paperclip"></i> ${BoardVO.fileName}
		                    	</a>
		                	</div>		                  	
		                  </c:when>
		                  
		                  <c:when test="${FileShareType == 'xlsx'}">
		                  	<span class="mailbox-attachment-icon" style="width: 200px; height: 150px;">
		                  		<i class="fa fa-file-excel-o"></i>
		                  	</span>
		                	<div class="mailbox-attachment-info">
		                    	<a href="fileDownload.do?boardNo=${BoardVO.boardNo}" class="mailbox-attachment-name">
		                    		<i class="fa fa-paperclip"></i> ${BoardVO.fileName}
		                    	</a>
		                	</div>		                  	
		                  </c:when>

		                  <c:when test="${FileShareType == 'txt'}">
		                  	<span class="mailbox-attachment-icon" style="width: 200px; height: 150px;">
		                  		<i class="fa fa-file-text-o"></i>
		                  	</span>
		                  	<div class="mailbox-attachment-info">
		                    	<a href="fileDownload.do?boardNo=${BoardVO.boardNo}" class="mailbox-attachment-name">
		                    		<i class="fa fa-paperclip"></i> ${BoardVO.fileName}
		                    	</a>
		                  	</div>		                  	
		                  </c:when>
		                  		                  
		                  <c:otherwise>
		                  	<span class="mailbox-attachment-icon" style="width: 200px; height: 150px;">
		                  		<i class="fa fa-file-text-o"></i>
		                  	</span>
		                  	<div class="mailbox-attachment-info">
		                    	<a href="fileDownload.do?boardNo=${BoardVO.boardNo}" class="mailbox-attachment-name" >
		                    		<i class="fa fa-paperclip"></i> ${BoardVO.fileName}
		                    	</a>
		                  	</div>		                  	
		                  </c:otherwise>
		                  
		                </c:choose>
                  
                
			   
                        <span class="mailbox-attachment-size" style="padding-left: 10px"> 
                          ${BoardVO.fileSize} KB
                          <a href="fileDownload.do?boardNo=${BoardVO.boardNo}" class="btn btn-default btn-xs pull-right"><i class="fa fa-cloud-download"></i></a>
                        </span>
                  
                  
      

				 <div>
				   <span class="pull-right" style="bottom:55px; right:10px; position:absolute;"><b>조회수</b> ${bvo.boardCnt }</span>
		         </div>
		              <!-- /.mailbox-read-message -->

             </li>
             
       
    </ul>
</div>
           <!-- /.box-footer -->
            <div class="box-footer">
	 		    <c:if test="${bvo.memberId == sessionScope.memberId}">
	              <div class="pull-right">
				  		
	                <button id="FileShareDelete" class="btn btn-danger">
	                	<i class="fa fa-trash-o"></i> 삭제
	                </button>
	              </div>
				</c:if>
				
					<a href="FileShare.do?boardType=${bvo.boardType }&pageNo=${nowpagenum}">	
						<button id="Return" class="btn btn-primary">
							<i class="fa fa-undo"></i> 뒤로가기
						</button>              
	           		</a>  				
				
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /. box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <%@include file="footer.jsp" %>
  <!-- /Main Footer -->
  <div class="control-sidebar-bg"></div>
</div>
  <!-- 팝업 창 시작 부분 (삭제)-->
	<div id="delete_modal" class="sweet-alert showSweetAlert visible"
		data-custom-class="" data-has-cancel-button="true"
		data-has-confirm-button="true" data-allow-outside-click="false"
		data-has-done-function="true" data-animation="pop" data-timer="null"
		style="display: none; margin-top: -220px;">
		<div class="sa-icon sa-error" style="display: none;">
			<span class="sa-x-mark"><span class="sa-line sa-left"></span>
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
		<h2>파일 삭제</h2>
		<fieldset>
			<input type="text" tabindex="3" placeholder="ddddddddddddd">
			<div class="sa-input-error"></div>
		</fieldset>
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
			</div>
		</div>
	</div>
  <!-- 모달 팝업 시작 부분(수정) -->
<!-- ./wrapper -->


</body>
</html>