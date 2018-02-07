<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="btbp.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% int newJob = 0, endJob= 0; %>
<!DOCTYPE html>
<html>
<head>
<link rel="apple-touch-icon" sizes="76x76" href="/BTBP/resources/main/teamup-icon.png">
	<link rel="icon" href="/BTBP/resources/main/teamup-icon.png">
    <title>BTBP - Best Teamwork Best Project</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />


<style>
.main-header, .logo-lg{
	font-weight: bold;
}
</style>

<c:if test="${sessionScope.memberId == null}">
<script>
	alert("로그인 후 이용해주세요.");
	location.href="MemberLoginPage.do";
</script>
</c:if>

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
		setTimeout("location.reload()", 2000);
	});
});

</script>

</head>
<body>

<div class="header">

<!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="ProjectMain.do?projectNo=${sessionScope.projectNo }&pageNo=1" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini">BTBP</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg">${pInfo.projectName }</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          
          <!-- 상단 메세지 메뉴 -->
          <li class="dropdown messages-menu">
            <!-- Menu toggle button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <!-- 메세지 관련 부분 -->
              <span class="label label-success">${noReadMsg }</span> <!-- 메세지 초록색으로 몇개 왔는지 확인 부분 -->
            </a>
            <ul class="dropdown-menu">
              <li class="header">${noReadMsg }개의 메세지가 있습니다.</li>
              <li>
                <!-- inner menu: contains the messages -->
                <ul class="menu">
					<c:if test="${!fList.isEmpty()}">
						<c:forEach var="FriendVO" items="${fList}">
							<c:if test="${FriendVO.noReadCount != 0}" >
							<li>
								<div class="pull-left">
					            <c:if test="${FriendVO.memberImageName != null}">
									<img src="/BTBP/resources/upload/Members/${FriendVO.memberImageName }" width=40px height=40px class="img-circle img-raised" >
								</c:if>
						        <c:if test="${FriendVO.memberImageName == null}">
									<img src="/BTBP/resources/assets/img/logo.png" width=40px height=40px class="img-circle img-raised" >
								</c:if>
								${FriendVO.memberName } (${FriendVO.memberCompany }) <span class="label label-danger" >${FriendVO.noReadCount}</span>
								</div>
								<div align="right">
									<button class="btn btn-warning messagePage" id="${FriendVO.friendId}">
				             			<span class="glyphicon glyphicon-envelope"></span>
				             		</button>
			             		</div>
								</li><br />
		             		</c:if>
						</c:forEach>
		       		</c:if>
                </ul>
                <!-- /.menu -->
              </li>
            </ul>
          </li>
          <!-- 상단 메세지 메뉴 종료 -->

          <!-- 상단 알림 메뉴 -->
          <li class="dropdown notifications-menu">
            <!-- Menu toggle button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning">${newJobList.size() + endJobList.size() }</span>
            </a>
            <ul class="dropdown-menu" style="width:300px; height: 450px;">
              <li class="header">알림</li>
              <li>
                <!-- Inner Menu: contains the notifications -->
                <ul class="menu" style="width:300px; max-height: 400px;">
                  <li><!-- start notification -->
                    <a href="#">
                      <span class="label label-warning">New</span> 금일 ${newJobList.size()}개의 업무가 등록되었습니다.
                    </a>
                  </li>
                  
                  <c:forEach var="JobVO" items="${newJobList}"><% newJob++; %>
                  <li>
                    <a href="JobInfo.do?jobNo=${JobVO.jobNo }">
                      <c:choose>
                      	<c:when test="${JobVO.jobTitle != null}"><%=newJob %>. ${JobVO.jobTitle }</c:when>
                      	<c:otherwise><%=newJob %>. ${JobVO.jobContent }</c:otherwise>
                      </c:choose> 
                      <div align="right"><span class="label label-primary">${JobVO.jobType }</span> &nbsp;&nbsp;&nbsp; <span class="label label-success">${JobVO.createDate }</span></div>
                    </a>
                  </li>
                  </c:forEach>
                  
                  <li><!-- start notification -->
                    <a href="#">
                      <span class="label label-danger">End</span> 종료 예정인 업무가 ${endJobList.size()}개 있습니다.
                    </a>
                  </li>
                  
                  <c:forEach var="JobVO" items="${endJobList}"><% endJob++; %>
                  <li>
                    <a href="JobInfo.do?jobNo=${JobVO.jobNo }">
                      <c:choose>
                      	<c:when test="${JobVO.jobTitle != null}"><%=endJob %>. ${JobVO.jobTitle }</c:when>
                      	<c:otherwise><%=endJob %>. ${JobVO.jobContent }</c:otherwise>
                      </c:choose> 
                      <div align="right"><span class="label label-info">${JobVO.jobType }</span> &nbsp;&nbsp;&nbsp; <span class="label label-warning">${JobVO.endDate }</span></div>
                    </a>
                  </li>
                  </c:forEach>
                  
                  <!-- end notification -->
                </ul>
              </li>
            </ul>
          </li>
          <!-- 알림 메뉴 종료 -->
          
          <!-- Tasks Menu -->
          <li class="dropdown tasks-menu">
            <!-- Menu Toggle Button -->
            <a href="LoginMain.do" >
              <span class="glyphicon glyphicon-home"></span><!-- 로그 아웃 화면 --> 
            </a>
          </li>
          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <!-- The user image in the navbar-->
                <c:if test="${mvo.memberImageName != null}">
					<img src="/BTBP/resources/upload/Members/${mvo.memberImageName }" width=20px height=19px class="img-circle img-raised">
				</c:if>
	            <c:if test="${mvo.memberImageName == null}">
					<img src="/BTBP/resources/assets/img/logo.png" width=20px height=19px class="img-circle img-raised">
				</c:if>
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs">${mvo.memberName }</span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <c:if test="${mvo.memberImageName != null}">
					<img src="/BTBP/resources/upload/Members/${mvo.memberImageName }" width=160px height=160px class="img-circle img-raised">
				</c:if>
	            <c:if test="${mvo.memberImageName == null}">
					<img src="/BTBP/resources/assets/img/logo.png" width=160px height=160px class="img-circle img-raised">
				</c:if> 

                <p>
                	<b>${mvo.memberName }</b>
                  <small>${mvo.memberCompany } ${mvo.memberRank }</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-6 text-center text-light-blue">
                    <a href="ProjectList.do">나의 프로젝트</a>
                  </div>
                  <div class="col-xs-6 text-center text-light-blue">
                    <a href="friendList.do" onclick="window.open(this.href, 'friendList.do', 'width=450,height=700,top=5,left=500'); return false;">친구 목록</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="MyPage.do" class="btn btn-default btn-flat" onclick="window.name='MyPage.do';window.open(this.href, 'memInfo',
                   							 'width=770,height=580, top=100,left=350');return false;">내 정보</a>
                </div>
                <div class="pull-right">
                  <a href="main.do" class="btn btn-default btn-flat">로그아웃</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar" id="gear_btn"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  

</div>

</body>
</html>