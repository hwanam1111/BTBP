<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="btbp.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% int tdCnt = 0; %>
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
		<link rel="stylesheet" href="/BTBP/resources/plugins/daterangepicker/daterangepicker.css">
		<link rel="stylesheet" href="/BTBP/resources/plugins/datepicker/datepicker3.css">
		<link rel="stylesheet" href="/BTBP/resources/plugins/iCheck/all.css">
		<link rel="stylesheet" href="/BTBP/resources/plugins/colorpicker/bootstrap-colorpicker.min.css">
		<link rel="stylesheet" href="/BTBP/resources/plugins/timepicker/bootstrap-timepicker.min.css">
		<link rel="stylesheet" href="/BTBP/resources/plugins/select2/select2.min.css">
		<link rel="stylesheet" href="/BTBP/resources/css/AdminLTE.min.css">
		<link rel="stylesheet" href="/BTBP/resources/css/skins/_all-skins.min.css">
		<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
		<script src="/BTBP/resources/js/bootstrap.min.js"></script>
		<script src="/BTBP/resources/plugins/select2/select2.full.min.js"></script>
		<script src="/BTBP/resources/plugins/input-mask/jquery.inputmask.js"></script>
		<script src="/BTBP/resources/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
		<script src="/BTBP/resources/plugins/input-mask/jquery.inputmask.extensions.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
		<script src="/BTBP/resources/plugins/daterangepicker/daterangepicker.js"></script>
		<script src="/BTBP/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
		<script src="/BTBP/resources/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
		<script src="/BTBP/resources/plugins/timepicker/bootstrap-timepicker.min.js"></script>
		<script src="/BTBP/resources/plugins/iCheck/icheck.min.js"></script>
		<script src="/BTBP/resources/plugins/fastclick/fastclick.js"></script>
		<script src="/BTBP/resources/js/app.min.js"></script>
		<script src="/BTBP/resources/js/demo.js"></script>
		<script type="text/javascript" src="/BTBP/resources/js/jquery-ui-1.9.2.custom.js"></script>
		<style type="text/css">
			@import url('https://fonts.googleapis.com/earlyaccess/hanna.css');
			*{font-family: 'Hanna', sans-serif;}
			td{
				text-align: center;
				padding: 10px;
				border: 1px solid #EAEAEA;
			}
			.title{
				background-color: #D9E5FF;
				font-weight: bold;
			}
			#serviceInfo{
				color: red;
			}
			.jobTd{
				
			}
			.today{
				background-color: #FAF4C0;
			}
		</style>
		<script>
			$(function(){
				$('li').removeClass('active');
				$('#ProjectTool').addClass('active');
				
				//Date picker
			    $('.datepicker').datepicker({
			      autoclose: true
			    });
			});
		</script>
	</head>
	<body class="hold-transition skin-purple sidebar-mini">
		<div class="wrapper">
			<%@include file="header.jsp" %>
			<%@include file="menu.jsp" %>
			<div class="content-wrapper">
			    <section class="content-header"></section>
			    <section class="content">
		        	<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title"><i class="fa fa-tasks"></i>&nbsp;간트 차트 (등록된 업무 수 : ${jList.size()}) <small id="serviceInfo">* 간트차트는 프로젝트 기간 동안의 업무만 표시됩니다.</small></h3>
							<div align="right">
								<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">업무 등록 +</button>
							</div>
		                </div>
			                
		                <div class="box-body no-padding">
							<div style="white-space:nowrap; overflow:auto; width:1220px; height:550px; margin-left: 20px;">
								<table>
									<tr>
										<td class="title">업무명</td>
										<td class="title">업무 시작일</td>
										<td class="title">업무 종료일</td>
										<td class="title">진행률</td>
										<c:forEach var="pDate" items="${pDate }">
											<c:choose>
												<c:when test="${pDate == today }">
													<td class="today title">${pDate }</td>
												</c:when>
												<c:otherwise>
													<td class="title">${pDate }</td>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</tr>
									<c:choose>
										<c:when test="${!jList.isEmpty() }">
											<c:forEach var="JobVO" items="${jList }">
											
												<fmt:parseDate value="${JobVO.startDate }" var="strPlanDate" pattern="yyyy-MM-dd"/>
												<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
												<fmt:parseDate value="${JobVO.endDate }" var="endPlanDate" pattern="yyyy-MM-dd"/>
												<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
												<fmt:parseDate value="${today }" var="todayPlanDate" pattern="yyyy-MM-dd"/>
												<fmt:parseNumber value="${todayPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="toDate"></fmt:parseNumber>					
												
												<tr>
													<td><a href="JobInfo.do?jobNo=${JobVO.jobNo }">${JobVO.jobTitle }</a></td>
													<td>${JobVO.startDate }</td>
													<td>${JobVO.endDate }</td>
													<td>
														<c:choose>
															<c:when test="${(toDate-strDate)/(endDate - strDate)*100 < 0 }">
																<span class="badge bg-green">0%</span>
															</c:when>
															<c:when test="${(toDate-strDate)/(endDate - strDate)*100 < 25 }">
																<span class="badge bg-green"><fmt:formatNumber value="${(toDate-strDate)/(endDate - strDate)*100}" pattern="0" />%</span>
															</c:when>
															<c:when test="${(toDate-strDate)/(endDate - strDate)*100 < 50 }">
																<span class="badge bg-blue" ><fmt:formatNumber value="${(toDate-strDate)/(endDate - strDate)*100}" pattern="0" />%</span>
															</c:when>
															<c:when test="${(toDate-strDate)/(endDate - strDate)*100 < 75 }">
																<span class="badge bg-yellow" ><fmt:formatNumber value="${(toDate-strDate)/(endDate - strDate)*100}" pattern="0" />%</span>
															</c:when>
															<c:when test="${(toDate-strDate)/(endDate - strDate)*100 < 100 }">
																<span class="badge bg-red" ><fmt:formatNumber value="${(toDate-strDate)/(endDate - strDate)*100}" pattern="0" />%</span>
															</c:when>
															<c:when test="${(toDate-strDate)/(endDate - strDate)*100 >= 100 }">
																<span class="badge bg-red" >100%</span>
															</c:when>
														</c:choose>
													</td>
													
													<c:forEach var="pDate" items="${pDate }">
														<c:choose>
															
															<c:when test="${pDate >= JobVO.startDate && pDate <= JobVO.endDate}">
																<c:choose>
																	
																	<c:when test="${pDate < JobVO.endDate }">
																		<% tdCnt++; %>
																	</c:when>
																	
																	<c:when test="${pDate == JobVO.endDate }">
																		<% tdCnt++; %>
																		<td colspan="<%=tdCnt%>">
																			
																			<div class="progress progress-xs progress-striped active" style="width: 100%; margin-top: 15px;">
																				<c:choose>
																					<c:when test="${(toDate-strDate)/(endDate - strDate)*100 < 25 }">
																						<div class="progress-bar progress-bar-success" style="width: ${(toDate-strDate)/(endDate - strDate)*100 }%"></div>
																					</c:when>
																					<c:when test="${(toDate-strDate)/(endDate - strDate)*100 < 50 }">
																						<div class="progress-bar progress-bar-primary" style="width: ${(toDate-strDate)/(endDate - strDate)*100 }%"></div>
																					</c:when>
																					<c:when test="${(toDate-strDate)/(endDate - strDate)*100 < 75 }">
																						<div class="progress-bar progress-bar-warning"  style="width: ${(toDate-strDate)/(endDate - strDate)*100 }%"></div>
																					</c:when>
																					<c:otherwise>
																						<div class="progress-bar progress-bar-danger"  style="width: ${(toDate-strDate)/(endDate - strDate)*100 }%"></div>
																					</c:otherwise>
																				</c:choose>											                      	
														                    </div>
														                    
																		</td>
																	</c:when>
																	
																	<c:otherwise>
																		<td></td>
																	</c:otherwise>
																	
																</c:choose>
															</c:when>
															
															<c:otherwise>
																<td><% tdCnt=0; %></td>
															</c:otherwise>
															
														</c:choose>
													</c:forEach>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td>등록된 업무가 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</table>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
		<%@include file="footer.jsp" %>
		<div class="control-sidebar-bg"></div>
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
			    <div class="modal-content">
				    <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					    <h4 class="modal-title" id="myModalLabel">간트차트 업무 등록</h4>
				    </div>
					<form id="frm" action="jobInsert.do" method="post" class="form-horizontal">
						<div class="modal-body">
					      	<div class="form-group">
				                <label>업무명</label>
					                <div class="input-group">
						                <div class="input-group-addon">
											<i class="glyphicon glyphicon-pencil"></i>
						                </div>
					                <input type="text" name="jobTitle" class="form-control pull-right">
				                </div>
				            </div>
				            <div class="form-group">
				            	<label>업무 시작일</label>
				                <div class="input-group">
					                <div class="input-group-addon">
					                	<i class="fa fa-calendar"></i>
					                </div>
				                	<input type="text" name="startDate" class="form-control pull-right datepicker">
				                </div>
				            </div>
			                <div class="form-group">
				                <label>업무 종료일</label>
				                <div class="input-group">
					                <div class="input-group-addon">
					                	<i class="fa fa-calendar"></i>
					                </div>
					                <input type="text" name="endDate" class="form-control pull-right datepicker">
					            </div>
				            </div>
				            <div class="form-group">
				            	<label>업무 내용</label>
				                <div class="input-group">
				                	<div class="input-group-addon">
				                    	<i class="glyphicon glyphicon-text-size"></i>
				                    </div>
				                    <textarea class="form-control pull-right" id="jobContent" name="jobContent"  rows="4"></textarea>
									<input type="hidden" name="jobStatus" id="jobStatus" value="0">
									<input type="hidden" name="jobType" value="gantt" >
				                </div>
				            </div>
						</div>
				        <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					        <button type="submit" class="btn btn-warning">저장</button>
				        </div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
