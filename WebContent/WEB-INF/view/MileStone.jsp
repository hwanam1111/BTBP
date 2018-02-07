<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String[] Stakeholder = {"식별", "대표선출", "작업참여", "배포기준 합의", "배포합의", "사용만족"};
	String[] Chance = {"기회식별", "솔루션 필요성 확인", "솔루션 가치 확인", "솔루션 타당성 검증", "솔루션 개발", "이익 발생"};
	String[] Requirements = {"개념 정의","범위 정의", "요건정의", "요건합의", "요건구현", "니즈충족"};
	String[] SoftWareSystem = {"아키텍처 선정", "아키텍처 검증", "사용 가능", "배포준비","운영","운영 종료"};
	String[] Team = {"팀요건 정의", "팀구성","팀빌딩","작업수행","팀해산"};
	String[] Working = {"과업확정","사전준비","작업시작","작업진행","목표달성","작업종료"};
	String[] WorkingMethod={"원칙 수립","작업방식 확정","시범적용","전체적용","작업방식 내재화","사용종료"};
 	String doneORdoing = String.valueOf(request.getParameter("doneRow"));
%>
<!DOCTYPE html>
<html>
<head>
<link rel="apple-touch-icon" sizes="76x76" href="/BTBP/resources/main/teamup-icon.png">
	<link rel="icon" href="/BTBP/resources/main/teamup-icon.png">
    <title>BTBP - Best Teamwork Best Project</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<link rel="stylesheet" href="/BTBP/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="/BTBP/resources/css/AdminLTE.min.css">
