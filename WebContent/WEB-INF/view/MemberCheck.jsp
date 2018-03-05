<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String project = "/CPP/"; %>
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
		<link rel="stylesheet" href="/BTBP/resources/css/skins/skin-blue.min.css">
	  	<style>
			@import url('https://fonts.googleapis.com/earlyaccess/hanna.css');
			*{font-family: 'Hanna', sans-serif;}
		</style>
	</head>
	<body class="hold-transition skin-blue sidebar-mini">
		<div class="wrapper">
		<%@include file="header.jsp" %>
		<%@include file="menu.jsp" %>
			<div class="content-wrapper">
		    	<section class="content-header">
				    <h1>
				        CPP 프로젝트
				        <small>진행 Member</small>
				    </h1>
		      
		      		<ol class="breadcrumb">
				        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
				        <li class="active">Here</li>
			        </ol>
		    	</section>
			    <section class="content">
					<div class="row" align="right" style="padding-right: 50px;">
						<a class="btn btn-app bg-aqua">
							<i class="fa fa-user-plus" data-toggle="modal" data-target="#addMember"></i> 멤버 초대
			            </a>
					</div> 
		            <div class="col-md-12">
		            	<div class="box box-danger">
			                <div class="box-header with-border">
			                	<h3 class="box-title">Latest Members</h3>
			                </div>
			                <div class="box-body no-padding">
			                	<ul class="users-list clearfix">
				                    <li>
					                    <img src="dist/img/user1-128x128.jpg" alt="User Image">
					                    <a class="users-list-name" href="#">갓저씨</a>
					                    <span class="users-list-date">합류 날짜</span>
				                    </li>
				                    <li>
					                    <img src="dist/img/user8-128x128.jpg" alt="User Image">
					                    <a class="users-list-name" href="#">훈마스</a>
					                    <span class="users-list-date">합류 날짜</span>
				                    </li>
				                    <li>
				                    	<img src="dist/img/user7-128x128.jpg" alt="User Image">
					                    <a class="users-list-name" href="#">DK</a>
					                    <span class="users-list-date">합류 날짜</span>
				                    </li>
				                    <li>
					                    <img src="dist/img/user6-128x128.jpg" alt="User Image">
					                    <a class="users-list-name" href="#">실버로드</a>
					                    <span class="users-list-date">합류 날짜</span>
				                    </li>
				                    <li>
					                    <img src="dist/img/user2-160x160.jpg" alt="User Image">
					                    <a class="users-list-name" href="#">별콩</a>
					                    <span class="users-list-date">합류 날짜</span>
				                    </li>
				                    <li>
					                    <img src="dist/img/user5-128x128.jpg" alt="User Image">
					                    <a class="users-list-name" href="#">김경림</a>
					                    <span class="users-list-date">합류 날짜</span>
				                    </li>
				                    <li>
					                    <img src="dist/img/user4-128x128.jpg" alt="User Image">
					                    <a class="users-list-name" href="#">정영재</a>
					                    <span class="users-list-date">합류 날짜</span>
				                    </li>
				                    <li>
					                    <img src="dist/img/user3-128x128.jpg" alt="User Image">
					                    <a class="users-list-name" href="#">윤세영</a>
					                    <span class="users-list-date">합류 날짜</span>
				                    </li>
								</ul>
			                </div>
						</div>
					</div>
			    </section>
		  	</div>
		    
		    <div class="modal fade" id="addMember" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
		    		<div class="modal-content">
		    			<div class="box-header"> <!--검색 버튼  -->
		              		<h3 class="box-title">멤버 추가</h3>
						</div>
		      			<div class="modal-body">
					        <form>
						        <div class="box-tools">
					         		<label>멤버 찾기</label>
					                <div class="input-group input-group-sm" style="width: 150px;">
					                	<input type="text" name="member_search" class="form-control pull-right" placeholder="Search">
					
					               	  	<div class="input-group-btn">
					                  		<button type="button" class="btn btn-default"><i class="fa fa-search"></i></button>
					                  	</div>
					                </div>
						        </div>
								<br/>
					            <div class="form-group">
						            <label for="message-text" class="control-label">초대 메세지 내용:</label>
						            <textarea class="form-control" id="message-text"></textarea>
					            </div>
					        </form>
		      			</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary">보내기</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						</div>
		    		</div>
		  		</div>
			</div>
		</div>
		<%@include file="footer.jsp" %>
		<div class="control-sidebar-bg"></div>
		<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
		<script src="/BTBP/resources/plugins/bootstrap/bootstrap.min.js"></script>
		<script src="/BTBP/resources/js/app.min.js"></script>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	</body>
</html>
