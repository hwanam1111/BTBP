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

	<link rel="stylesheet" href="/BTBP/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	<link rel="stylesheet" href="/BTBP/resources/css/AdminLTE.min.css">
	<link rel="stylesheet" href="/BTBP/resources/css/skins/_all-skins.min.css">
	<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="/BTBP/resources/js/bootstrap.min.js"></script>
	<script src="/BTBP/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script src="/BTBP/resources/plugins/fastclick/fastclick.js"></script>
	<script src="/BTBP/resources/js/app.min.js"></script>
	<script src="/BTBP/resources/js/demo.js"></script>
	<script src="https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>
	<script src="/BTBP/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script type="text/javascript">
	$(function(){
		
		CKEDITOR.replace('boardContentArea');
		
		$('#backBtn').click(function(){
			var boardNo = ${bvo.boardNo};
			var backNo = boardNo-1;
			if(boardNo > 1){
				location.href="boardView.do?boardNo="+backNo;
			} else {
				alert('첫번째 글입니다.');
			}
		});
		
		$('#nextBtn').click(function(){
			var boardNo = ${bvo.boardNo};
			var nextNo = boardNo+1;
			location.href="boardView.do?boardNo="+nextNo;
		});
		
		$('#upBtn').click(function(){
			if(confirm("내용을 수정하시겠습니까?")){
				var boardNo = ${bvo.boardNo};
				var boardTitle = $('#boardTitle').val();
				var boardContent = $('#boardContentArea').val();
				$('[name=boardNo]').val(boardNo);
				$('[name=boardTitle]').val(boardTitle);
				$('[name=boardContent]').val(boardContent);
				
				$('#frm').submit();
				opener.location.reload();
			}
		});
		
		$('#delBtn').click(function(){
			if(confirm("글을 삭제하시겠습니까?")){
				var boardNo = ${bvo.boardNo};
				location.href="boardDelete.do?boardNo="+boardNo;
				opener.location.reload();
			}
		});
		
		$('.replyDelBtn').click(function(){
			if(confirm("댓글을 삭제하시겠습니까?")){
				var replyNo = $(this).attr("id");
				var boardNo = ${bvo.boardNo};
				location.href="replyDelete.do?replyNo="+replyNo+"&boardNo="+boardNo;
			}
		});
	});
	</script>
	<c:if test="${bvo.boardTitle == null}">
		<script type="text/javascript">
			history.go(-1);
			alert('최신글 입니다.');
		</script>
	</c:if>
</head>
<body>
	<div class="box box-widget" style="width: 100%;">
		
		<form id="frm" action="boardUpdate.do" method="post">
			<input type="hidden" name="boardNo" />
			<input type="hidden" name="boardTitle" />
			<input type="hidden" name="boardContent" />
		</form>
		
		<div class="box-header with-border">
			<h4>
				<c:if test="${bvo.memberId != sessionScope.memberId}">
				제목 : ${bvo.boardTitle }
				</c:if>
				<c:if test="${bvo.memberId == sessionScope.memberId}">
				<label for="boardTitle">제목 : </label><input type="text" id="boardTitle" class="form-control" value="${bvo.boardTitle }">
					<button id="upBtn" class="btn btn-box-tool">
						<span class="glyphicon glyphicon-pencil"></span>
					</button>
					<button id="delBtn" class="btn btn-box-tool">
						<span class="glyphicon glyphicon-remove"></span>
					</button>
				</c:if>
			</h4>
			<div align="right"><span class="glyphicon glyphicon-user"></span> ${bvo.memberId }, &nbsp;&nbsp;${bvo.createDate }</div>
			<div class="box-tools">
				<button id="backBtn" class="btn btn-box-tool">◁</button>
				<button id="nextBtn" class="btn btn-box-tool">▷</button>
			</div>
		</div>
		<div class="box-body" >
			<span class="glyphicon glyphicon-bullhorn"></span><br />
			<c:choose>
				<c:when test="${bvo.memberId != sessionScope.memberId}">
					${bvo.boardContent }
				</c:when>
				<c:otherwise>
					<textarea id="boardContentArea" class="form-control" rows="4" cols="4">${bvo.boardContent }</textarea>
				</c:otherwise>
			</c:choose>
			<br /><br />
			<span class="pull-right text-muted">조회수 ${bvo.boardCnt } - 댓글수 ${rList.size() }</span>
		</div>
		
		<!-- 댓글 리스트 출력 -->
		<c:if test="${!rList.isEmpty()}">	
			<c:forEach var="ReplyVO" items="${rList}">
				<div class="box-footer box-comments">
					<span class="username">
						${ReplyVO.memberId } &nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-comment"></span>
						<c:if test="${ReplyVO.memberId == sessionScope.memberId}">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="glyphicon glyphicon-remove replyDelBtn" id="${ReplyVO.replyNo}" style="cursor: pointer;"></span>
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
			<form action="replySave.do" method="post">
				<input type="hidden" name="boardNo" value="${bvo.boardNo}" >
				<input type="text" name="replyContent" class="form-control input-sm"
					placeholder="댓글 내용을 입력해주세요..">
			</form>
		</div>
		<!-- 댓글 입력 폼 -->

	</div>
</body>
</html>
