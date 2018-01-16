<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="btbp.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String pagenum = request.getParameter("pageNo");
	int pageno = 0;
	if(pagenum!=null) pageno=Integer.parseInt(pagenum);//현재 눌린번호
	
	if(pageno<1){//현재 페이지
		pageno = 1;
	}
	
	
	int totalRecord =(int)(request.getAttribute("totalPage"));
	System.out.println(totalRecord);
	int page_per_record_cnt =7;
	int group_per_page_cnt =5;
	
	int record_end = pageno*page_per_record_cnt;//끝페이지
	int record_start= record_end-(page_per_record_cnt-1);//시작페이지
	if(record_end>totalRecord){
		record_end = totalRecord;
	}
	System.out.println(record_end);//10
	int total_page = totalRecord / page_per_record_cnt + (totalRecord % page_per_record_cnt>0 ? 1 : 0);
	
	System.out.println(total_page);//2
	if(pageno>total_page){//누른 페이지 번호>10;
		pageno = total_page; //누른 페이지 번호 = 10
	}
	
	int group_no = pageno/group_per_page_cnt+( pageno%group_per_page_cnt>0 ? 1:0);
	//현재 그룹번호 = 현재페이지/페이지당 보여줄 페이지 번호수+(햔재페이지%페이지당 보여줄 번호수>0?1:0)
	int page_eno = group_no*group_per_page_cnt;	//현재 그룹 끝번호	
	int page_sno = page_eno-(group_per_page_cnt-1);	//현재 그룹 시작번호=현재 그룹 끝번호-(페이지당 보여줄 번호수-1)
	
	if(page_sno<0){
		page_sno=1;
	}
	if(page_eno>total_page){
		page_eno=total_page;
	}
	int prev_pageno = pageno-1;
	int next_pageno = pageno+1;
	if(prev_pageno<1){
	//	이전 페이지 번호가 1보다 작을 경우		
		prev_pageno=1;
	//	이전 페이지를 1로
	}
	if(next_pageno>total_page){
	//	다음 페이지보다 전체페이지 수보가 클경우		
// 		next_pageno=total_page/group_per_page_cnt*group_per_page_cnt+1;
		next_pageno=total_page;
}
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
<script src="/BTBP/resources/js/bootstrap.min.js"></script>
<script src="/BTBP/resources/js/app.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<style type="text/css">
@import url(https://fonts.googleapis.com/earlyaccess/notosanskr.css);

body,table,div,p,h1,h2,h3,h4,h5,h6 {
   font-family: 'Noto Sans KR', serif;
}
	th, td{
		text-align: center;
		vertical-align: middle;
	}	
	td>p{
	margin: 0 0 0 0;
	}
	a{ 
		text-decoration:none ;
		color: red;
	}	
 	.box-header.with-border { 
     border-bottom: 2px solid #eee; 
 	} 	
 	.table>thead>tr>th {
     vertical-align: middle;     
	 border-bottom: 2px solid #eee;
    } 	
	.table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td, .table>tbody>tr>td, .table>tfoot>tr>td {
		border-top: 1px solid rgba(210, 214, 222, 0.43);
	}	
	.box-footer {
		border-top: 1px solid rgba(210, 214, 222, 0.66);
	}
</style>
<script type="text/javascript">

$(function(){
	
	$('li').removeClass('active');
	if(${status.equals('board')}){
		$('#Board').addClass('active');
	}else if(${status.equals('notice')}){
		$('#Notice').addClass('active');
	}

	
	//현재 페이지 버튼 파란색 추가
	$('.paging').each(function(){
		if($(this).children().text() == "${nowpagenum}"){
			$(this).addClass('active');
		}
	});
	//전체 체크박스 눌리면 체크
	$('#checkAllList').click(function(){
		var check = $(this).is(":checked");//prop : true,false로 출력 attr:checked
		if(check) $('.checkList').prop("checked",true);
		else $('.checkList').prop("checked",false);
	})
	
$('#delChk').click(function(){
      var ck = $("input[name=checkList]").is(":checked");
      var arr="";
      if(ck){
         $("input[name=checkList]:checked").each(function(index,elem){
            var sessId = "${sessionScope.memberId}";
            var delId = $(this).parent().next().next().next().text();
//             alert(sessId+"," + delId);
            if(sessId == delId){
               
               arr += $(this).parent().next().text()+',';
               
            }else{
               if(confirm("본인의 글이 아니므로 삭제할 수 없습니다.")){
            	   $("input[name=checkList]:checked").attr("checked", false);
               }
            }
//             alert(arr);
            if(arr != "" ){
               if(confirm("삭제 하시겠습니까?")){
               location.href="ProjectBoardDelete.do?StringBoardNo="+arr+"&boardType=${status}&pageNo=${nowpagenum}";   
               }
            }
            
         
         })
         
         
      }else{
         alert("체크된 글이 없습니다.");
      }
         
      
   })
	
	 
});

</script>

</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

  <!-- Main Header -->
  <%@include file="header.jsp" %>
  <!-- Left side column. contains the logo and sidebar -->
  <%@include file="menu.jsp" %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
	<c:if test="${status eq 'notice'}">
	 <h1>
           팀 공지사항
      </h1>
	</c:if>  
	
	<c:if test="${status eq 'board' }">
      <h1>
           팀 게시판
      </h1>
	</c:if>
    </section>

 <!-- Main content -->
  <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-primary">
          <div class="box-header with-border">
          
          <c:if test="${status eq 'notice'}">
          
              <h3 class="box-title"><i class="fa fa-bullhorn"></i>&nbsp;공지사항</h3>
          </c:if>
          <c:if test="${status eq 'board' }">
     			 <h3 class="box-title"><i class="fa fa-newspaper-o"></i>&nbsp;게시판</h3>
			</c:if>
          
            </div>
            <div class="box-header with-border" style="height:40px;">
              <div class="box-tools pull-right" >
              
	              <form action="WriterFind.do" method="post">
	                <div class="input-group input-group-sm" style="width: 150px;">
	                	 <input type="hidden" name="boardType" value="${status }">
	                 	 <input type="text" name="memberId" id="memberId" class="form-control pull-right" placeholder="작성자 검색...">
	                  <div class="input-group-btn">
	                  	  <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
	                  </div>
	                </div>
	              </form>
              
              </div>
              <!-- /.box-tools -->
            </div>
         <!-- /.box-header -->

  		<!-- 팀 게시판 리스트 --> 
            <table class="table table-hover" style="margin-bottom:0px">

		<thead>
			<tr>
		<!-- 전체 선택 -->

		<c:if test="${status eq 'board'}">
			<th style="text-align: center;width: 15px;">
				<button type="button" class="btn btn-default btn-sm checkbox-toggle">
					<input type="checkbox" id="checkAllList"/>
				</button>
			</th>
			<th style="width: 70px;">번호</th>
			<th style="width: 400px;;">제목</th>

			<th style="width: 100px;;">작성자</th>
			<th style="width: 200px;">작성일</th>

			<th style="width: 60px;;">조회수</th>
			<th style="width: 100px;">파일</th>

		</c:if>

		<c:if test="${status eq 'notice' }">
			<th style="text-align: center;width: 15px;">
				<button type="button" class="btn btn-default btn-sm checkbox-toggle">
					<input type="checkbox" id="checkAllList">
				</button>
			</th>
			<th style="width: 70px;">번호</th>
			<th style="width: 400px;">제목</th>
			<th style="width: 400px;">내용</th>
			<th style="width: 150px;">등록일시</th>
			<th style="width: 100px;">조회수</th>

		</c:if>
		</tr>
</thead>

<tbody> 
			<c:if test="${status eq 'board' }">
				<c:if test="${!bList.isEmpty()}">
				   <c:forEach var="BoardVO" items="${bList}"> 
					
					<tr>
						<td><input type="checkbox" class="checkList" name="checkList"></td>
					    <td>${BoardVO.boardNo}</td>
						<td>
							<a href="ProjectBoardDetail.do?boardNo=${BoardVO.boardNo}&boardType=${BoardVO.boardType}&pageNo=${nowpagenum}">${BoardVO.boardTitle}</a>
						</td>
						<td>${BoardVO.memberId}</td>
						<td>${BoardVO.createDate}</td>
						<td>${BoardVO.boardCnt}</td>
						<td style="text-align:center">
							<c:if test="${BoardVO.fileName !=null }">
								<a href="fileDownload.do?boardNo=${BoardVO.boardNo}">
									<button type="button" title="${BoardVO.fileName}" class="btn btn-block btn-default btn-xs" style= "width: 30px; margin-left: 3px; display:inline-block;" >
										<i class="fa fa-save"></i>
									</button>
								</a>
							</c:if>
						</td>
					</tr>

				   </c:forEach>
				</c:if>
					
					<c:if test="${bList.isEmpty()}">
					<tr>
						<td colspan="7" style="text-align:center">작성된 게시물이 없습니다.</td>
					</tr>
				</c:if>    
			</c:if>
				
				
			<c:if test="${status eq 'notice' }">
				<c:if test="${!bList.isEmpty() }"><c:set var="stringPlus" value="...."/>
                   
	                <c:forEach var="bvo" items="${bList }">
	                <c:set var="stringPlus" value="...."/>
	                <c:set var="boardcontent" value="${bvo.boardContent}"/>
                   <c:set var="boardtitleLength" value="${fn:length(boardcontent)}"/>
                   <c:if test="${boardtitleLength > '15' }">
                   <c:set var="boardcontent" value="${fn:substring(bvo.boardContent,0,20)}"/>  
                   <c:set var= "boardcontent" value="${boardcontent}${stringPlus}"/>
                   </c:if>
		                <tr>
		                  <td><input type="checkbox" class="checkList" name="checkList"></td>
		                  <td>${bvo.boardNo }</td>
		                  <td>  <a href="ProjectBoardDetail.do?boardNo=${bvo.boardNo}&boardType=${bvo.boardType}&pageNo=${nowpagenum}">${bvo.boardTitle}</a></td>
		                
		                  <td>${boardcontent }</td>   
		                  <td>${bvo.createDate }</td>
		                  <td>${bvo.boardCnt }</td>
		                     
		                </tr>
	                </c:forEach>
	            </c:if>
	                
	           	<c:if test="${bList.isEmpty()}">
					<tr>
						<td colspan="7" style="text-align:center">작성된 게시물이 없습니다.</td>
					</tr>
				</c:if>   
			</c:if>
				
               
				            
               
              </tbody>  
                
            </table>
            <!-- /.table -->
              
		
        <!-- /.mail-box-messages -->

    <!-- /.box-body -->
            <div class="box-footer">
               
               <c:if test="${status eq 'board' }">
                <!-- 삭제 버튼 -->
                <div class="pull-left" style="margin-top:60px">
                  <button type="button" class="btn btn-danger" id="delChk"><i class="fa fa-trash-o"></i> 삭제</button>
                </div>
                </c:if>
                <!-- /.pull-left -->

				<!-- 글쓰기 버튼 -->
                <div class="pull-right" style="margin-top:60px">
 					<a href="ProjectBoardInsertForm.do?boardType=${status }&pageNo=${nowpagenum}">
 						<button type="button" class="btn btn-success"><i class="fa fa-edit"></i> 글쓰기</button>
 					</a>
                 <!-- /.btn-write -->
                </div>
                 <!-- /.pull-right -->
                 
             <c:if test="${!bList.isEmpty()}">    
                <!-- "페이징" -->
                <div style="text-align:center">
					<ul class="pagination pagination-warning">
						<li><a href="ProjectBoard.do?boardType=${status}&pageNo=<%=prev_pageno%>">prev</a></li>
						<%for(int i=page_sno;i<=page_eno;i++) {%>
						<li class="paging"><a href="ProjectBoard.do?boardType=${status}&pageNo=<%=i %>"><%=i %></a></li>
						<%}%>
						<li><a href="ProjectBoard.do?boardType=${status}&pageNo=<%=next_pageno%>">next</a></li>
		            </ul>
				</div>                
              </c:if>  
             
             </div>
             <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
 </section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->



  <!-- Main Footer -->
  <%@include file="footer.jsp" %>
  <!-- Control Sidebar -->
 
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->



</body>
</html>