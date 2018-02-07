<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="btbp.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
		@import url('https://fonts.googleapis.com/earlyaccess/hanna.css');
		*{font-family: 'Hanna', sans-serif;}
	</style>
</head>
<body>

<!-- 메세지 뿌려주는 곳 START -->
					<c:forEach var="MessageVO" items="${mList }"> <!-- DB에서 가져온 메세지 리스트를 반복문 돌림 -->
						<c:choose>
							<c:when test="${MessageVO.sendId == sessionScope.memberId}"> <!-- 보낸이가 나라면 -->
									<div class="direct-chat-msg right">
										<div class="direct-chat-info clearfix">
											<span class="direct-chat-name pull-right">${mInfo.memberName }</span>
											<span class="direct-chat-timestamp pull-left">${MessageVO.mdate }</span>
										</div>
										<c:if test="${mInfo.memberImageName != null}">
											<img class="direct-chat-img" src="/BTBP/resources//upload/Members/${mInfo.memberImageName }">
										</c:if>
								        <c:if test="${mInfo.memberImageName == null}">
											<img class="direct-chat-img" src="/BTBP/resources//assets/img/logo.png" >
										</c:if>
										<div class="direct-chat-text">${MessageVO.message }</div>
									</div>
							</c:when>
							<c:otherwise> <!-- 받는이가 나라면 -->
								<div class="direct-chat-msg">
									<div class="direct-chat-info clearfix">
										<span class="direct-chat-name pull-left">${fInfo.memberName }</span>
										<span class="direct-chat-timestamp pull-right">${MessageVO.mdate }</span>
									</div>
									<c:if test="${fInfo.memberImageName != null}">
											<img class="direct-chat-img" src="/BTBP/resources//upload/Members/${fInfo.memberImageName }">
										</c:if>
								        <c:if test="${fInfo.memberImageName == null}">
											<img class="direct-chat-img" src="/BTBP/resources//assets/img/logo.png" >
										</c:if>
									<div class="direct-chat-text">${MessageVO.message }</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 메세지 뿌려주는 곳 END -->

</body>
</html>