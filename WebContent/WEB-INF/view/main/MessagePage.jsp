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
	<script src="/BTBP/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script src="/BTBP/resources/plugins/chartjs/Chart.min.js"></script>
	<script src="/BTBP/resources/js/pages/dashboard2.js"></script>
	<script src="/BTBP/resources/js/demo.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
	<script type="text/javascript">
	$(function(){
		
		$('#message').focus();
		$(".direct-chat-messages").scrollTop($(".direct-chat-messages")[0].scrollHeight);
		
		setInterval(function() {
               $.ajax({
                  url : "messageContent.do?receiveId=${fInfo.memberId}",
                  type : "get",
                  success : function(data) {
						$('#msgContent').html(data);
						var scrollPos = $(".direct-chat-messages").scrollTop();
						var scrollHeight = $(".direct-chat-messages")[0].scrollHeight;
						if(scrollHeight-scrollPos < 400) {
							$(".direct-chat-messages").scrollTop($(".direct-chat-messages")[0].scrollHeight);
						} else {
							$(".direct-chat-messages").scrollTop($(".direct-chat-messages")[scrollPos].scrollHeight);
						}
				},
                  error : function(data) {
                     alert(data + "에러");
                  }
               });
            }, 1000);
		
	});
	
	function enterEvt(){
		
		var message = $('#message').val();
		$('#message').focus();
		$(".direct-chat-messages").scrollTop($(".direct-chat-messages")[0].scrollHeight);
		
		if(message==""){
			return;
		}
		
		$.ajax({
            url : "msgSend.do?receiveId=${fInfo.memberId}&message="+message,
            type : "get",
            success : function(data) {
            	$('#message').val("");
            	$('#message').focus();
				$(".direct-chat-messages").scrollTop($(".direct-chat-messages")[0].scrollHeight);
            },
            error : function(data) {
            	$('#message').val("");
            }
         });
	}
	</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="box box-warning direct-chat direct-chat-warning">
				<div class="box-header with-border">
					<h3 class="box-title">${fInfo.memberName }님과 대화</h3>
				</div>
				<div class="box-body">
					<div class="direct-chat-messages" id="msgContent">
					
					
					
					</div>
				</div>
			</div>
			
			<!-- 메세지 입력 란 -->
			<div class="box-footer">
<!--             	<form action="msgSend.do" method="post"> -->
                	<div class="input-group">
                		<input type="hidden" name="receiveId" value="${fInfo.memberId}" />
                    	<input type="text" id="message" name="message" placeholder="메세지를 입력해주세요..." class="form-control" onkeypress="if(event.keyCode==13) { enterEvt(); }">
                    		<span class="input-group-btn">
								<button class="btn btn-warning btn-flat" onclick="enterEvt();">입력</button>
                    		</span>
                	</div>
<!--             	</form> -->
			</div>
		</div>
	</div>
</body>
</html>