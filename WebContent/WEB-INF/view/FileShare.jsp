<%@ page contentType="text/html; charset=UTF-8"%>
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
		next_pageno=total_page;
}
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
		<link rel="stylesheet" href="/BTBP/resources/plugins/css/modal.css">
		<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
		<script src="/BTBP/resources/plugins/bootstrap/bootstrap.min.js"></script>
		<script src="/BTBP/resources/js/app.min.js"></script>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<style>
			@import url('https://fonts.googleapis.com/earlyaccess/hanna.css');
			*{font-family: 'Hanna', sans-serif;}
		</style>
		<script>
			$(function(){
				
				// *********** 게시판 형식 javascript ********************
				var $boardNo =  $('.boardNo');
				$('.FileShareView').each(function(){	
					$(this).children().next().click(function(){
						var boardNo = $(this).parent().find($boardNo).text();
						window.location.href="FileShareDetail.do?boardNo="+boardNo;
					})
				});
				
				// 삭제 아이콘을 눌렀을 때, modal 창 뜸
				$('#FileShareDelete').click(function(){
					var chk = $("input[name=checkbox_list]").is(":checked")
					var arr = "";
					if(!chk){
						alert("체크한 박스가 없습니다.");	
					}else{		
					$('#delete_modal').show();
					}	
				});
				
				// 체크 박스 아이콘이 눌렸을 때, 모든 게시물의 체크박스 활성화
				$("#checkboxmenu").click(function(){
					var chk = $(this).is(":checked");//.attr('checked');
			        if(chk) $(".checkbox_list").prop('checked', true);
			        else  $(".checkbox_list").prop('checked', false);
				})
				// 쓰레기통 아이콘 버튼을 눌렀을 때 
				// 1. 나의 아이디가 아닌 게시물을 삭제시 , 삭제 할 수 없음
				// 2. 여러개의 checkbox를 클릭시, 한꺼번에 삭제 됨
				// 3. 체크한 박스가 없을 시, alert 창 띄어줌							
				$('#delete_confirm').click(function(){
					
						var chk = $("input[name=checkbox_list]").is(":checked")
						var arr = "";
						if(chk){				
						$("input[name='checkbox_list']:checked").each(function(pi,po){
							var sessionId = '${sessionScope.memberId}';
							var deleteId =  $(this).parent().next().next().text();
							if( sessionId != deleteId ){
								alert(deleteId + "는 자신이 쓴 게시판이 아니므로 삭제할 수 없습니다.");
								location.href="FileShare.do?boardType=${status}&pageNo=${nowpagenum}"
							}else{
							arr += $(this).val()+',';	
							}
						})
						
						if(arr != ""){
							location.href="fileShareDelete.do?StringBoardNo="+arr+"&boardType=${status}&pageNo=${nowpagenum}"; 
							}
						}			
						else{// 삭제 하려는 리스트 중에 자신이 쓴 게시판이 아닐 경우 삭제 x		
						alert("체크한 박스가 없습니다.");	
						}
				});
				
				
				// 취소하기 버튼
				
				$('#delete_cancel').click(function(){ 
					location.href="FileShare.do?boardType=${status}&pageNo=${nowpagenum}"
				});
				
				
				// 검색 하기 이벤트
				$('#fileShare_search').keydown(function(key){
			
			        if(key.keyCode == 13){
					var search = $(this).val();
					location.href='fileShareSearch.do?search='+search;
					
			        }
				})
				
				$("#FileShareReply").click(function(){
					location.href="FileShare.do";
				})
			// *********** 	아이콘 형식 javascript ************8
				
				// 체크 박스 눌렀을 때 모두 checking
				// 1. 나의 아이디가 아닌 게시물을 삭제시 , 삭제 할 수 없음
				// 2. 여러개의 checkbox를 클릭시, 한꺼번에 삭제 됨
				// 3. 체크한 박스가 없을 시, alert 창 띄어줌					
				$("#icon_allCheckbox").click(function(){
					var chk = $(this).is(":checked")
					if(chk) $(".icon_checkbox").prop("checked", true);
					else $(".icon_checkbox").prop("checked", false);
				})
				
				// 삭제 버튼 이벤트 생성
				$('#icon_delete').click(function(){ 
					var chk = $("input[name=icon_checkbox]").is(":checked")
					var arr = "";
					if(chk){				
					$("input[name='icon_checkbox']:checked").each(function(pi,po){
						var sessionId = '${sessionScope.memberId}';
						var deleteId = '${memberId}'; 
						if( sessionId != deleteId ){
							alert(deleteId+ "는 자신이 쓴 게시판이 아니므로 삭제할 수 없습니다.");
						}else{
						arr += $(this).next().val()+',';			
						}
					})
					if(arr != null){
						location.href='fileShareDelete.do?StringBoardNo='+arr+'&pageno=1';
					}
					}			else{// 삭제 하려는 리스트 중에 자신이 쓴 게시판이 아닐 경우 삭제 x		
						alert("체크한 박스가 없습니다.");	
					}
			});
				
				//현재 페이지 버튼 파란색 추가
				$('.paging').each(function(){
					if($(this).children().text() == "${nowpagenum}"){
						$(this).addClass('active');
					}
				});	
				
			});
		</script>
		
		<style type="text/css">
			@import url(https://fonts.googleapis.com/earlyaccess/notosanskr.css);
			
			body,taple,div,p,h1,h2,h3,h4,h5,h6 {
			   font-family: 'Noto Sans KR', serif;
			}
		
			button{
				background-color:gray;color:#fff;border:none;box-shadow:none;font-size:14px;font-weight:500;-webkit-border-radius:4px;border-radius:5px;  padding:8px 28px;cursor:pointer
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
			
			.tab-content>.active {
		    display: initial;
			}
		</style>
		<script type="text/javascript">
			$(function(){
				$('li').removeClass('active');
				$('#FileShareMenu').addClass('active');
			});
		</script>
	</head>

	<body class="hold-transition skin-purple sidebar-mini">
		<div class="wrapper">
	
			<%@include file="header.jsp"%>
			<%@include file="menu.jsp"%>
	
			<div class="content-wrapper">
				<section class="content-header"></section>
	
				<section class="content">
					<div class="row">
						<div class="col-md-12">
							<div class="nav-tabs-custom">
								<ul class="nav nav-tabs pull-right">
									<li class="active"><a href="#check1" data-toggle="tab"><i class="fa fa-list"><b> Board.Ver.</b> </i></a></li>
									<li><a href="#check2" data-toggle="tab"><i class="fa fa-th"><b> Icon.Ver.</b> </i></a></li>
								</ul>
								<div class="tab-content no-padding">
									<!-- 게시판 형식 시작 부분-->
									<div class="chart tab-pane active" id="check1" style="position: relative;">
										<div class="box box-primary">
											<div class="box-header with-border">
												<h3 class="box-title">
													<i class="fa fa-inbox"></i>&nbsp;&nbsp;<b>파일 공유</b>
												</h3>
											</div>
	
											<div class="box-header with-border" style="height: 40px;">
												<div class="box-tools pull-right">
													<form action="fileShareSearch.do" method="post">
														<!-- <div class="input-group input-group-sm" style="width: 150px;"> -->
														<%-- <input type="hidden" name="boardType" value="${status }"> --%>
														<!-- <input type="text" name="memberId" id="memberId" class="form-control pull-right" placeholder="작성자 검색..."> -->
														<!-- <div class="input-group-btn"> -->
														<!-- <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button> -->
														<!-- </div> -->
														<!-- </div> -->
													</form>
												</div>
											</div>
											<div class="box-body no-padding">
												<div class="box-body table-responsive no-padding">
													<table class="table table-hover" style="margin-bottom: 0px">
														<thead>
															<tr>
																<th style="text-align: center; width: 5%">
																	<button type="button" class="btn btn-default btn-sm checkbox-toggle">
																		<input type="checkbox" id="checkboxmenu" />
																	</button>
																</th>
																<th style="width: 5%">번호</th>
																<th style="width: 10%">업로더</th>
																<th style="width: 10%">제목</th>
																<th style="width: 18%">세부사항</th>
																<th style="width: 18%">날짜</th>
																<th style="width: 7%">다운로드</th>
																<th style="width: 7%">조회수</th>
															</tr>
														</thead>
														<tbody>
															<%-- <c:if test="${status eq 'board' }"> --%>
															<c:if test="${!bList.isEmpty()}">
																<c:forEach var="BoardVO" items="${bList}">
																	<tr>
																		<c:set var="string1" value="${BoardVO.boardContent}" />
																		<c:set var="FileShareContent"
																			value="${fn:substring(string1, 0, 15)}" />
																		<c:set var="BoardVO.boardCnt"
																			value="${BoardVO.boardCnt}" />
																		<c:set var="BoardVO.fileName"
																			value="${BoardVO.fileName}" />
	
																		<td><input type="checkbox" class="checkbox_list" name="checkbox_list" value="${BoardVO.boardNo}" /></td>
																		<td class="boardNo">${BoardVO.boardNo}</td>
																		<td class="memberId">${BoardVO.memberId}</td>
																		<td><a href="FileShareDetail.do?boardNo=${BoardVO.boardNo}&boardType=${BoardVO.boardType}&pageNo=${nowpagenum}">${BoardVO.boardTitle}</a>
																		</td>
																		<td>${FileShareContent}</td>
																		<td>${BoardVO.createDate}</td>
																		<td style="text-align: center"><c:if test="${BoardVO.fileName != null }">
																				<a href="fileDownload.do?boardNo=${BoardVO.boardNo}">
																					<button type="button" title="${BoardVO.fileName}" class="btn btn-block btn-default btn-xs" style="width: 30px; margin-left: 0px; display: inline-block;">
																						<i class="fa fa-save"></i>
																					</button>
																				</a>
																			</c:if></td>
																		<td>${BoardVO.boardCnt}</td>
																	</tr>
																</c:forEach>
															</c:if>
															<c:if test="${bList.isEmpty()}">
																<tr>
																	<td colspan="7" style="text-align: center">
																		작성된 게시물이 없습니다.
																	</td>
																</tr>
															</c:if>
	
															<%-- </c:if> --%>
														</tbody>
													</table>
												</div>
											</div>
											<div class="box-footer">
												<!-- 삭제 버튼 -->
												<div class="pull-left" style="margin-top: 60px">
													<button type="button" class="btn btn-danger"
														id="FileShareDelete">
														<i class="fa fa-trash-o"></i> 삭제
													</button>
												</div>
												<!-- 글쓰기 버튼 -->
												<div class="pull-right" style="margin-top: 60px">
													<a href="fileShareInsertForm.do?boardType=${status }&pageNo=${nowpagenum}">
														<button type="button" class="btn btn-success">
															<i class="fa fa-edit"></i> 파일 등록
														</button>
													</a>
												</div>
												<c:if test="${!bList.isEmpty()}">
													<!-- "페이징" -->
													<div style="text-align: center">
														<ul class="pagination pagination-warning">
															<li><a href="FileShare.do?boardType=${status}&pageNo=<%=prev_pageno%>">prev</a></li>
															<%for(int i=page_sno;i<=page_eno;i++) {%>
																<li class="paging"><a href="FileShare.do?boardType=${status}&pageNo=<%=i %>"><%=i %></a></li>
															<%}%>
															<li><a href="FileShare.do?boardType=${status}&pageNo=<%=next_pageno%>">next</a></li>
														</ul>
													</div>
												</c:if>
											</div>
										</div>
									</div>
									<!-- 아이콘 형식 시작 부분 -->
									<div class="chart tab-pane" id="check2" style="position: relative;">
										<!-- 나중에 파일 길이에 따라 수정 -->
										<!-- 필요한 부분 입력 -->
										<div class="box box-primary">
											<div class="box-header with-border">
												<h3 class="box-title">
													<i class="fa fa-inbox"></i> 파일 공유
												</h3>
											</div>
											<div class="box-footer" style="border-top: 0px solid rgba(210, 214, 222, 0.66)">
												<ul class="mailbox-attachments clearfix">
													<c:if test="${!bList.isEmpty()}">
														<c:forEach var="BoardVO" items="${bList}">
															<c:set var="string1" value="${BoardVO.fileName}" />
															<c:set var="FileShareType" value="${fn:substringAfter(string1,'.')}" />
															<c:set var="memberId" value="${BoardVO.memberId}" />
															<c:set var="boardNo" value="${BoardVO.boardNo}" />
															<li style="width: 19.2%;">
																<c:choose>
																	<c:when test="${FileShareType == 'png' || FileShareType == 'img' || FileShareType == 'gif' || FileShareType == 'jpg' ||FileShareType == 'JPEG' }">
																		<span class="mailbox-attachment-icon has-img"
																			style="height: 150px;"> <img
																			src="/BTBP/resources/upload/BoardFiles/${BoardVO.fileSaveName}"
																			alt="Attachment" style="width: 200px; height: 150px;">
																		</span>
																		<div class="mailbox-attachment-info">
																			<a href="FileShareDetail.do?boardNo=${BoardVO.boardNo}&boardType=${BoardVO.boardType}&pageNo=${nowpagenum}" id="icon_fileName"> 
																				<i class="fa fa-camera">&nbsp;</i>
																				${BoardVO.fileName}
																			</a>
																		</div>
																	</c:when>
																	<c:when test="${FileShareType == 'docx'}">
																		<span class="mailbox-attachment-icon" style="height: 150px;"> 
																			<i class="fa fa-file-word-o"></i>
																		</span>
																		<div class="mailbox-attachment-info">
																			<a href="FileShareDetail.do?boardNo=${BoardVO.boardNo}&boardType=${BoardVO.boardType}&pageNo=${nowpagenum}" id="icon_fileName"> 
																				<i class="fa fa-paperclip"></i>
																				${BoardVO.fileName}
																			</a>
																		</div>
																	</c:when>
																	<c:when test="${FileShareType == 'xlsx'}">
																		<span class="mailbox-attachment-icon"
																			style="height: 150px;"> <i
																			class="fa fa-file-excel-o"></i>
																		</span>
																		<div class="mailbox-attachment-info">
																			<a href="FileShareDetail.do?boardNo=${BoardVO.boardNo}&boardType=${BoardVO.boardType}&pageNo=${nowpagenum}" id="icon_fileName"> 
																				<i class="fa fa-paperclip"></i>
																				${BoardVO.fileName}
																			</a>
																		</div>
																	</c:when>
																	<c:when test="${FileShareType == 'txt'}">
																		<span class="mailbox-attachment-icon" style="height: 150px;"> 
																			<i class="fa fa-file-text-o"></i>
																		</span>
																		<div class="mailbox-attachment-info">
																			<a href="FileShareDetail.do?boardNo=${BoardVO.boardNo}&boardType=${BoardVO.boardType}&pageNo=${nowpagenum}" id="icon_fileName"> 
																				<i class="fa fa-paperclip"></i>
																				${BoardVO.fileName}
																			</a>
																		</div>
																	</c:when>
																	<c:otherwise>
																		<span class="mailbox-attachment-icon"
																			style="height: 150px;"> <i
																			class="fa fa-file-text-o"></i>
																		</span>
																		<div class="mailbox-attachment-info">
																			<a
																				href="FileShareDetail.do?boardNo=${BoardVO.boardNo}&boardType=${BoardVO.boardType}&pageNo=${nowpagenum}"
																				id="icon_fileName"> <i class="fa fa-paperclip"></i>
																				${BoardVO.fileName}
																			</a>
																		</div>
																	</c:otherwise>
																</c:choose> 
																<span class="mailbox-attachment-size" style="padding-left: 10px"> ${BoardVO.fileSize} KB
																	<a href="fileDownload.do?boardNo=${BoardVO.boardNo}" class="btn btn-default btn-xs pull-right"> 
																		<i class="fa fa-cloud-download"></i>
																	</a> 
																	<a href="#" class="pull-right">&nbsp; <input type="hidden" value="${BoardVO.boardNo}"></a>
																</span>
															</li>
														</c:forEach>
													</c:if>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	
		<!-- 팝업 창 시작 부분 (삭제)-->
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
			<h2>파일 삭제</h2>
			<fieldset>
				<input type="text" tabindex="3" placeholder="ddddddddddddd">
				<div class="sa-input-error"></div>
			</fieldset>
			<div class="sa-error-container">
				<div class="icon">!</div>
				<p>Not valid!</p>
			</div>
			<div class="sa-button-container">
				<button class="cancel" tabindex="2" id="delete_cancel"
					style="display: inline-block; box-shadow: none; margin-left: 110px">취소</button>
				<div class="sa-confirm-button-container" style="padding-right: 30px">
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
		<!-- 모달 팝업 시작 부분(수정) -->
		<!-- Main Footer -->
		<%@include file="footer.jsp" %>
		<!-- /Main Footer -->
		<div class="control-sidebar-bg"></div>
	</body>
</html>