<link rel="stylesheet" href="/BTBP/resources/css/skins/skin-purple.min.css">
<link rel="stylesheet" href="/BTBP/resources/plugins/dragAndDrop/dragAndDrop.css" type="text/css" media="screen" />
<link rel="stylesheet" href="/BTBP/resources/plugins/css/modal.css">
<link rel="stylesheet" href="/BTBP/resources/css/kmong_fonts.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
<style type="text/css">
@import url('https://fonts.googleapis.com/earlyaccess/hanna.css');
*{font-family: 'Hanna', sans-serif;}
button{background-color:gray;color:#fff;border:none;box-shadow:none;font-size:14px;font-weight:500;-webkit-border-radius:4px;border-radius:5px;  padding:8px 28px;cursor:pointer}
dl{
	width:180px;
	margin:0 0 20px;
	color: white;
}
dt{
	padding:6px 10px 6px;
	background:#444 url('../imgs/bg.png') repeat-y 100% 0;

	margin:0 0 3px;
	font-weight:bold;
	border-radius:8px;
	
}
dd{
	padding:8px 10px 12px;
	border-left:2px dashed #D5D5D5;
	border-right:2px dashed #D5D5D5;
	border-bottom:2px dashed #D5D5D5;

	border-radius:4px;
 	margin:-3px 0 3px; 
	text-align: center;
	
}
td{
	color: white;
	
}
</style>
<script type="text/javascript">
$(function(){
	$('li').removeClass('active');
	$('#ProjectTool').addClass('active');
});
</script>
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

<%@include file="header.jsp" %>
<%@include file="menu.jsp" %>
 
<div class="content-wrapper">
    
    <section class="content-header"><h1><i class="fa fa-th"></i>&nbsp;에센스</h1></section>
    
    <!-- Main content -->
    <section class="content">
		<div id="redips-drag">
			<div class="row">
        <div class="col-xs-10" >
                  <div class="box">                  
             <div class="box-tools">
                <ul class="pagination pagination-sm no-margin pull-right" style="padding-bottom: 5px; padding-top: 5px; padding-right: 10px">
                  <li><a href="#" id="mileStonePlus">마일스톤 추가</a></li>
                  <li><a href="#" id="alphaSave">저장</a></li>
                  <li><a href="#" data-toggle="control-sidebar" id="lookingCard">카드보기</a></li>                
                </ul>
              </div>
            
            <div class="box-body" >       
              <table class="table table-bordered" id="alpha_table">
              	<thead>
                <tr id="test">
                  <th class="redips-mark dark redips-trash" style="width: 100px"><i class="fa fa-trash-o"></i>&nbsp;카드제거</th>
                  <th class="redips-mark dark" style="width: 100px">이해관계자</th>
                  <th class="redips-mark dark" style="width: 100px">기회</th>
                  <th class="redips-mark dark" style="width: 100px">요구사항</th>
                  <th class="redips-mark dark" style="width: 120px">소프트웨어시스템</th>
                  <th class="redips-mark dark" style="width: 80px">팀</th>
                  <th class="redips-mark dark" style="width: 100px">작업</th>
                  <th class="redips-mark dark" style="width: 100px">작업방식</th>
                  <th class="redips-mark dark" style="width: 20px"></th>
                </tr>
                </thead>
                <c:if test="${!mListBoard.isEmpty()}">
                <c:forEach var="MileStoneVO" items="${mListBoard}" varStatus="status1"> 
                <c:choose>
                <c:when test="${MileStoneVO.rowStatus eq 'done' }">
                	<c:set var="mileStoneDone" value="mileStoneDone"/>
                </c:when>
                <c:otherwise>
                	<c:set var="mileStoneDone" value=""/>
                </c:otherwise>  
                </c:choose>
                <tr class="alpha_tr ${mileStoneDone}">
                  <th class="redips-mark dark row_name" contenteditable='true' name="${MileStoneVO.rowNo}">${MileStoneVO.rowName}</th>
                  <td class="Stakeholder">
                   <c:if test="${!mListBoardCard.isEmpty()}">
                  <c:forEach var="MileStoneCardVO" items="${mListBoardCard}" varStatus="status3">
                  <c:set var="string1" value="${MileStoneCardVO.cardNo}"/>
                 <c:set var="cardNo" value="${fn:substringBefore(string1,'-')}"/>  
                 <c:set var="count" value="${fn:substringAfter(string1,'-')}"/>
                  <c:if test="${MileStoneCardVO.rowNo == status1.count && cardNo == '이해'}">
                  <div class="redips-drag external-event" name="${MileStoneCardVO.cardNo}" style="background-color: #F44336; border:0;">${Stakeholder[count-1]}</div>	
                  </c:if>
                  </c:forEach>
                  </c:if>
                  </td>
                  <td class="Chance">
                     <c:if test="${!mListBoardCard.isEmpty()}">
                  <c:forEach var="MileStoneCardVO" items="${mListBoardCard}" varStatus="status3">
                  <c:set var="string1" value="${MileStoneCardVO.cardNo}"/>
                 <c:set var="cardNo" value="${fn:substringBefore(string1,'-')}"/>  
                 <c:set var="count" value="${fn:substringAfter(string1,'-')}"/>
                  <c:if test="${MileStoneCardVO.rowNo == status1.count && cardNo == '기회'}">
                  	<div class="redips-drag external-event" name="${MileStoneCardVO.cardNo}" style="background-color: #FF5722; border:0;">${Chance[count-1]}</div>	
                  </c:if>
                  </c:forEach>
                  </c:if>
                  </td>
                  <td class="Requirements">
                      <c:if test="${!mListBoardCard.isEmpty()}">
                  <c:forEach var="MileStoneCardVO" items="${mListBoardCard}" varStatus="status3">
                  <c:set var="string1" value="${MileStoneCardVO.cardNo}"/>
                 <c:set var="cardNo" value="${fn:substringBefore(string1,'-')}"/>  
                 <c:set var="count" value="${fn:substringAfter(string1,'-')}"/>
                  <c:if test="${MileStoneCardVO.rowNo == status1.count && cardNo == '요구사항'}">
                  	<div class="redips-drag external-event" name="${MileStoneCardVO.cardNo}" style="background-color: #FFC107; border:0;">${Requirements[count-1]}</div>	
                  </c:if>
                  </c:forEach>
                  </c:if>
                  </td>
                  <td class="SoftWareSystem">
                       <c:if test="${!mListBoardCard.isEmpty()}"> 
                  <c:forEach var="MileStoneCardVO" items="${mListBoardCard}" varStatus="status3">
                  <c:set var="string1" value="${MileStoneCardVO.cardNo}"/>
                 <c:set var="cardNo" value="${fn:substringBefore(string1,'-')}"/>  
                 <c:set var="count" value="${fn:substringAfter(string1,'-')}"/>
                  <c:if test="${MileStoneCardVO.rowNo == status1.count && cardNo == '소프트웨어시스템'}">
                  	<div class="redips-drag external-event" name="${MileStoneCardVO.cardNo}" style="background-color: #8BC34A; border:0;">${SoftWareSystem[count-1]}</div>	
                  </c:if>
                  </c:forEach>
                  </c:if>
                  </td>
                  <td class="Team">
                   <c:if test="${!mListBoardCard.isEmpty()}">
                  <c:forEach var="MileStoneCardVO" items="${mListBoardCard}" varStatus="status3">
                  <c:set var="string1" value="${MileStoneCardVO.cardNo}"/>
                 <c:set var="cardNo" value="${fn:substringBefore(string1,'-')}"/>  
                 <c:set var="count" value="${fn:substringAfter(string1,'-')}"/> 
                  <c:if test="${MileStoneCardVO.rowNo == status1.count && cardNo == '팀'}">
                  	<div class="redips-drag external-event" name="${MileStoneCardVO.cardNo}" style="background-color: #2196F3; border:0;">${Team[count-1]}</div>	
                  </c:if>
                  </c:forEach>
                  </c:if>
                  </td>
                  <td class="Working">
                   <c:if test="${!mListBoardCard.isEmpty()}">
                  <c:forEach var="MileStoneCardVO" items="${mListBoardCard}" varStatus="status3">
                  <c:set var="string1" value="${MileStoneCardVO.cardNo}"/>
                 <c:set var="cardNo" value="${fn:substringBefore(string1,'-')}"/>  
                 <c:set var="count" value="${fn:substringAfter(string1,'-')}"/>
                  <c:if test="${MileStoneCardVO.rowNo == status1.count && cardNo == '작업'}"> 
                  	<div class="redips-drag external-event" name="${MileStoneCardVO.cardNo}" style="background-color: #3F51B5; border:0;">${Working[count-1]}</div>	
                  </c:if>
                  </c:forEach>
                  </c:if>
                  </td>
                  <td class="WorkingMethod">
                    <c:if test="${!mListBoardCard.isEmpty()}">
                  <c:forEach var="MileStoneCardVO" items="${mListBoardCard}" varStatus="status3">
                  <c:set var="string1" value="${MileStoneCardVO.cardNo}"/>
                 <c:set var="cardNo" value="${fn:substringBefore(string1,'-')}"/>  
                 <c:set var="count" value="${fn:substringAfter(string1,'-')}"/>
                  <c:if test="${MileStoneCardVO.rowNo == status1.count && cardNo == '작업방식'}">
                  	<div class="redips-drag external-event bg-purple" name="${MileStoneCardVO.cardNo}" style="background-color: #9C27B0; border:0;">${WorkingMethod[count-1]}</div>	
                  </c:if>
                  </c:forEach>
                  </c:if>
                  </td>  
                  <td class="redips-mark dark" >
                  <c:choose>
                  <c:when test="${MileStoneVO.rowStatus eq 'doing'}">
                  <button type="button" class="btn btn-block btn-default btn-xs delete_alpha" style= "width:50px; left: 10px">삭제&nbsp;<i class="fa fa-close"></i></button>
                  <button type="button" class="btn btn-block btn-default btn-xs complete_alpha" style= "width:50px; left: 10px">완료&nbsp;<i class="fa fa-check-square-o"></i></button>
                  </c:when>
                  <c:when test="${MileStoneVO.rowStatus eq 'done'}">
                  <button type="button" class="btn btn-block btn-default btn-xs goodAndBad_alpha" style= "width:70px; left: 10px">단계 평가</button>
                  </c:when>
                  </c:choose>
                  </td>  
                </tr>    
             	 </c:forEach>
             	 </c:if>            
              </table>
            </div>
          </div>
            </div>
            </div>
  
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<!-- 오른쪽 슬라이드 부분 -->
<aside class="control-sidebar control-sidebar-dark" id="mileStone_bar">
	<div class="tab-content">
		<div class="tab-pane active">
			<h3 class="control-sidebar-heading"> 
				<i class="glyphicon glyphicon-tag"></i> 알파 카드
			</h3>
			
			<dl class="accordion" id="alpha_accordion">
				<dt style="background-color: #F44336">이해관계자<i class="fa fa-plus pull-right"></i></dt>
					<dd class="table-responsive" style="text-align: center;">
						<table id="accTable">
							<% for (int i = 0; i < Stakeholder.length; i++) { %>
								<tr>
									<td class="redips-single redips-mark dark">
										<div class="redips-drag redips-clone external-event" name="이해-<%=i + 1%>"
											style="background-color: #F44336; border: 0;"><%=Stakeholder[i]%>
										</div>
									</td>
								</tr>
							<% } %>
						</table>
					</dd>
				
				<dt style="background-color: #FF5722">기회<i class="fa fa-plus pull-right"></i></dt>
					<dd class="table-responsive">
						<table>
							<% for (int i = 0; i < Chance.length; i++) { %>
								<tr>
									<td class="redips-single  redips-mark dark">
										<div class="redips-drag redips-clone external-event" name="기회-<%=i + 1%>"
											style="background-color: #FF5722; border: 0;"><%=Chance[i]%>
										</div>
									</td>
								</tr>
							<% } %>
						</table>
					</dd>
			
			<dt style="background-color: #FFC107">요구사항<i class="fa fa-plus pull-right"></i></dt>
				<dd class="table-responsive">
					<table>
						<% for (int i = 0; i < Requirements.length; i++) { %>
							<tr>
								<td class="redips-single  redips-mark dark">
									<div class="redips-drag redips-clone external-event" name="요구사항-<%=i + 1%>"
										style="background-color: #FFC107; border: 0;"><%=Requirements[i]%>
									</div>
								</td>
							</tr>
						<% } %>
					</table>
				</dd>

			<dt style="background-color: #8BC34A">소프트웨어시스템<i class="fa fa-plus pull-right"></i></dt>
				<dd class="table-responsive">
					<table>
						<% for (int i = 0; i < SoftWareSystem.length; i++) { %>
							<tr>
								<td class="redips-single">
									<div class="redips-drag redips-clone external-event" name="소프트웨어시스템-<%=i + 1%>"
										style="background-color: #8BC34A; border: 0;"><%=SoftWareSystem[i]%>
									</div>
								</td>
							</tr>
						<% } %>
					</table>
				</dd>
				
			<dt style="background-color: #2196F3">팀<i class="fa fa-plus pull-right"></i></dt>
				<dd class="table-responsive">
					<table>
						<% for (int i = 0; i < Team.length; i++) { %>
							<tr>
								<td class="redips-single">
									<div class="redips-drag redips-clone external-event" name="팀-<%=i + 1%>"
										style="background-color: #2196F3; border: 0;"><%=Team[i]%></div></td>
								</tr>
						<% } %>
					</table>
				</dd>
				
			<dt style="background-color: #3F51B5">작업<i class="fa fa-plus pull-right"></i></dt>
				<dd class="table-responsive">
					<table>
						<% for (int i = 0; i < Working.length; i++) { %>
							<tr>
								<td class="redips-single">
									<div class="redips-drag  redips-clone external-event" name="작업-<%=i+1%>"
										style="background-color: #3F51B5; border: 0;"><%=Working[i]%>
									</div>
								</td>
							</tr>
						<% } %>
					</table>
				</dd>
				
			<dt class="bg-purple">작업방식<i class="fa fa-plus pull-right"></i></dt>
				<dd class="table-responsive">
					<table>
						<% for(int i=0;i<WorkingMethod.length;i++) { %>
							<tr>
								<td class="redips-single">
									<div class="redips-drag redips-clone external-event bg-purple" name="작업방식-<%=i+1%>"
										style="background-color: #9C27B0; border: 0;"><%=WorkingMethod[i]%>
									</div>
								</td>
							</tr>
						<% } %>
					</table>
				</dd>
			
			</dl>
		</div>
	</div>
</aside>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<!-- /.control-sidebar -->
  					
</div>
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
 <!-- 팝업 창 시작 부분 (완료 클릭시)-->
	<div id="complete_modal" class="sweet-alert showSweetAlert visible"
		data-custom-class="" data-has-cancel-button="true"
		data-has-confirm-button="true" data-allow-outside-click="false"
		data-has-done-function="true" data-animation="pop" data-timer="null"
		style="display: none; margin-top: -220px;">
		<div class="sa-icon sa-error" style="display: none;">
			<span class="sa-x-mark"> <span class="sa-line sa-left"></span>
				<span class="sa-line sa-right"></span>
			</span>
		</div>
		<div class="sa-icon sa-warning pulseWarning" style="display: block;">
			<span class="sa-body pulseWarningIns"></span> <span
				class="sa-dot pulseWarningIns"></span>
		</div>
		<div class="sa-icon sa-info" style="display: none;"></div>
		<div class="sa-icon sa-success" style="display: none;">
			<span class="sa-line sa-tip"></span> <span class="sa-line sa-long"></span>
		</div>
		<div class="sa-icon sa-custom" style="display: none;"></div>
		<h2>완료</h2>
		<p style="display: block;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;완료시 알파 카드를 수정할 수 없으니 신중하게 눌러 주시기 바랍니다.<br/><br/></p>
		<div class="sa-error-container">
			<div class="icon">!</div>
		</div>
		<div class="sa-button-container">
			<button class="cancel" tabindex="2" id="complete_cancel"
				style="display: inline-block; box-shadow: none; margin-left: 110px">취소</button>
			<div class="sa-confirm-button-container" style="padding-right : 30px">
				<button class="confirm" tabindex="1" id="complete_confirm"
					style="display: inline-block; background-color: rgb(243, 134, 91); margin-left: 60px; margin-bottom: 5px">완료</button>
				<div class="la-ball-fall">
					<div></div>
					<div></div>
					<div></div>
				</div>
			</div>
		</div>
	</div>
  <!-- /.content-wrapper -->
   <!-- 팝업 창 시작 부분 (저장 클릭시)-->
	<div id="save_modal" class="sweet-alert showSweetAlert visible"
		data-custom-class="" data-has-cancel-button="true"
		data-has-confirm-button="true" data-allow-outside-click="false"
		data-has-done-function="true" data-animation="pop" data-timer="null"
		style="display: none; margin-top: -220px;">
		<div class="sa-icon sa-error" style="display: none;">
			<span class="sa-x-mark"> <span class="sa-line sa-left"></span>
				<span class="sa-line sa-right"></span>
			</span>
		</div>
		<div class="sa-icon sa-warning pulseWarning" style="display: block;">
			<span class="sa-body pulseWarningIns"></span> <span
				class="sa-dot pulseWarningIns"></span>
		</div>
		<div class="sa-icon sa-info" style="display: none;"></div>
		<div class="sa-icon sa-success" style="display: none;">
			<span class="sa-line sa-tip"></span> <span class="sa-line sa-long"></span>
		</div>
		<div class="sa-icon sa-custom" style="display: none;"></div>
		<h2>저장</h2>
		<p style="display: block;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;저장시 전 알파 카드를 불러올 수 없습니다. 저장하시겠습니까?<br/><br/></p>
		<div class="sa-error-container">
			<div class="icon">!</div>
			<p>Not valid!</p>
		</div>
		<div class="sa-button-container">
			<button class="cancel" tabindex="2" id="save_cancel"
				style="display: inline-block; box-shadow: none; margin-left: 110px">취소</button>
			<div class="sa-confirm-button-container" style="padding-right : 30px">
				<button class="confirm" tabindex="1" id="save_confirm"
					style="display: inline-block; background-color: rgb(243, 134, 91); margin-left: 60px; margin-bottom: 5px">완료</button>
				<div class="la-ball-fall">
					<div></div>
					<div></div>
					<div></div>
				</div>
			</div>
		</div>
	</div>
  <!-- /.content-wrapper -->
     <!-- 팝업 창 시작 부분 (삭제 클릭시)-->
	<div id="delete_modal" class="sweet-alert showSweetAlert visible"
		data-custom-class="" data-has-cancel-button="true"
		data-has-confirm-button="true" data-allow-outside-click="false"
		data-has-done-function="true" data-animation="pop" data-timer="null"
		style="display: none; margin-top: -220px;">
		<div class="sa-icon sa-error" style="display: none;">
			<span class="sa-x-mark"> <span class="sa-line sa-left"></span>
				<span class="sa-line sa-right"></span>
			</span>
		</div>
		<div class="sa-icon sa-warning pulseWarning" style="display: block;">
			<span class="sa-body pulseWarningIns"></span> <span
				class="sa-dot pulseWarningIns"></span>
		</div>
		<div class="sa-icon sa-info" style="display: none;"></div>
		<div class="sa-icon sa-success" style="display: none;">
			<span class="sa-line sa-tip"></span> <span class="sa-line sa-long"></span>
		</div>
		<div class="sa-icon sa-custom" style="display: none;"></div>
		<h2>삭제</h2>
		<p style="display: block;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;행 삭제 후, 저장 버튼을 눌러야 저장됩니다. 삭제하시겠습니까?<br/><br/></p>
		<div class="sa-error-container">
			<div class="icon">!</div>
			<p>Not valid!</p>
		</div>
		<div class="sa-button-container">
			<button class="cancel" tabindex="2" id="delete_cancel"
				style="display: inline-block; box-shadow: none; margin-left: 110px">취소</button>
			<div class="sa-confirm-button-container" style="padding-right : 30px">
				<button class="confirm" tabindex="1" id="delete_confirm"
					style="display: inline-block; background-color: rgb(243, 134, 91); margin-left: 60px; margin-bottom: 5px">삭제</button>
				<div class="la-ball-fall">
					<div></div>
					<div></div>
					<div></div>
				</div>
			</div>
		</div>
	</div>
  <!-- /.content-wrapper -->
  
<%@include file="footer.jsp" %>
<div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->
<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/BTBP/resources/plugins/bootstrap/bootstrap.min.js"></script>
<script src="/BTBP/resources/plugins/app/app.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- dragAndDrop js -->
<script type="text/javascript" src="/BTBP/resources/plugins/dragAndDrop/redips-drag-min.js"></script>
<script type="text/javascript" src="/BTBP/resources/plugins/dragAndDrop/script.js"></script>
<script>
$(function(){
	var test1;
	// **** 전역 변수 선언
	// groupName == 알파 카드를 들었을 때  원하는 부분에만 드래그가 가능하도록 하기 위해서 비교하기 위한 groupName(정해져 있는 틀)
	var groupName= ['empty','Stakeholder','Chance','Requirements','SoftWareSystem','Team','Working','WorkingMethod']; 
	
	
	// ***** 함수 선언
	// 마일스톤 추가 이벤트 == 클릭시 마일스톤 단계 추가 생성. 중간에 생성이 불가. 반드시 뒤에 생성 됨
	   $("#mileStonePlus").click(function(){
	  var trNumber = ($("#alpha_table tr").length) -1; // 현재 화면의 row의 갯수
      //alert(trNumber);
      var mileStonePlus = '<tr class="alpha_tr"><th class="redips-mark dark row_name" contenteditable="true"></th><td class="Stakeholder"></td><td class="Chance"></td><td class="Requirements"></td><td class="SoftWareSystem"></td><td class="Team"></td> <td class="Working"></td><td class="WorkingMethod"></td><td class="redips-mark dark" ><button type="button" class="btn btn-block btn-default btn-xs delete_alpha" style= "width:30px; left: 10px"><i class="fa fa-close"></i></button></td></tr>'    
       if(trNumber == 0){
          $("#test").parent().append(mileStonePlus);   
       }else{
          $(".alpha_tr").eq(trNumber-1).after(mileStonePlus);   
       }
   });
	// 헤더에 있는 기본 버튼 클릭 이벤트
	// 마일스톤 카드를 보기 위해서 슬라이드를 열어야 하는데, 두개를 구분 지어 보기 위해서 z-index 값을 다르게 줌
	$('#gear_btn').click(function(){
		$('.control-sidebar-bg').css('height', '800px');
		$('.control-sidebar').css('height', '800px');
		$('.control-sidebar-bg').css('width', '400px');
		$('.control-sidebar').css('width', '400px');
		$('.control-sidebar-bg').css('right', '-400px');
		//$('.control-sidebar').css('right', '-400px');
		$('#mileStone_bar').css('z-index','100');
		$('#mileStone_bar').next().css('z-index','100');
		$('#chatting_bar').css('z-index','1010');
		$('#chatting_bar').next().css('z-index', '1000');
	})
	
	// 카드 보기 버튼
	// 마일스톤 카드를 보기 위해서 슬라이드를 열어야 하는데, 두개를 구분 지어 보기 위해서 z-index 값을 다르게 줌
	$('#lookingCard').click(function(){
		$('.control-sidebar-bg').css('height', '800px');
		$('.control-sidebar').css('height', '800px');
		$('.control-sidebar-bg').css('width', '230px');
		$('.control-sidebar').css('width', '230px');
		$('.control-sidebar-bg').css('right', '-230px');
		//$('.control-sidebar').css('right', '-230px');
		$('#chatting_bar').css('z-index','100');
		$('#chatting_bar').next().css('z-index', '100');
		$('#mileStone_bar').css('z-index','1010');
		$('#mileStone_bar').next().css('z-index', '1000');
	})
	
	// 슬라이드 카드 알파에 대한 아코디언 이벤트
	$('.accordion').each(function(){		
		
		var dl=$(this);
		var allDt=dl.find('dt');
		var allDd=dl.find('dd');
			
		allDd.hide();
		allDt.css('cursor','pointer');
		
		// 오른쪽 슬라이드 안의 토글 버튼 클릭, 
		allDt.click(function(){
			var img =$(this).children().attr('class')
			// + - 토글 될때 마다 이미지 바뀌게 함
			if(img == 'fa fa-plus pull-right'){ // 만약 + 모양일 때 클릭시 - 버튼으로 바꾸어 줌
				$(this).children().removeClass('fa fa-plus pull-right');
				$(this).children().addClass('fa fa-minus pull-right');
			}else{								// 만약 - 모양일 때 클릭시 + 버튼으로 바꾸어 줌
				$(this).children().removeClass('fa fa-minus pull-right');
				$(this).children().addClass('fa fa-plus pull-right');
			}
			var dt = $(this);
			var dd = dt.next();		
			dd.slideToggle(); // toggle 이벤트 걸어주기
		});
	});
	
		// 저장 버튼 클릭시, CPP_MILESTONE_BOARD의 status가 done 아닌  row 및 card를 모두 삭제 후, 다시 Insert 시키는 방식을 채택.
		// 알파 카드가 움직일 때 마다 DB를 갔다 오는 것은 서버의 부하를 증가 시키고 비효율 적이다라고 생각하여 이 방식을 채택.
		// ****** 저장 방법(전의 doing 값들을 전부 삭제하고 다시 Insert)
			// 1. board 의  status가 doing인 것을 삭제
			// 2. board 의 status가 done인 것의 row 의  board_card를 전부 삭제  
			// 3. board 의  (전체 row의 값 - done인 row의 값)을 구해서 개수 만큼 새로 Insert
			// 4. 새로 Insert 된 부분에 대한 card 값(Card_no, row_no)들을 Insert 
			$("#alphaSave").click(function(){
			
				$('#save_modal').show();
			
			})
			$('#save_confirm').click(function(){
				
				// 변수 설정
				// 
				var okKey = true; // 마일스톤을 추가 시에 마일스톤의 이름을 입력하지 않은 경우 DB에 저장하지 않기 위한 boolean 변수
				var trNumber = ($("#alpha_table tr").length) -1; // 현재 화면의 row의 갯수
				var tdNumber = 7; // 현재 화면에서 하나의 row 당  열(td)의 갯수
				var alphaCardNumberPerTd = $("#alpha_table tr").eq(1).children("td").eq(0).children("div").length; // 객 셀(td)당 alphaCard의 갯수
				var rowNameArr = []; // rowName을 가져가기 위한 배열
				var Insert_CardNo = []; //  Insert 하기 위해서 가져가야 할 Card_no
				var Insert_RowNo = []; //  Insert 하기 위해서 가져가야 할 row_no
				
				// CPP_MILESTONE_BOARD에 저장 할 rowName 저장
				$('.row_name').each(function(){
					var rowName	= $(this).text();
					if(rowName == ""){
					 	okKey = false;
					}
					//alert(rowName);
					rowNameArr.push($(this).text());// 현재 화면에 존재하는 row에 대한 이름을 rowNameArr에 저장	
					
				})
				
				// for 문 3개로 각 cell에 div tag(알파 카드)가 있는지 확인 후(length로 확인),
				// 만약 있으면  1.그 div의 name(카드의 이름(ex) 이해-1))을 Insert_CardNo 배열에 저장  2. 그 div의 row_no를  Insert_RowNo 배열에 저장

				for(var i=0;i<trNumber;i++){ // 테이블 row 의 갯수
					for(var j=0;j<tdNumber;j++){ // 테이블 column의 갯수
						var alphaCardNumberPerTd =  $("#alpha_table tr").eq(i+1).children("td").eq(j).children("div").length; // div(알파 카드)가 있는지 확인
						if(alphaCardNumberPerTd > 0){ // 만약 있으면 , 
						for(var k=0;k<alphaCardNumberPerTd;k++){ // 갯수 만큼  Insert_CardNo Insert_RowNo 에 저장
							var alphaCardNo = $("#alpha_table tr").eq(i+1).children("td").eq(j).children("div").eq(k).attr("name");// 내가 넣고자 하는 알파 카드의 name 값 
							Insert_CardNo.push(alphaCardNo);
							Insert_RowNo.push(i+1);
							}
						}
					}
				}
				if(okKey){
					location.href="mileStoneSave.do?rowNum="+trNumber+"&rowNameArr="+rowNameArr+"&Insert_CardNo="+Insert_CardNo+"&Insert_RowNo="+Insert_RowNo;
				}else{
					alert("마일스톤 제목을 입력해 주세요");
				}
			})
	
			$('#save_cancel').click(function(){
				$('#save_modal').hide();
				
			})
	// 알파 카드를 들었을 때, 상위 그룹의 cell에만 드래그를 할 수 있게 함(마일스톤 원칙)
	// ex) 요구사항에 관련된 알파 카드는 반드시 요구사항 열에만 드래그가 가능
	$(".external-event").each(function(){
		
		// 알파 카드에 마우스를 갖다 대고 눌렀을 때 이벤트 생성
		// drag & drop API 상에서  redips-mark dark class 를 걸어주면 drag&drop이 불가능 해짐
		// 이러한 속성을 이용하여 해당 셀을 제외한 나머지 셀에 redips-mark dark class 추가
		$(this).mousedown(function(){
			// 클릭한 알파 카드의 상위 그룹 저장.
			// 알파 카드를 드래그 하려고 하는 경우는 크게 2가지 1. accordion 내에서 새로 알파 카드를 추가하려고 할때, 2. 테이블 내에서 알파 카드를 수정하려고 할 때 
			// 따라서 두 경우를 모두 고려하기 위해서 If 문 내에 OR 를 이용하여 클래스를 부여해 줌
			var clickgroupName = $(this).parent().parent().parent().parent().parent().prev().text(); 
			var clickgroupClass = $(this).parent().attr('class');
			$("#alpha_table td").addClass("redips-mark dark") // 먼저 알파 카드를 드래그 할 때 모든 셀의 class에 redips-mark dark class 추가
// 			#("#alpha_accordion")
			for(var i=0; i<8; i++){// 모든 상위 그룹의 갯수가 7개(나머지 한개는 쓰레기통 부분이라 empty로 처리) 값을 가져와 비교
				var checkGroupName = $("#test").children("th").eq(i).text(); 
				if( clickgroupName == checkGroupName ||  clickgroupClass == groupName[i]+' redips-single' ){
					$("."+groupName[i]).removeClass("redips-mark dark"); // 해당 상위 그룹에 해당되는 cell에만 redips-mark dark class 제거
						
				}
			}
			// 만약 이미 알파 완료(done)인 row는 아얘 드래그가 불가능 하도록 막음
			for(var i=0; i< ${doneRow}; i++){
					$('#alpha_table tr').eq(i+1).children("td").addClass("redips-mark dark");
			}
		})
	})
	
	$('#alphaCheck').click(function(){
		
		
		cw=screen.availWidth;     //화면 넓이
		ch=screen.availHeight;    //화면 높이

		sw=800;    //띄울 창의 넓이
		sh=550;    //띄울 창의 높이

		ml=(cw-sw)/2;
		mt=(ch-sh)/2; 

		test=window.open('MileStoneScoreCheck.do?cardTitle='+alphaName+"&rowNo="+rowNo,'test','width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
	})
	
});


// 동적 추가된 테이블row의 삭제 버튼 클릭시 이벤트
$(document).on("click",".delete_alpha",function(){
	
	test1 = $(this).parent().parent();
	$('#delete_modal').show();
	
})

$('#delete_confirm').click(function(){
	
	 test1.detach();
	 $('#delete_modal').hide();
})
 
 $('#delete_cancel').click(function(){
	
	 $('#delete_modal').hide();
 })
 
// 동적 추가된 테이블row의 완료 버튼 클릭시 이벤트
$(document).on("click", ".complete_alpha",function(){
	$('#complete_modal').show();
})

// modal 창의 완료 버튼 클릭시 이벤트
$('#complete_confirm').click(function(){
	
	var $this = $('.complete_alpha')
	var rowName = $this.parent().parent().children("th").text(); 	// 마일스톤 완료할 row의 이름
	var rowNo = $this.parent().parent().children("th").attr("name"); // 마일스톤 완료할 rowNo
	var cardNoArr = [];													 // 완료할 알파 카드 배열
	for(var i=0; i<7; i++){
		var lengthCheck =  $this.parent().parent().children("td").eq(i).find("div");
		if( lengthCheck.length > 0){
			lengthCheck.attr("name");
			cardNoArr.push(lengthCheck.attr("name"));
		}
	}
	
	location.href="mileStoneComplete.do?rowName="+rowName+"&rowNo="+rowNo+"&cardNoArr="+cardNoArr;
})

$('#complete_cancel').click(function(){
	
	$('#complete_modal').hide();
})

// 마일스톤 완료 버튼 클릭시 생기는 오른쪽 버튼 클릭시,
$(document).on("click", ".goodAndBad_alpha", function(){
	
	var rowName = $(this).parent().parent().children("th").text();
	var rowNo = $(this).parent().parent().children("th").attr("name");
	
	cw=screen.availWidth;     //화면 넓이
	ch=screen.availHeight;    //화면 높이
	
	sw=1000;    //띄울 창의 넓이
	sh=700;    //띄울 창의 높이

	ml=(cw-sw)/2;
	mt=(ch-sh)/2; 

	test=window.open('MileStoneGoodAndBad.do?rowNo='+rowNo+'&rowName='+rowName,'test','width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
})

// pop up 으로 띄어 줄 알파 카드 상세 내용
$(document).on("click",".external-event",function(){
	var chk = $(this).hasClass("redips-clone");
	if(chk == false){ 
	//눌렀을때 그 알파카드 이름
	var rowNo = $(this).parent().parent().children("th").attr("name");
	var alphaName = $(this).text();
	cw=screen.availWidth;     //화면 넓이
	ch=screen.availHeight;    //화면 높이

	sw=800;    //띄울 창의 넓이
	sh=550;    //띄울 창의 높이

	ml=(cw-sw)/2;
	mt=(ch-sh)/2; 

	test=window.open('modalMileStone.do?cardTitle='+alphaName+"&rowNo="+rowNo,'test','width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=yes');
	
	}
});
</script>

</body>
</html>
