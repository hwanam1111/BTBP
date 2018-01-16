<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="btbp.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String boardType = request.getParameter("boardType"); %>
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
  <link rel="stylesheet" href="/BTBP/resources/css/AdminLTE.min.css">
  <link rel="stylesheet" href="/BTBP/resources/css/skins/skin-purple.min.css">
<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/BTBP/resources/js/bootstrap.min.js"></script>
<script src="/BTBP/resources/js/app.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
<style type="text/css">
@import url(https://fonts.googleapis.com/earlyaccess/notosanskr.css);

body,table,div,p,h1,h2,h3,h4,h5,h6 {
   font-family: 'Noto Sans KR', serif;
}
	th, td{
		text-align: center;
	}	
	a{ 
		text-decoration:none ;
		color: red;
	}	
 	.box-header.with-border { 
     border-bottom: 2px solid #eee; 
 	} 	
 	.table>thead>tr>th {
     vertical-align: middle;     
	 border-bottom: 2px solid #eee;
    } 	
	.table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td, .table>tbody>tr>td, .table>tfoot>tr>td {
		border-top: 1px solid rgba(210, 214, 222, 0.43);
	}	
	.box-footer{
		border-top: 1px solid rgba(210, 214, 222, 0.66);
	}	
	.mailbox-read-info {
    border-bottom: 1px solid rgba(210, 214, 222, 0.66);	
    }
    
    .h4, .h5, .h6, h4, h5, h6 {
    margin-top: 0px;
    margin-bottom: 0px;
	}
</style>
	
	
<script type="text/javascript">
	$(function(){
		
		$('li').removeClass('active');
		<% if(boardType.equals("board")) {%>
			$('#Board').addClass('active');
		<% } else { %>
			$('#Notice').addClass('active');
		<% } %>
		
		$('#backBtn').click(function(){
			var boardNo = ${bvo.boardNo};
			var backNo = boardNo-1;
			if(boardNo > 1){
				location.href="ProjectBoardDetail.do?boardNo="+backNo;
			} else {
				alert('첫번째 글입니다.');
			}
		});
		
		$('#nextBtn').click(function(){
			var boardNo = ${bvo.boardNo};
			var nextNo = boardNo+1;
			location.href="ProjectBoardDetail.do?boardNo="+nextNo;
		});
		
		$('#upBtn').click(function(){
			if(confirm("내용을 수정하시겠습니까?")){
				var boardNo = ${bvo.boardNo};
				var boardTitle = $('#boardTitle').val();
				var boardContent = $('#boardContent').val();
				$('[name=boardNo]').val(boardNo);
				$('[name=boardTitle]').val(boardTitle);
				$('[name=boardContent]').val(boardContent);
				
				$('#frm').submit();
				
			}
		});
		
		$('#delBtn').click(function(){
			if(confirm("글을 삭제하시겠습니까?")){
				
				var boardNo = ${bvo.boardNo};
				var boardType= '${bvo.boardType}';
				var nowpagenum = ${nowpagenum};
// 				alert(boardType);
				location.href="ProjectBoardDelete.do?boardNo="+boardNo+"&boardType="+boardType+"&pageNo="+nowpagenum;				 
				confirm("삭제를 완료했습니다");
			}
		});
		
		$('.replyDelBtn').click(function(){
			if(confirm("댓글을 삭제하시겠습니까?")){
				var replyNo = $(this).attr("id");
				var boardNo = ${bvo.boardNo};
				var boardType= '${bvo.boardType}';
				var nowpagenum = ${nowpagenum};
				location.href="ProjectBoardReplyDel.do?replyNo="+replyNo+"&boardNo="+boardNo+"&boardType="+boardType+"&pageNo="+nowpagenum;
			}
		});
		
		
	});
</script>


</head>


<body class="hold-transition skin-purple sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <%@include file="header.jsp" %>
  <!-- Left side column. contains the logo and sidebar -->
  <%@include file="menu.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
      	팀 게시판
        <small>프로젝트 팀원들만의 게시판</small>
      </h1>
    </section>

 <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-primary">
          

<!-- 수정하기 눌렀을때 화면 넘어가짐	 -->                  
		<form id="frm" action="ProjectBoardModify.do?boardNo=${bvo.boardNo}&boardType=${bvo.boardType}&pageNo=${nowpagenum}" method="post">
<!-- 			<input type="hidden" name="boardNo" /> -->
<!-- 			<input type="hidden" name="boardTitle" /> -->
<!-- 			<input type="hidden" name="boardContent" /> -->
		</form>
		
		
          
            <div class="box-header with-border">
              <h3 class="box-title">팀 게시판</h3>

              <div class="box-tools">
                <button id="backBtn" class="btn btn-box-tool" data-toggle="tooltip" title="Prev">
                	<i class="fa fa-chevron-left"></i>
                </button>
                <button id="nextBtn" class="btn btn-box-tool" data-toggle="tooltip" title="Next">
               	    <i class="fa fa-chevron-right"></i>
               	</button>
              </div>
            </div>
            <!-- /.box-header -->
            
            
            <div class="box-body no-padding">
              <div class="mailbox-read-info">
                <c:if test="${bvo.memberId != sessionScope.memberId}">
					<h4><b>제목 : </b>${bvo.boardTitle}</h4>
				</c:if>
				<c:if test="${bvo.memberId == sessionScope.memberId}">
					<h4><b>제목 : </b>${bvo.boardTitle}</h4>   
				</c:if>             
                  <div align="right"><span class="glyphicon glyphicon-user"></span> <b>${bvo.memberId }</b> &nbsp;&nbsp;&nbsp;${bvo.createDate }</div>
              </div>
              <!-- /.mailbox-read-info -->
              <div class="mailbox-read-message">
                <p>
                  ${bvo.boardContent}
                <p>
             </div>
             <c:if test="${bvo.fileName !=null }">
			<!-- 팀 게시판 제목 눌러서 들어왔을때 파일 다운로드 목록 보여지게 -->
			<div class="mailbox-attachment-info" style="padding: 3px">
				&nbsp; <a href="fileDownload.do?boardNo=${file.boardNo}"
					class="mailbox-attachment-name"> <i
					class="fa fa-paperclip"></i>&nbsp; ${file.fileName}
				</a> <span class="" style="padding-left: 20px">
					${file.fileSize} KB <a
					href="fileDownload.do?boardNo=${file.boardNo}"
					class="btn btn-default btn-xs"> <i
						class="fa fa-cloud-download"></i>
				</a>
				</span>
			</div>
			<!-- 팀 게시판 제목 눌러서 들어왔을때 파일 다운로드 목록 보여지게 -->
            </c:if>


				<div>
			<span class="pull-right"><b>조회수</b> ${bvo.boardCnt }<b> ,</b> <b>댓글</b> ${rList.size() }&nbsp;</span>
             </div>
              <!-- /.mailbox-read-message -->
            </div>
            <!-- /.box-body -->
            
            
		<!-- 댓글 리스트 출력 -->
		<c:if test="${!rList.isEmpty()}">	
			<c:forEach var="ReplyVO" items="${rList}">
				<div class="box-footer box-comments">
					<span class="username">
						${ReplyVO.memberId } &nbsp;<span class="glyphicon glyphicon-comment"></span>
						<c:if test="${ReplyVO.memberId == sessionScope.memberId}">
						&nbsp;
							<a href="#"><span class="glyphicon glyphicon-remove replyDelBtn" id="${ReplyVO.replyNo}" ></span></a>
						</c:if>
					</span>
					<span class="text-muted pull-right">${ReplyVO.createDate }</span>
					<div style="left:20px;">${ReplyVO.replyContent }</div> 
				</div>
			</c:forEach>
		</c:if>
		<!-- 댓글 리스트 출력 -->
		<!-- 댓글 입력 폼 -->
		<div class="box-footer">
			<form action="ProjectReplySave.do" method="post">
				<input type="hidden" name="boardNo" value="${bvo.boardNo}" >
					<input type="hidden" name="boardType" value="${bvo.boardType}">
					   <input type="hidden" name="pageNo" value="${nowpagenum}">
				<input type="text" name="replyContent" class="form-control input-sm"
					placeholder="댓글 내용을 입력해주세요...">
			</form>
		</div>
		<!-- 댓글 입력 폼 -->
        <!-- /.box-footer -->
        
            <div class="box-footer">
		    <c:if test="${bvo.memberId == sessionScope.memberId}">
              <div class="pull-right">
              	
					<button id="upBtn" class="btn btn-default">
						<i class="fa fa-pencil"></i> 수정
					</button>
			  		
                <button id="delBtn" class="btn btn-danger">
                	<i class="fa fa-trash-o"></i> 삭제
                </button>
              </div>
			</c:if>
              
				<a href="ProjectBoard.do?boardType=${bvo.boardType }&pageNo=${nowpagenum}">	
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
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
  

  <!-- Main Footer -->
  <%@include file="footer.jsp" %>
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->


</body>
</html>