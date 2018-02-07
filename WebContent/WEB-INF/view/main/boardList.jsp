<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="btbp.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	th, td{
		text-align: center;
	}
	.msgSendBox{
		width: 100%;
		border: none;
	}
	a{ 
		text-decoration:none ;
		color: red;
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
        		<a class="navbar-brand" href="LoginMain.do">TeamUP</a>
        	</div>

        	<div class="collapse navbar-collapse" id="navigation-example">
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
			<div class="profile-content" >
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
	                        <div class="name">
<%-- 	                            <h3 class="title">안녕하세요. ${sessionScope.memberId}님</h3> --%>
	                        </div>
	                    </div>
	                </div>
	               	<!-- 프로필 사진 나오는곳 종료 -->


				<!-- ######### 2로우 전체 ########## -->
					<div class="row">
					<!-- ######### 커뮤니티 리스트 ########## -->
	               	<div align="center">
	               		<button class="btn btn-simple btn-danger "><h2>커뮤니티</h2></button>
	               		
	               		<form action="boardList.do?pageNum=1" method="post">
							<div class="input-group input-group-sm" style="width: 300px;">
								<input type="text" name="memberId" id="memberId"  class="form-control" placeholder="작성자 검색...">
								<div class="input-group-btn" >
									<button type="submit" class="btn btn-warning"><i class="fa fa-search"></i></button>
								</div>
							</div>
						</form>
	               	</div>
	               	
	               		<table class="table table-hover">
   							<thead>
								<tr>
            						<th width="60%">제목</th>
            						<th width="15%">작성일</th>
            						<th width="15%">작성자</th>
            						<th width="10%">조회수</th>
						        </tr>
    						</thead>
							<tbody>
						            <c:if test="${!bList.isEmpty()}">
									<c:forEach var="BoardVO" items="${bList}">
									<tr>
										<td>
											<a href="boardView.do?boardNo=${BoardVO.boardNo}" 
											onclick="window.open(this.href, 'boardView', 'width=650,height=500,top=100,left=500'); return false;">${BoardVO.boardTitle}</a>
										</td>
						           		<td>${BoardVO.createDate}</td>
						           		<td>${BoardVO.memberId}</td>
						           		<td>${BoardVO.boardCnt}</td>
						           		
						           	</tr>
									</c:forEach>
									</c:if>
									<c:if test="${bList.isEmpty()}">
									<tr>
									<td colspan="4">작성된 게시물이 없습니다.</td>
									</tr>
									</c:if>
		    				</tbody>
						</table>
						
						<div align="center">
							<ul class="pagination pagination-warning">
								<li><a href="boardList.do?pageNum=1">prev</a></li>
								<c:forEach var="i" begin="1" step="1" end="${pCnt }">
									<c:choose>
										<c:when test="${pageNum == i }">
											<li class="active"><a href="boardList.do?pageNum=${i }"><c:out value="${i}" /></a></li>
										</c:when>
										<c:otherwise>
											<li><a href="boardList.do?pageNum=${i }"><c:out value="${i}" /></a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<li><a href="boardList.do?pageNum=${pCnt }">next</a></li>
		                    </ul>
						</div>
						
						<div align="center">
						<a href="LoginMain.do"><button class="btn btn-danger">메인으로</button></a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="boardWriteForm.do" onclick="window.open(this.href, 'boardWriteForm', 'width=700,height=420,top=100,left=500'); return false;">
						<button class="btn btn-danger">게시글 작성 + </button></a>
						</div>
						
					
				</div> <!-- ######### 커뮤니티 ########## -->
				
				<!-- ######### 2 로우 전체 ########## -->
				</div>
				
				<br /><br />
				
				</div> <!-- 컨테이너 종료 -->
			</div>
		</div>
		
<!-- @@@@@@@@@ 메인 페이지 종료 @@@@@@@@@@ -->   
    
    
</body>
</html>