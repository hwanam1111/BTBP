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
.cols{
	font-weight: bold;
}
h3{
	text-align: center;
}
.protab{
	text-align: center;
}
</style>
<script type="text/javascript">
$(function(){
	
	$('.msgBtn').click(function(){
		var receiveId = $(this).attr('id');
		cw=screen.availWidth;     //화면 넓이
		ch=screen.availHeight;    //화면 높이
		sw=400;    //띄울 창의 넓이
		sh=360;    //띄울 창의 높이
		ml=(cw-sw)/2;
		mt=(ch-sh)/2; 
		test=window.open('messagePage.do?receiveId='+receiveId,'test','width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=no');
	});
	
	$('.addBtn').click(function(){
		var friendId = $(this).attr('id');
		location.href="friendAdd2.do?friendId="+friendId;
		alert('친구 추가 되었습니다.');
		opener.location.reload();
	});
	
	$('.delBtn').click(function(){
		var friendId = $(this).attr('id');
		location.href="friendRemove.do?page=project&friendId="+friendId;
		alert('친구 삭제 되었습니다.');
		opener.location.reload();
	});
});
</script>
	<c:if test="${addResult != null}">
		<script type="text/javascript">
			alert("${addResult}");
		</script>
	</c:if>
</head>
<body>

<h3>${mInfo.memberName }님의 상세정보</h3>

<table class="table table-striped">
	<tr>
		<td class="cols">아이디</td>
		<td colspan="2">${mInfo.memberId }</td>
	</tr>
	<tr>
		<td class="cols">이름</td>
		<td colspan="2">${mInfo.memberName }</td>
	</tr>
	<tr>
		<td class="cols">회사/부서/직급</td>
		<td colspan="2">${mInfo.memberCompany } / ${mInfo.memberDept } / ${mInfo.memberRank }</td>
	</tr>
	<tr>
		<td class="cols">연락처</td>
		<td colspan="2"><a href="tel:${mInfo.memberPhone }">${mInfo.memberPhone }</a></td>
	</tr>
	<tr>
		<td class="cols">이메일</td>
		<td colspan="2"><a href="mailto:${mInfo.memberEmail }">${mInfo.memberEmail }</a></td>
	</tr>
</table>
<hr>
<c:if test="${mInfo.memberId != sessionScope.memberId }">
<h3>함께 진행한 프로젝트(${pList.size()})</h3>
	<table class="table table-striped">
		<thead>
		<tr>
			<th class="protab">프로젝트명</th>
			<th class="protab">기간</th>
			<th class="protab">상태</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="ProjectVO" items="${pList }">
			<tr>
				<td class="protab">${ProjectVO.projectName }</td>
				<td class="protab">${ProjectVO.startDate } ~ ${ProjectVO.endDate }</td>
				<td class="protab">${ProjectVO.projectStatus }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

<br />
<div align="center">
	<c:choose>
		<c:when test="${friendCheck > 0 }">
			<button id="${mInfo.memberId }"  class="btn btn-danger delBtn">친구 삭제</button>
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${mInfo.searchStatus eq 'N' }">
					<button class="btn btn-danger">친구추가 거부</button>
				</c:when>
				<c:otherwise>
					<button id="${mInfo.memberId }"  class="btn btn-success addBtn">친구 추가</button> 
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
	
	<button id="${mInfo.memberId }" class="btn btn-warning msgBtn">1:1 대화</button>
</div>

</c:if>

</body>
</html>