<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="btbp.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% int aCnt = 0, bCnt=0; %>

<%-- 로그인 후 메인 페이지 --%>

<c:if test="${sessionScope.memberId == null}">
<script>
	alert("로그인 후 이용해주세요.");
	location.href="MemberLoginPage.do";
</script>
</c:if>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="apple-touch-icon" sizes="76x76" href="/BTBP/resources/main/teamup-icon.png">
		<link rel="icon" href="/BTBP/resources/main/teamup-icon.png">
	    <title>BTBP - Best Teamwork Best Project</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
		<style type="text/css">
			@import url('https://fonts.googleapis.com/earlyaccess/hanna.css');
			*{font-family: 'Hanna', sans-serif;}
			div{
				text-align: center;
			}
			.btbp:link{
				font-weight: normal;
			}
			a:link { 
				color: white; 
				text-decoration: none;
				font-weight: bold;
			}
			a:hover { 
				color: white;
				text-decoration: underline;
			}
			a:VISITED {
				color: white; 
			}
			a:ACTIVE {
				color: white; 
			}
		</style>
	</head>
	<body class="profile-page">
		<nav class="navbar navbar-transparent navbar-fixed-top navbar-color-on-scroll" style="position: absolute; top:0px;">
	    	<div class="container">
	        	<div class="navbar-header">
	        		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example">
	            		<span class="sr-only">Toggle navigation</span>
			            <span class="icon-bar"></span>
			            <span class="icon-bar"></span>
			            <span class="icon-bar"></span>
	        		</button>
	        		<a class="navbar-brand btbp" href="LoginMain.do">TeamUP</a>
	        	</div>
	        	<div class="collapse navbar-collapse" id="navigation-example" >
	        		<ul class="nav navbar-nav navbar-right">
						<li>
	    					<a href="main.do" >로그아웃</a>
	    				</li>
	        		</ul>
	        	</div>
	    	</div>
	    </nav>
	    <div class="wrapper">
			<div class="header header-filter" style="background-image: url('/BTBP/resources/assets/img/examples/city.jpg'); "></div>
			<div class="main main-raised" style="position: relative; bottom:170px;">
				<div class="profile-content">
		            <div class="container">
		            	<!-- 프로필 사진 나오는곳 시작-->
		                <div class="row">
		                    <div class="profile">
		                        <div class="avatar">
		                        <c:if test="${mvo.memberImageName != null}">
									<img src="/BTBP/resources/upload/Members/${mvo.memberImageName }" width=120px height=120px class="img-circle img-raised">
								</c:if>
		                        <c:if test="${mvo.memberImageName == null}">
									<img src="/BTBP/resources/assets/img/logo.png" width=120px height=120px class="img-circle img-raised">
								</c:if> 
		                        </div>
		                    </div>
		                </div>
		               	<!-- 프로필 사진 나오는곳 종료 -->
						<div align="center">
							<button class="btn btn-simple btn-primary "><h2>프로젝트 목록</h2></button>
						</div>
						<div class="row">
							<div style="margin-right: 1000px; ">
								<button class="btn btn-simple btn-success"><h3>진행중인 프로젝트</h3></button>
							</div>
							<c:if test="${!pList.isEmpty()}">
								<c:forEach var="ProjectVO" items="${pList}" >
									<c:if test="${ProjectVO.projectStatus == 'doing'}">
										<div class="col-md-3">
											<div class="panel panel-success">
												<div class="panel-heading">
													<a href="ProjectMain.do?projectNo=${ProjectVO.projectNo}&pageNo=1" >${ProjectVO.projectName}</a>
												</div>
												<div class="panel-body">${ProjectVO.projectDetail}</div>
												<div class="panel-footer">${ProjectVO.startDate}~${ProjectVO.endDate}</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</c:if>
						</div> 
						<br />
						<div class="row">
							<div style="margin-right: 1000px; ">
								<button class="btn btn-simple btn-danger"><h3>완료된 프로젝트</h3></button>
							</div>
							<c:if test="${!pList.isEmpty()}">
								<c:forEach var="ProjectVO" items="${pList}">
									<c:if test="${ProjectVO.projectStatus == 'done'}">
										<div class="col-md-3">
											<div class="panel panel-danger">
												<div class="panel-heading">
													<a href="ProjectMain.do?projectNo=${ProjectVO.projectNo}" >${ProjectVO.projectName}</a>
												</div>
												<div class="panel-body">${ProjectVO.projectDetail}</div>
												<div class="panel-footer">${ProjectVO.startDate}~${ProjectVO.endDate}</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</c:if>
						</div> 
						<br /><br />
						<div align="center">
							<a href="LoginMain.do"><button class="btn btn-primary">메인으로</button></a>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="ProjectCreate.do" onclick="window.open(this.href, 'projectCreate', 'width=450,height=730,top=5,left=500'); return false;">
							<button class="btn btn-primary">프로젝트 생성 + </button></a>
						</div>
					</div> <br /><br />
				</div>
			</div>
		</div>
	</body>
</html>