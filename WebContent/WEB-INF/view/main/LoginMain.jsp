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
	@import url('https://fonts.googleapis.com/earlyaccess/hanna.css');
	*{font-family: 'Hanna', sans-serif;}
	body,table,div,p,h1,h2,h3,h4,h5,h6 {
/* 		font-family: 'Noto Sans KR', serif; */
	}
	th, td{
		text-align: center;
	}
	.msgSendBox{
		width: 100%;
		border: none;
	}
	a{ 
		text-decoration:none ;
		color: #1700B7;
	}
	</style>
	<script type="text/javascript">
	$(function(){
		// 친구 삭제 버튼 클릭 시
		$('.friendRemove').click(function(){
			if(confirm("해당 친구를 삭제하시겠습니까?")){
	   			var friendId = $(this).attr("id");
	   			location.href="friendRemove.do?page=main&friendId="+friendId;
	    	}
		});
	});
	
	// 친구 전체 목록
	function friendList() {

	cw=screen.availWidth;     //화면 넓이
	ch=screen.availHeight;    //화면 높이

	sw=450;    //띄울 창의 넓이
	sh=700;    //띄울 창의 높이

	ml=(cw-sw)/2;
	mt=(ch-sh)/2; 

	test=window.open('friendList.do','tst','width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=no');
	};
	
	// 친구추가 팝업 가운데 띄우기
	function friendAddModal() {

	cw=screen.availWidth;     //화면 넓이
	ch=screen.availHeight;    //화면 높이

	sw=400;    //띄울 창의 넓이
	sh=350;    //띄울 창의 높이

	ml=(cw-sw)/2;
	mt=(ch-sh)/2; 

	test=window.open('friendAddModal.do','tst','width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=no');
	};
	
	// 비밀번호 변경 페이지 팝업 띄우기
	function memberPwChg(){
		cw=screen.availWidth;     //화면 넓이
		ch=screen.availHeight;    //화면 높이

		sw=400;    //띄울 창의 넓이
		sh=350;    //띄울 창의 높이

		ml=(cw-sw)/2;
		mt=(ch-sh)/2; 

		test=window.open('memberPwChg.do','tst','width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=no');
	};
	
	
	// 메세지 페이지 띄우기
	function messagePage(){
		cw=screen.availWidth;     //화면 넓이
		ch=screen.availHeight;    //화면 높이

		sw=400;    //띄울 창의 넓이
		sh=360;    //띄울 창의 높이

		ml=(cw-sw)/2;
		mt=(ch-sh)/2; 

		test=window.open('MessageBox.do','frinedList','width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=no');
	};
	
	// 회원탈퇴 페이지 팝업 가운데 띄우기
	function memberOut() {

	cw=screen.availWidth;     //화면 넓이
	ch=screen.availHeight;    //화면 높이

	sw=400;    //띄울 창의 넓이
	sh=350;    //띄울 창의 높이

	ml=(cw-sw)/2;
	mt=(ch-sh)/2; 

	test=window.open('memberOutPage.do','tst','width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=no');
	};
	
	</script>
	
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



					<!-- ######### 1로우 전체 ########## -->
					<div class="row">
	               	<!-- ######### 프로젝트 리스트 ########## -->
	               	<div class="col-sm-6">
	               	<div align="center">
	               		<button class="btn btn-simple btn-primary "><h2><b>프로젝트 관리</b></h2></button>
	               	</div>
	               		<table class="table">
   							<thead>
								<tr>
            						<th>진행중인 프로젝트</th>
            						<th>기간</th>
						        </tr>
    						</thead>
							<tbody>
								<!-- 진행중인 프로젝트 목록 -->
								<c:if test="${!pList.isEmpty()}">
									<c:forEach var="ProjectVO" items="${pList}" end="3" step="1">
										<c:if test="${ProjectVO.projectStatus == 'doing'}">
											<tr>
												<td><a class="proLink" href="ProjectMain.do?projectNo=${ProjectVO.projectNo}" >${ProjectVO.projectName}</a></td>
							           			<td>${ProjectVO.startDate}~${ProjectVO.endDate}</td>
							           		</tr>
						           		</c:if>
									</c:forEach>
								</c:if>
								
								<!-- 진행중인 프로젝트가 없을때 -->
						        <c:if test="${pList.isEmpty()}">
									<tr>
										<td colspan="2">진행중인 프로젝트가 없습니다.</td>
									</tr>
								</c:if>
		    				</tbody>
						</table>
						
						<div align="center">
							<a href="ProjectList.do">
								<button class="btn btn-primary">프로젝트 전체보기</button>
							</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="ProjectCreate.do" onclick="window.open(this.href, 'projectCreate', 'width=450,height=730,top=5,left=500'); return false;">
								<button class="btn btn-primary">프로젝트 생성 + </button>
							</a>
						</div>
						
					</div>
					<!-- ######### 프로젝트 리스트 ########## -->
					
					<!-- ######### 내친구 리스트 ########## -->
	               	<div class="col-sm-6">
	               	<div align="center">
	               		<button class="btn btn-simple btn-success "><h2><b>내 친구 목록</b></h2></button>
	               	</div>
	               		<table class="table">
   							<thead>
								<tr>
            						<th>최근 추가한 친구</th>
						        </tr>
    						</thead>
							<tbody>
							
									<c:if test="${!fList.isEmpty()}">
									<c:forEach var="FriendVO" items="${fList}" end="3" step="1">
									<tr>
										<td>
										
										<c:if test="${FriendVO.memberImageName != null}">
										<img src="/BTBP/resources/upload/Members/${FriendVO.memberImageName }" width=40px height=40px class="img-circle img-raised" >
										</c:if>
	                       				 <c:if test="${FriendVO.memberImageName == null}">
										<img src="/BTBP/resources/assets/img/logo.png" width=40px height=40px class="img-circle img-raised" >
										</c:if>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										${FriendVO.memberName} ${FriendVO.memberRank} (${FriendVO.memberCompany})
										
										<c:if test="${FriendVO.loginStatus != null}">
											<button rel="tooltip" title="온라인" class="btn btn-info btn-simple btn-xs">
			                    			<font color="#00D8FF"><i class="fa fa-user"></i></font>
			              					</button>
										</c:if>
										<c:if test="${FriendVO.loginStatus == null}">
											<button rel="tooltip" title="오프라인" class="btn btn-info btn-simple btn-xs">
			                    			<font color="gray"><i class="fa fa-user"></i></font>
			              					</button>
										</c:if>
										
			                			<button rel="tooltip" title="메세지 보내기" class="btn btn-success btn-simple btn-xs" data-toggle="modal" data-target="#m${FriendVO.friendId}">
			              				<i class="fa fa-edit"></i>
			              				</button>
			              				
			              				<button rel="tooltip" title="친구 삭제" id = "${FriendVO.friendId}" class="btn btn-danger btn-simple btn-xs friendRemove">
			              				<i class="fa fa-times"></i>
			              				</button>
										
										</td>
						           	</tr>
						           	
						           	<!-- 메세지 보내기 모달 start -->
							    	<div class="modal fade" id="m${FriendVO.friendId}" tabindex="-1" role="dialog" >
							  			<div class="modal-dialog modal-sm">
											<div class="modal-content">
												
												<div class="modal-header">
													<h4 class="modal-title">${FriendVO.memberName}님에게 메세지 보내기</h4>
												</div>
												
												<form action="msgSendMain.do" method="post">
												
												<div class="modal-body">
													<hr />
													<span class="glyphicon glyphicon-envelope"></span>
													<textarea rows="3" name="message" class="msgSendBox"></textarea>
													<input type="hidden" name="receiveId" value="${FriendVO.friendId}" />
													<hr />
							     				</div>
							      				<div class="modal-footer">
							      					<input type="submit" class="btn btn-primary btn-sm" value="보내기" />
							        				<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
							    		  		</div>
							    		  		
							    		  		</form>
							    		  		
							   			 	</div>
							  			</div>
									</div>
									<!-- modal end -->
						           	
									</c:forEach>
									</c:if>
									
									<c:if test="${fList.isEmpty()}">
									<tr>
									<td>최근 추가한 친구가 없습니다.</td>
									</tr>
									</c:if>
								
		    				</tbody>
						</table>
						
						<div align="center">
						<button class="btn btn-success" onclick=friendList();>내 친구 전체보기</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-success"  onclick=friendAddModal();>친구 추가 + </button>
						</div>
						
					</div>
					
				</div> <!-- ######### 내친구 리스트 ########## -->
				<!-- ######### 1 로우 전체 ########## -->
				
				
				
				
				
				<!-- ######### 2로우 전체 ########## -->
					<div class="row">
					
	               	<!-- ######### 마이페이지 ########## -->
	               	<div class="col-sm-6">
	               	<div align="center">
	               		<button class="btn btn-simple btn-warning "><h2><b>마이페이지</b></h2></button>
	               	</div>
	               		<table class="table">
   							<thead>
								<tr>
            						<th colspan="4">마이 메뉴</th>
						        </tr>
    						</thead>
							<tbody>
								<tr>
									<td>
										<a href='MyPage.do' onclick="window.name='MyPage.do';window.open(this.href, 'join',
                   							 'width=770,height=580');return false;">
										<button class="btn btn-warning">내 정보 보기</button>
										</a>
									</td>
									<td>
									<button class="btn btn-warning" onclick="messagePage();">메세지함 &nbsp;
									<i class="fa fa-envelope-o"></i>
									<c:choose>
										<c:when test="${noReadMsg > 0 }">
											<span class="label label-danger" style="position:absolute; top: 2px; left: 97px; font-size: 12px; padding-top: 3px;
											padding-right: 5px; padding-bottom: 3px; padding-left: 5px;">${noReadMsg}</span>
										</c:when>
										<c:otherwise>
											<span class="label label-success" style="position:absolute; top: 2px; left: 97px; font-size: 12px; padding-top: 3px;
												padding-right: 5px; padding-bottom: 3px; padding-left: 5px;">${noReadMsg}</span>
										</c:otherwise>
									</c:choose>
									</button>
									</td>
		              			</tr>
		              			<tr>
		              				<td><button class="btn btn-warning" onclick="memberOut();">회원 탈퇴</button></td>
						            <td><button class="btn btn-warning" onclick="memberPwChg();">비밀번호 변경</button></td>
		              			</tr>
		    				</tbody>
						</table>
					</div>
					<!-- ######### 마이페이지 리스트 ########## -->
					
					<!-- ######### 커뮤니티 리스트 ########## -->
	               	<div class="col-sm-6">
	               	<div align="center">
	               		<button class="btn btn-simple btn-danger "><h2><b>커뮤니티</b></h2></button>
	               	</div>
	               		<table class="table">
   							<thead>
								<tr>
            						<th>제목</th>
            						<th>작성일</th>
            						<th>작성자</th>
            						<th>조회수</th>
						        </tr>
    						</thead>
							<tbody>
						            <c:if test="${!bList.isEmpty()}">
									<c:forEach var="BoardVO" items="${bList}" end="3" step="1">
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
						<a href="boardList.do?pageNum=1"><button class="btn btn-danger">전체 글보기</button></a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="boardWriteForm.do" onclick="window.open(this.href, 'boardWriteForm', 'width=700,height=420,top=100,left=500'); return false;">
						<button class="btn btn-danger">게시글 작성 + </button></a>
						</div>
						
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