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
		<link rel="stylesheet" href="/BTBP/resources/css/skins/skin-blue.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
	    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
	    <link href="/BTBP/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
	    <link href="/BTBP/resources/assets/css/material-kit.css" rel="stylesheet"/>
		<link href="/BTBP/resources/assets/css/demo.css" rel="stylesheet" />
		<script src="/BTBP/resources/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="/BTBP/resources/assets/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="/BTBP/resources/assets/js/material.min.js"></script>
		<script src="/BTBP/resources/assets/js/nouislider.min.js" type="text/javascript"></script>
		<script src="/BTBP/resources/assets/js/bootstrap-datepicker.js" type="text/javascript"></script>
		<script src="/BTBP/resources/assets/js/material-kit.js" type="text/javascript"></script>
		<style type="text/css">
			@import url('https://fonts.googleapis.com/earlyaccess/hanna.css');
			*{font-family: 'Hanna', sans-serif;}
			body{
				background-color: #FAECC5;
			}
		</style>
		<script type="text/javascript">
			$(function(){
				$('.messagePage').click(function(){
					var receiveId = $(this).attr("id");
					
					cw=screen.availWidth;     //화면 넓이
					ch=screen.availHeight;    //화면 높이
			
					sw=400;    //띄울 창의 넓이
					sh=360;    //띄울 창의 높이
			
					ml=(cw-sw)/2;
					mt=(ch-sh)/2; 
			
					test=window.open('messagePage.do?receiveId='+receiveId,'test','width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=no');
					
				});
			});
		</script>
	</head>
	<body>
		<div class="container">
		<br /><br />
			<div class="row">
				<div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
					<div class="card card-signup" align="center">
						<button class="btn btn-warning">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							읽지 않은 메세지함
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</button>
						<div class="row">
							<div id="content">
								<br /><br />
									<h4>새로 도착한 메세지가 없습니다.</h4>
								<br /><br />
							</div>
							<table>
								<c:if test="${!fList.isEmpty()}">
									<c:forEach var="FriendVO" items="${fList}">
										<tr>
											<c:if test="${FriendVO.noReadCount != 0}" >
												<td>
										            <c:if test="${FriendVO.memberImageName != null}">
														<img src="/BTBP/resources/upload/Members/${FriendVO.memberImageName }" width=60px height=60px class="img-circle img-raised" >
													</c:if>
											        <c:if test="${FriendVO.memberImageName == null}">
														<img src="/BTBP/resources/assets/img/logo.png" width=60px height=60px class="img-circle img-raised" >
													</c:if>
												</td>
												<td>
													${FriendVO.memberName } ${FriendVO.memberRank } (${FriendVO.memberCompany })
												</td>
												<td>
							             		<button class="btn btn-warning messagePage" id="${FriendVO.memberId}">
							             			<span class="glyphicon glyphicon-envelope"></span>
							             			<span class="label label-danger" style="position:absolute; bottom: 18px; right:0px; font-size: 20px; padding-top: 3px;
															padding-right: 5px; padding-bottom: 5px; padding-left: 5px;">${FriendVO.noReadCount}</span>
							             		</button>
							             		</td>
							             		<style>#content{display: none;}</style>
						             		</c:if>
					             		</tr>
									</c:forEach>
					       		</c:if>
				       		</table>
						</div>
						<br />
					</div>
				</div>
			</div>
		</div>
	</body>
</html>