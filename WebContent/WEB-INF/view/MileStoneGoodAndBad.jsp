<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	String rowName = (String)request.getParameter("rowName");
	int rowNo = Integer.parseInt(request.getParameter("rowNo"));
%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html style="width: 800px;height: 800px">
<head>
  <link rel="apple-touch-icon" sizes="76x76" href="/BTBP/resources/main/teamup-icon.png">
	<link rel="icon" href="/BTBP/resources/main/teamup-icon.png">
    <title>BTBP - Best Teamwork Best Project</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
  <link rel="stylesheet" href="/BTBP/resources/css/bootstrap.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="/BTBP/resources/css/AdminLTE.css">
  <link rel="stylesheet" href="/BTBP/resources/css/skins/skin-purple.min.css">
  <style type="text/css">
@import url('https://fonts.googleapis.com/earlyaccess/hanna.css');
*{font-family: 'Hanna', sans-serif;}
  th,td,tr{
  	text-align: center;
  }
  </style>
</head>
<body class="hold-transition skin-purple sidebar-mini">
<div>
  <!-- Content Wrapper. Contains page content -->
 	<div class="container" >
			<br /><br />
				<div class="row">
					<div class="box box-widget widget-user-2"
				style="width: 100%; height: 30%;">
				<!--/content body -->
			<form id="frm" action="MileStoneGoodAndBad_Insert.do">
				<div class="box-footer no-padding">
					<div class="col-md-13">
						<div class="box-body box-profile">
              <h3 class="profile-username text-center"><b><%=rowName%></b></h3><!-- 제목 -->
              <ul class="list-group list-group-unbordered" style="list-style: none;">
               <div class="box-body table-responsive no-padding">
              <table class="table table-hover" style= " valign:middle">
                <tr>
                  <th>상태</th>
                  <th>체크리스트</th>
                  <th>합계</th>
                </tr>
                <tr>
                </tr>
              <c:if test="${!list.isEmpty()}"> 
               <c:forEach var="MileStoneVO" items="${list}" varStatus="status1"> 
               <c:forEach var="i" begin="0" end="11" step="1">
               <c:if test="${MileStoneVO.checkPointArr[i] ne 0 }">
               <c:set ></c:set>
                <tr>
                  <td>${MileStoneVO.cardNo}(${MileStoneVO.cardTitle})</td>
                  <td class="input-group"><span class="input-group-addon">
                          <input type="checkbox" class="checkbox_checked" style="padding-right: 50px;" checked>
                        </span>
                    <input type="text" class="form-control" value="${MileStoneVO.checkArr[i]}"></td>
                  <td>${MileStoneVO.checkPointArr[i]}점</td>
                </tr>
                </c:if>
                </c:forEach>
                </c:forEach>
                </c:if>
                <tr><th>총점</th><th></th><th>점</th></tr>
              </table>
            </div>
              <div class="form-group">
                <label>잘한 점 :</label>
               <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-thumbs-o-up"></i></span>
                <input type="hidden" name="rowNo" value="<%=rowNo%>"/>
                <input type="hidden" name="rowName" value="<%=rowName%>"/>
                <textarea id="kanbanContent" class="form-control" placeholder="잘한 점" name="rowGood" style="height: 100px;">${mileStone.rowGood}</textarea>
                    </div>
              </div>
              <div class="form-group">
                <label>수정할 점 :</label>
               <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-thumbs-o-down"></i></span>
                <textarea id="kanbanContent" class="form-control" placeholder="못한 점" name="rowBad"  style="height: 100px;">${mileStone.rowBad}</textarea>
                    </div>
              </div>
              </ul>
              <c:choose>
              <c:when test="${mileStone.rowGood eq null || mileStone.rowBad eq null}">
              <button class="btn btn-primary pull-right" id="Insert_score">OK</button>
              </c:when>
              <c:otherwise>
               <button class="btn btn-primary pull-right" id="Insert_score" disabled="disabled">OK</button>
              </c:otherwise>
              </c:choose>
            </div>
						<!-- /.box-body -->
						<!-- /.box-footer -->
					</div>
				</div>
				</form>
			</div>
				</div>
			</div>
  <!-- /.content-wrapper -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
<!-- REQUIRED JS SCRIPTS -->
<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/BTBP/resources/plugins/bootstrap/bootstrap.min.js"></script>
<script src="/BTBP/resources/plugins/app/app.min.js"></script>
<script>
$(function(){
	$('#Insert_score').click(function(){
		
		$('#frm').submit();
	
	})	
})
</script>
</body>
</html>
