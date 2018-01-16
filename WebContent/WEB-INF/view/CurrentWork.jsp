<%@page import="java.util.HashMap"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	String kPageNo = request.getParameter("kpageNo");
	if( kPageNo == null) kPageNo = "1";
	
	String wPageNo = request.getParameter("wpageNo");
	if(wPageNo == null) wPageNo="1";
%>

<!DOCTYPE html>
<html>
<head>
<link rel="apple-touch-icon" sizes="76x76" href="/BTBP/resources/main/teamup-icon.png">
	<link rel="icon" href="/BTBP/resources/main/teamup-icon.png">
    <title>TeamUP 팀업 - Communication is Everything</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<link rel="stylesheet" href="/BTBP/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="/BTBP/resources/css/AdminLTE.min.css">
<link rel="stylesheet" href="/BTBP/resources/css/skins/skin-purple.min.css">
<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/BTBP/resources/plugins/bootstrap/bootstrap.min.js"></script>
<script src="/BTBP/resources/js/app.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style type="text/css">
@import url(https://fonts.googleapis.com/earlyaccess/notosanskr.css);

body,taple,div,p,h1,h2,h3,h4,h5,h6 {
   font-family: 'Noto Sans KR', serif;
}
</style>
<script>
$(function(){
	$('li').removeClass('active');
	$('#MyWork').addClass('active');
	
	$('.paging').each(function(){
		if($(this).children().text() == <%=kPageNo %>){
			$(this).addClass('active');
		}
		
	})
	$('.pagingw').each(function(){
		if($(this).children().text() == <%=wPageNo%>){
			$(this).addClass('active');
		}
	})
});
</script>
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

	<%@include file="header.jsp" %>
	<%@include file="menu.jsp" %>

<div class="content-wrapper">
	
	<section class="content-header"><h1>나의 작업</h1></section>

	<section class="content">
	<div class="row">
		<div class="col-md-6" >
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">칸반 보드</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body" style="height: 168px;">
            
             
              <table class="table table-bordered">
                <tr>
                  <th style="width: 5%">#</th>
                  <th style="width:50% ">업무</th>
                  <th style="width:29% ">상태</th>
                  <th style="width: 16%">마감 기한</th>
                </tr>
                <c:if test="${!kList.isEmpty() }">
                <c:forEach var="kanVO" items="${kList }">
                <tr>
                  <td>${kanVO.rNum }.</td>
                  <td>${kanVO.jobTitle }</td>
                  <td>
                  <c:choose>
                  <c:when test="${kanVO.jobStatus eq 'todo' }">
                  
                  <span class="badge bg-red">진행예정</span>
                  </c:when>
                  <c:when test="${kanVO.jobStatus eq 'doing' }">
                  <span class="badge bg-yellow">진행중</span>
                  
                  </c:when>
                  <c:when test="${kanVO.jobStatus eq 'done' }">
                   <span class="badge bg-light-blue">작업 완료</span>
                  
                  </c:when>
                  
                  
                  </c:choose>
                  </td>
                  <td>
                  <c:choose>
                  <c:when test="${kanVO.dueDate gt 0 }">
                   <span>${kanVO.dueDate }일</span>
                  </c:when>
                  <c:when test="${kanVO.dueDate eq 0 }">
                  	<span style="color: red;">오늘까지</span>
                  </c:when>
                  <c:otherwise>종료</c:otherwise>
                  </c:choose>
                  </td>
                </tr>
               </c:forEach>
                </c:if>
                
                <c:if test="${kList.isEmpty() }">
                <tr><td colspan="4" style="text-align:center">작성된 게시물이 없습니다.</td></tr>
                </c:if>
               
              </table>
               
            </div>
            <!-- /.box-body -->
            
            
            <div class="box-footer clearfix">
            <c:if test="${!kList.isEmpty() }">
              <ul class="pagination pagination-sm no-margin pull-right">
                <li><a href="CurrentWork.do?kpageNo=${kHash.prev}&wpageNo=<%=wPageNo%>">&laquo;</a></li>
                <c:forEach var="i" begin="${kHash.sNo}" end="${kHash.eNo}" step="1">
                <li class=paging><a href="CurrentWork.do?kpageNo=${i}&wpageNo=<%=wPageNo%>">${i}</a></li>
                </c:forEach>
                <li><a href="CurrentWork.do?kpageNo=${kHash.next}&wpageNo=<%=wPageNo%>">&raquo;</a></li>
              </ul>
              </c:if>
            </div>
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->	
        
        
        <div class="col-md-6">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">나의 게시글</h3>
            </div>
            
             <!-- /.box-header -->
            <div class="box-body" style="height: 168px;">
              <table class="table table-bordered">
                <tr>
                  <th style="width: 10px">#</th>
                  <th style="width:70%">제목</th>
                  <th style="width:30%">게시 위치</th>
                  
                </tr>
                <c:if test="${!wList.isEmpty() }">
                <c:forEach var="jVO" items="${wList }"  >
                <tr>
                  <td>${jVO.rNum }</td>
                  <td>${jVO.jobTitle }</td>
                  
                  <td><c:choose>
                  	<c:when test="${jVO.boardType eq 'board' }"><a href="ProjectBoard.do?boardType=board&pageNo=1">팀 게시판</a></c:when>
                  	<c:when test="${jVO.boardType eq 'notice' }"><a href="ProjectBoard.do?boardType=notice&pageNo=1">팀 공지사항</a></c:when>
                  	<c:when test="${jVO.boardType eq 'version' }"><a href="ProjectBoard.do?boardType=version">형상 관리</a></c:when>
                  	<c:when test="${jVO.boardType eq 'fileShare' }"><a href="ProjectBoard.do?boardType=fileShare&pageNo=1">파일 공유</a></c:when>
                  	<c:otherwise>전체</c:otherwise>
                  </c:choose>
                	&nbsp;&nbsp;<i class="fa fa-angle-double-right"></i>&nbsp;&nbsp;No.
                	<a href="ProjectBoardDetail.do?boardNo=${jVO.jobNo }&boardType=${jVO.boardType}">${jVO.jobNo }</a>
					</td>
                </tr>
                </c:forEach>
                </c:if>
                
                
                  <c:if test="${wList.isEmpty() }">
                <tr><td colspan="3" style="text-align:center">작성된 게시물이 없습니다.</td></tr>
                </c:if>
              </table>
            </div>
            
            <div class="box-footer clearfix">
            <c:if test="${!wList.isEmpty() }">
              <ul class="pagination pagination-sm no-margin pull-right">
                <li><a href="CurrentWork.do?wpageNo=${wHash.prev}&kpageNo=<%=kPageNo%>">&laquo;</a></li>
               <c:forEach var="j" begin="${wHash.sNo}" end="${wHash.eNo}" step="1">
               
                <li class=pagingw><a href="CurrentWork.do?wpageNo=${j}&kpageNo=<%=kPageNo%>">${j}</a></li>
                </c:forEach>
                <li><a href="CurrentWork.do?wpageNo=${wHash.next}&kpageNo=<%=kPageNo%>">&raquo;</a></li>
              </ul>
            </c:if>  
            </div>
          </div>
        </div>
        
	</div><!--row 끝  -->
	
	 <!-- /.row -->
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">파일</h3>

<!--               <div class="box-tools"> -->
<!--                 <div class="input-group input-group-sm" style="width: 150px;"> -->
<!--                   <input type="text" name="table_search" class="form-control pull-right" placeholder="Search"> -->

<!--                   <div class="input-group-btn"> -->
<!--                     <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tr>
                  <th>No</th>
                  <th>ID</th>
                  <th>게시 날짜</th>
               	  <th>제목</th>
                  <th style="text-align: center;">유형</th>
                  <th style="text-align: center;">다운로드</th>
                  
                </tr>
                <c:if test="${!fileList.isEmpty()}">
                <c:forEach var="JobVO" items="${fileList}">
                <tr>
                  <td>${JobVO.jobNo }</td>
                  <td>${JobVO.memberId }</td>
                  <td>${JobVO.createDate }</td>
                  <td>${JobVO.jobTitle }</td>
                  
                  <td style="text-align: center;">
				<c:choose>
                  	<c:when test="${JobVO.boardType eq 'fileShare' }"><span class="label label-success">파일공유</span></c:when>
                  	<c:when test="${JobVO.boardType eq 'board' }"><span class="label label-info">게시판</span></c:when>
                  	<c:when test="${JobVO.boardType eq 'version' }"><span class="label label-warning">형상관리</span></c:when>
              		<c:otherwise><span class="label label-default">커뮤니티</span></c:otherwise>
                  </c:choose>
					</td>
					<td style="text-align: center;">
					<a href="fileDownload.do?boardNo=${JobVO.jobNo}">
								<button type="button" title="${JobVO.fileName}" class="btn btn-block btn-default btn-xs" style= "width: 30px; margin-left: 3px; display:inline-block;" >
									<i class="fa fa-save"></i>
								</button>
							</a>
					</td>
                  
                  
                </tr>
                </c:forEach>
                </c:if>
                <c:if test="${fileList.isEmpty()}">
                <tr>
					<td colspan="6" style="text-align:center">작성된 게시물이 없습니다.</td>
				</tr>
                </c:if>
                

              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>
	</section>
     
     <!--==================================================================================  -->
     

  </div>
  <!-- /.content-wrapper -->


<%@include file="footer.jsp" %>
<div class="control-sidebar-bg"></div>
</div>

</body>
</html>
