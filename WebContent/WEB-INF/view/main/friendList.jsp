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
<!-- 추가 -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <link href="/BTBP/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/BTBP/resources/assets/css/material-kit.css" rel="stylesheet"/>
	<link href="/BTBP/resources/assets/css/demo.css" rel="stylesheet" />
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="/BTBP/resources/assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="/BTBP/resources/assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="/BTBP/resources/assets/js/material.min.js"></script>
	<script src="/BTBP/resources/assets/js/nouislider.min.js" type="text/javascript"></script>
	<script src="/BTBP/resources/assets/js/bootstrap-datepicker.js" type="text/javascript"></script>
	<script src="/BTBP/resources/assets/js/material-kit.js" type="text/javascript"></script>

<style type="text/css">
body{
/* 배경 이미지 */
/* 	background: url(/BTBP/resources/assets/img/bgcall.png) no-repeat center center fixed; */
	background-color: #F2FFED;
}
.info-box-icon{
	background-color: #E4F7BA;
}
.남자{
	background-color: #B2EBF4;
}
.여자{
	background-color: #FFB2F5;
}
</style>
<script type="text/javascript">
$(function(){
	$('.friendDelBtn').click(function(){
		if(confirm("해당 친구를 삭제하시겠습니까?")){
			var friendId = $(this).attr("id");
			location.href="friendRemove.do?friendId="+friendId+"&page=list";
			opener.location.reload();
		} else {
	    	return;
		}
	});
	
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
	
	$('.pMemEvt').click(function(){
		var friendId = $(this).attr("id");
		window.open('ProjectMemberInfo.do?friendId='+friendId, 'projectMemInfo', "width=500, height=500, left=600, top=100, resizable=no, scrollbars=no, status=no;");
	});
});

</script>
</head>
<body>

<div align="center">
<button class="btn btn-success btn-lg" style="border-radius: 20px;">
내 친구 목록
</button>
<br /><br />
<form action="friendNameSearch.do" method="post">

	<div class="input-group input-group-sm" style="width: 300px;">
		
		<input type="text" name="memberName" id="memberName"  class="form-control" placeholder="이름 검색...">
		
		<div class="input-group-btn" style="top: 10px;">
			<button type="submit" class="btn btn-success"><i class="fa fa-search"></i></button>
		</div>
	</div>
	
</form>
</div>
<br />
	<div class="row">

	<c:if test="${!fList.isEmpty()}">
	<c:forEach var="FriendVO" items="${fList}">

        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box" >
            <span class="info-box-icon" >
            <c:if test="${FriendVO.memberImageName != null}">
			<img src="/BTBP/resources/upload/Members/${FriendVO.memberImageName }" width=105px height=118px class="img-rounded img-raised" style="position: relative; top:0px;">
			</c:if>
	        <c:if test="${FriendVO.memberImageName == null}">
			<img src="/BTBP/resources/assets/img/logo.png" width=105px height=118px class="img-rounded img-raised" style="position: relative; top:0px;">
			</c:if> 
            </span>
            <div class="info-box-content ${FriendVO.memberGender} img-rounded img-raised">
              <span class="info-box-number">${FriendVO.memberName} ${FriendVO.memberRank} (${FriendVO.memberCompany}) <button id="${FriendVO.friendId}" class="btn btn-danger btn-simple btn-xs friendDelBtn" style="position:absolute; bottom: 100px; right: 10px;"><i class="fa fa-times"></i></button></span>
              <span class="info-box-text">- Tel : <a href="tel:${FriendVO.memberPhone}">${FriendVO.memberPhone}</a></span>
              <span class="info-box-text">- Mail : <a href="mailto:${FriendVO.memberEmail}">${FriendVO.memberEmail}</a></span>
              	
              	<div align="right">
              	
              	   <c:if test="${FriendVO.loginStatus != null}">
						<button rel="tooltip" title="온라인" class="btn btn-info btn-simple btn-sm" style="position: absolute; bottom: 99px; right: 35px;">
			                  <font color="#00D8FF"><i class="fa fa-user"></i></font>
			              </button>
					</c:if>
					<c:if test="${FriendVO.loginStatus == null}">
						<button rel="tooltip" title="오프라인" class="btn btn-info btn-simple btn-sm" style="position: absolute; bottom: 99px; right: 35px;">
			                   <font color="gray"><i class="fa fa-user"></i></font>
			              </button>
					</c:if>
              	
             		<button id="${FriendVO.friendId}" class="btn btn-success btn-sm pMemEvt"><span class="glyphicon glyphicon-user"></span></button>
             		<button class="btn btn-warning btn-sm messagePage" id="${FriendVO.friendId}">
             			<span class="glyphicon glyphicon-envelope"></span>
             			<c:choose>
             				<c:when test="${FriendVO.noReadCount > 0}">
             				<span class="label label-danger" style="position:absolute; bottom: 10px; font-size: 12px; padding-top: 3px;
											padding-right: 5px; padding-bottom: 3px; padding-left: 5px;">${FriendVO.noReadCount}</span>
             				</c:when>
             				<c:otherwise>
             				<span class="label label-success" style="position:absolute; bottom: 10px; font-size: 12px; padding-top: 3px;
											padding-right: 5px; padding-bottom: 3px; padding-left: 5px;">${FriendVO.noReadCount}</span>
             				</c:otherwise>
             			</c:choose>
             		</button>  
            	</div>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        
       </c:forEach>
       </c:if>
       
       <c:if test="${fList.isEmpty()}">
    	   <div align="center">
    	   		검색 결과가 없습니다.
    	  		<form action="friendNameSearch.do" method="post">
    	  			<input type="hidden" name="memberName" >
					<button type="submit" class="btn btn-success">전체 친구보기</button>
				</form>
    	   </div>
       </c:if>
       
       
       
       
