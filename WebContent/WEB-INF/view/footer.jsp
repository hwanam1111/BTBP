<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="btbp.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	$(function(){
		$('#chatMessage').focus();
		$(".direct-chat-messages").scrollTop($(".direct-chat-messages")[0].scrollHeight);
		
		setInterval(function() {
               $.ajax({
                  url : "chatContent.do?projectNo=${sessionScope.projectNo}",
                  type : "get",
                  success : function(data) {
						$('#chatContent').html(data);
						var scrollPos = $(".direct-chat-messages").scrollTop();
						var scrollHeight = $(".direct-chat-messages")[0].scrollHeight;
						if(scrollHeight-scrollPos < 600) {
							$(".direct-chat-messages").scrollTop($(".direct-chat-messages")[0].scrollHeight);
						} else {
							$(".direct-chat-messages").scrollTop($(".direct-chat-messages")[scrollPos].scrollHeight);
						}
					},
                  error : function(data) {
                     //alert(data + "에러");
                  }
               });
		 }, 1000);
	});

	function enterEvt(){
		var chatMessage = $('#chatMessage').val();
		$('#chatMessage').focus();
		$(".direct-chat-messages").scrollTop($(".direct-chat-messages")[0].scrollHeight);
		
		if(chatMessage==""){
			return;
		}
		
		$.ajax({
            url : "chatSend.do?projectNo=${sessionScope.projectNo}&chatMessage="+chatMessage,
            type : "get",
            success : function(data) {
            	$('#chatMessage').val("");
            	$('#chatMessage').focus();
				$(".direct-chat-messages").scrollTop($(".direct-chat-messages")[0].scrollHeight);
            },
            error : function(data) {
            	$('#chatMessage').val("");
            }
         });
	};
</script>

<aside class="control-sidebar control-sidebar-dark" id="chatting_bar">
	<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
		<li class="active">
			<a href="#control-sidebar-home-tab" data-toggle="tab">
				<i class="fa fa-users"></i>
			</a>
		</li>
		<li>
			<a href="#control-sidebar-settings-tab" data-toggle="tab">
				<i class="fa fa-wechat"></i>
			</a>
		</li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane active" id="control-sidebar-home-tab">
			<h3 class="control-sidebar-heading" style="text-align: center">
				<i class="fa fa-send"></i>&nbsp;&nbsp;멤버 목록
			</h3>
			<br />
			<ul class="contacts-list control-sidebar-menu">
				<!-- @@@@@@프로젝트 멤버 -->
				<c:if test="${!pList.isEmpty()}">
					<c:forEach var="ProjectMemberVO" items="${pList}">
						<c:if test="${ProjectMemberVO.memberId != sessionScope.memberId }"> <!-- 자기 자신은 목록에서 제외 -->
							<li>
								<div align="right">
									<c:if test="${ProjectMemberVO.memberImageName != null}">
										<img src="/BTBP/resources/upload/Members/${ProjectMemberVO.memberImageName }" id="${ProjectMemberVO.memberId}" width=40px height=40px class="img-rounded img-raised messagePage" style="position: relative; top:0px; cursor: pointer;">
									</c:if>
								       <c:if test="${ProjectMemberVO.memberImageName == null}">
										<img src="/BTBP/resources/assets/img/logo.png" id="${ProjectMemberVO.memberId}" width=40px height=40px class="img-rounded img-raised messagePage" style="position: relative; top:0px; cursor: pointer;">
									</c:if> 
									<div class="pull-left info" align="left">
										<p style="margin-bottom: 0;">${ProjectMemberVO.memberName } (${ProjectMemberVO.grade })</p>
										<c:choose>
											<c:when test="${ProjectMemberVO.loginStatus != null }">
												<i class="fa fa-circle text-success"></i> Online
											</c:when>
											<c:otherwise>
												<i class="fa fa-circle text-danger"></i> Offline
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</li>
						</c:if>
					</c:forEach>
				</c:if>
				<!-- @@@@@@프로젝트 멤버 -->
			</ul>
		</div>
		<!--==========================채팅탭 =========================== -->
		<div class="tab-pane" id="control-sidebar-settings-tab">
			<h3 class="control-sidebar-heading" style="text-align: center">
				팀 채팅방&nbsp;&nbsp;<i class="fa fa-commenting"></i>
			</h3>
			<br />
			<!-- @@@@@@@@@@@@@@@@@@팀 채팅 -->
			<div class="box box-primary direct-chat direct-chat-primary">
				<div class="box-body">
					<div class="direct-chat-messages" id="chatContent" style="height: 500px"><!-- 채팅 내용 뿌려주는 곳 --></div>
				</div>
				
				<div class="box-footer">
					<div class="input-group">
						<input type="text" id="chatMessage" name="chatMessage" placeholder="메세지 입력란.." class="form-control" onkeypress="if(event.keyCode==13) { enterEvt(); }">
						<span class="input-group-btn">
							<button type="button" class="btn btn-primary btn-flat" onclick="enterEvt();">입력</button>
						</span>
					</div>
				</div>
			</div>
			<!-- @@@@@@@@@@@@@@@@@@팀 채팅 -->
		</div>
	</div>
</aside>
