<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String project = "/CPP/"; %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fmt" %>
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
		<link rel="stylesheet" href="/BTBP/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
		<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
		<script src="/BTBP/resources/plugins/bootstrap/bootstrap.min.js"></script>
		<script src="/BTBP/resources/plugins/app/app.min.js"></script>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<script src="/BTBP/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
		<style>
			@import url('https://fonts.googleapis.com/earlyaccess/hanna.css');
			*{font-family: 'Hanna', sans-serif;}
		</style>
		<script>
		$(function () {
		    // 파일 저장 완료
			$("#save").click(function(){
				
				if($("#FileName").val() == ""){
					$("#FileName").focus();
					alert("파일 이름을 입력해 주세요!")
					
					return; 
				}
		// 		if($("#FileContent").val() == ""){
		// 			$("#FileContent").focus();
		// 			alert("세부 사항을 입력해 주세요!")
					
		// 			return; 
		// 		}
				if($("#file").val() == ""){
					alert("파일을 선택해 주세요!")
					return;
				}
				
				$("#frm").submit();
			});
			 
			// 파일 저장 취소 
			$('#WriteCancel').click(function(){
			    	
		// 	alert('${status}'+"/"+${pageNo})  
			    	 	
			location.href="FileShare.do?boardType=${status}&pageNo=${pageNo}"; 
			});		
			
		    //Add text editor
		    $("#compose-textarea").wysihtml5();
			
		});
		</script> 
		
		<style type="text/css">
			th, td {
				text-align: center;
			}	
			a { 
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
			.pad {
		    padding: 1px;
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
		
			<%@include file="header.jsp" %>
			<%@include file="menu.jsp" %>
			
			<div class="content-wrapper">
				<section class="content-header">
				    <h1>
				     	 파일 공유
				    	<small>팀원들과의 파일 공유</small>
				    </h1>
			        <ol class="breadcrumb">
				        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
				        <li class="active">Here</li>
			        </ol>
			    </section>
			
			    <section class="content">
				    <div class="row">
						<div class="col-md-11">
							<div class="box box-solid">
								<div class="box box-primary">
						            <div class="box-header with-border">
						            	<h4 class="box-title">파일 공유</h4>
						            </div>
			           
			            			<div class="box-body">
							            <form action="fileShareInsertCheck.do?boardType=${status }&pageNo=${pageNo}" id="frm" method="post" enctype="multipart/form-data"> 
								        	<div class="form-group">
								            	<input class="form-control" id="FileName" name="boardTitle" placeholder="파일 이름 입력...">
								            </div>
								              
								            <div class="form-group">
								            	<div class="box-body pad">
								                    <textarea id="compose-textarea" id="FileContent" name="boardContent" class="form-control" style="height: 300px" placeholder="세부사항 입력..."></textarea>
								              	</div>
								           	</div>	
								              
							                <div class="form-group">
											 	 <label for="file">파일 업로드</label> 
											 	 <input type="file" id="file" name="file">
										    </div>
											   
							            </form>
			            			</div>
									<div class="box-footer">
										<div class="pull-right">
							               <button type="button" id="save" class="btn btn-primary">
							               		<i class="fa fa-check"></i> 등록
							               </button>
											<button type="button" id="WriteCancel" class="btn btn-danger">
												<span class="glyphicon glyphicon-remove"></span> 취소
											</button>
										</div>            
									</div>
			          			</div>
			        		</div>
			      		</div>
			      	</div>
			    </section>
			</div>
			<footer class="main-footer">
				<div class="pull-right hidden-xs">
					Anything you want
				</div>
				<strong>CPP(Communication plus project) &copy; 2016&nbsp; <a href="#"> Company</a>.</strong> All rights reserved.
			</footer>
		
		    <aside class="control-sidebar control-sidebar-dark">
			    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				    <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-users"></i></a></li>
				    <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-wechat"></i></a></li>
			    </ul>
		    	<div class="tab-content">
		      		<div class="tab-pane active" id="control-sidebar-home-tab">
				        <h3 class="control-sidebar-heading">Recent Activity</h3>
				        <ul class="control-sidebar-menu">
			          		<li>
					            <a href="javascript::;">
					              <i class="menu-icon fa fa-birthday-cake bg-red"></i>
					              <div class="menu-info">
						              <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
						              <p>Will be 23 on April 24th</p>
					              </div>
					            </a>
					        </li>
			        	</ul>
				        <h3 class="control-sidebar-heading">Tasks Progress</h3>
				        <ul class="control-sidebar-menu">
					        <li>
						        <a href="javascript::;">
							        <h4 class="control-sidebar-subheading">
								        Custom Template Design
								        <span class="pull-right-container">
								        <span class="label label-danger pull-right">70%</span>
								        </span>
							        </h4>
							
							        <div class="progress progress-xxs">
							        	<div class="progress-bar progress-bar-danger" style="width: 70%"></div>
							        </div>
						        </a>
					        </li>
				        </ul>
					</div>
					<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
					<div class="tab-pane" id="control-sidebar-settings-tab">
						<form method="post">
							<h3 class="control-sidebar-heading">General Settings</h3>
							
							<div class="form-group">
								<label class="control-sidebar-subheading">
									Report panel usage
									<input type="checkbox" class="pull-right" checked>
								</label>
							<p>
							</p>
						</div>
						</form>
					</div>
				</div>
			</aside>
			<div class="control-sidebar-bg"></div>
		</div>
	</body>
</html>