<c:if test="${!nfList.isEmpty()}">
	<div align="center">
		<label rel="tooltip" title="내가 등록한 친구는 제외" class="btn btn-primary btn-lg" style="border-radius: 20px;">
			나를 친구로 등록한 사람
		</label>
		</div>
	<br />
</c:if>
       
       <c:if test="${!nfList.isEmpty()}">
	<c:forEach var="FriendVO" items="${nfList}">

        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box" >
            <span class="info-box-icon" >
            <c:if test="${FriendVO.memberImageName != null}">
			<img src="/BTBP/resources/upload/Members/${FriendVO.memberImageName }" width=105px height=118px class="img-rounded img-raised" style="position: relative; top:0px;">
			</c:if>
	        <c:if test="${FriendVO.memberImageName == null}">
			<img src="/BTBP/resources/assets/img/logo.png" width=105px height=118px class="img-rounded img-raised" style="position: relative; top:0px;">
			</c:if> 
            </span>
            <div class="info-box-content ${FriendVO.memberGender} img-rounded img-raised">
              <span class="info-box-number">${FriendVO.memberName} ${FriendVO.memberRank} (${FriendVO.memberCompany})</span>
              <span class="info-box-text">- Tel : <a href="tel:${FriendVO.memberPhone}">${FriendVO.memberPhone}</a></span>
              <span class="info-box-text">- Mail : <a href="mailto:${FriendVO.memberEmail}">${FriendVO.memberEmail}</a></span>
              	
              	<div align="right">
              	
              	   <c:if test="${FriendVO.loginStatus != null}">
						<button rel="tooltip" title="온라인" class="btn btn-info btn-simple btn-sm" style="position: absolute; bottom: 99px; right: 10px;">
			                  <font color="#00D8FF"><i class="fa fa-user"></i></font>
			              </button>
					</c:if>
					<c:if test="${FriendVO.loginStatus == null}">
						<button rel="tooltip" title="오프라인" class="btn btn-info btn-simple btn-sm" style="position: absolute; bottom: 99px; right: 10px;">
			                   <font color="gray"><i class="fa fa-user"></i></font>
			              </button>
					</c:if>
              	
             		<button id="${FriendVO.friendId}" class="btn btn-success btn-sm pMemEvt"><span class="glyphicon glyphicon-user"></span></button>
             		<button class="btn btn-warning btn-sm messagePage" id="${FriendVO.friendId}">
             			<span class="glyphicon glyphicon-envelope"></span>
             			<c:choose>
             				<c:when test="${FriendVO.noReadCount > 0}">
             				<span class="label label-danger" style="position:absolute; bottom: 10px; font-size: 12px; padding-top: 3px;
											padding-right: 5px; padding-bottom: 3px; padding-left: 5px;">${FriendVO.noReadCount}</span>
             				</c:when>
             				<c:otherwise>
             				<span class="label label-success" style="position:absolute; bottom: 10px; font-size: 12px; padding-top: 3px;
											padding-right: 5px; padding-bottom: 3px; padding-left: 5px;">${FriendVO.noReadCount}</span>
             				</c:otherwise>
             			</c:choose>
             		</button>  
            	</div>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        
       </c:forEach>
       </c:if>
       
      </div>
      <!-- /.row -->

</body>
</html>