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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style type="text/css">
.protab, h3{
	text-align: center;
}
</style>
<script type="text/javascript">
$(function(){
	$('.selBtn').click(function(){
		$('#memberId').val($(this).attr("id"));
		$('#memName').val($(this).parent().prev().prev().text());
		$('#memComp').val($(this).parent().prev().text());
	});
	
	$('#fransferBtn').click(function(){
		if($('#memName').val()==""){
			$('#memName').focus();
			alert('인계자를 선택해주세요.');
			return;
		}
		
		if(confirm('선택한 팀원에게 관리자 권한을 인계하시겠습니까?')==true){
			$('#frm').submit();
		} else{
			return;
		}
		opener.location.href="ProjectMain.do?projectNo="+"${sessionScope.projectNo}";
	});
});
</script>
</head>
<body>

	<h3>프로젝트 관리자 인수인계</h3>
	<br />
	
	<form id="frm" action="PMtransferOk.do" method="post">
		<input type="hidden" id="memberId" name="memberId" readonly />
		<div class="form-group">
			<label for="memberName">이름</label>
			<input type="text" id="memName" class="form-control" readonly />
		</div>
		<div class="form-group">
			<label for="memComp">회사/부서/직급</label>
			<input type="text" id="memComp" class="form-control" readonly />
		</div>
		<div align="center">
			<button type="button" id="fransferBtn" class="btn btn-warning">인계하기</button>
		</div>
	</form>
<hr />

	<table class="table table-striped">
		<thead>
		<tr>
			<th class="protab">이름</th>
			<th class="protab">회사/부서/직급</th>
			<th class="protab"></th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="ProjectMemberVO" items="${pList }">
			<c:if test="${ProjectMemberVO.memberId != sessionScope.memberId }">
				<tr>
					<td class="protab">${ProjectMemberVO.memberName } (${ProjectMemberVO.grade })</td>
					<td class="protab">${ProjectMemberVO.memberCompany } / ${ProjectMemberVO.memberDept } / ${ProjectMemberVO.memberRank }</td>
					<td class="protab"><button id="${ProjectMemberVO.memberId}" class="btn btn-success selBtn">선택</button></td>
				</tr>
			</c:if>
		</c:forEach>
		</tbody>
	</table>


</body>
</html>