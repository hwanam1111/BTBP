<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String project = "/CPP/"; %>
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
  <div>
  
     <!-- 칸반 추가 창 -->
    	<div class="box box-primary">
            <div class="box-header" style="border-bottom:  1px solid #d2d6de; ">
              <h3 class="box-title">Mile Stone</h3>
               <div class="box-tools pull-right">
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                  <div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>
                </div>
            </div>
            
           
              </div>
            <div class="box-body">
            <div class="box-widget widget-user-header widget-user-2">
				<span class="widget-user-image">
						<img class="img-circle img-bordered-sm"
							src="/CPP/dist/img/user7-128x128.jpg" alt="User Avatar">
					</span>
					<h2 class="widget-user-username"><b>갓저씨</b></h2>
					<h5 class="widget-user-desc">project Manager</h5>
					
					<!-- content body -->
				</div>
			<br/>
			
			 <div class="box-body table-responsive no-padding">
              <table class="table table-hover" style= " valign:middle">
                <tr>
                  <th rowspan="2">상태</th>
                  <th rowspan="2">체크리스트</th>
                  <th colspan="5">점수</th>
                  <th rowspan="2">합계</th>
                </tr>
                <tr>
                <th>1</th><th>2</th><th>3</th><th>4</th><th>5</th>
                </tr>
                <tr>
                  <td>이해관계자-1(식별)</td>
                  <td class="input-group"><span class="input-group-addon">
                          <input type="checkbox">
                        </span>
                    <input type="text" class="form-control"></td>
                  <td><input type="radio" name="rdCheck1"></td>
                  <td><input type="radio" name="rdCheck1"></td>
                  <td><input type="radio" name="rdCheck1"></td>
                  <td><input type="radio" name="rdCheck1"></td>
                  <td><input type="radio" name="rdCheck1"></td>
                  <td>2점</td>
                </tr>
                 <tr>
                  <td>이해관계자-1(식별)</td>
                  <td class="input-group"><span class="input-group-addon">
                          <input type="checkbox">
                        </span>
                    <input type="text" class="form-control"></td>
                  <td><input type="radio" name="rdCheck2"></td>
                  <td><input type="radio" name="rdCheck2"></td>
                  <td><input type="radio" name="rdCheck2"></td>
                  <td><input type="radio" name="rdCheck2"></td>
                  <td><input type="radio" name="rdCheck2"></td>
                  <td>2점</td>
                </tr>
                 <tr>
                  <td>이해관계자-1(식별)</td>
                  <td class="input-group"><span class="input-group-addon">
                          <input type="checkbox">
                        </span>
                    <input type="text" class="form-control"></td>
                  <td><input type="radio" name="rdCheck3"></td>
                  <td><input type="radio" name="rdCheck3"></td>
                  <td><input type="radio" name="rdCheck3"></td>
                  <td><input type="radio" name="rdCheck3"></td>
                  <td><input type="radio" name="rdCheck3"></td>
                  <td>2점</td>
                </tr>
                 <tr>
                  <td>이해관계자-1(식별)</td>
                  <td class="input-group"><span class="input-group-addon">
                          <input type="checkbox">
                        </span>
                    <input type="text" class="form-control"></td>
                  <td><input type="radio" name="rdCheck4"></td>
                  <td><input type="radio" name="rdCheck4"></td>
                  <td><input type="radio" name="rdCheck4"></td>
                  <td><input type="radio" name="rdCheck4"></td>
                  <td><input type="radio" name="rdCheck4"></td>
                  <td>2점</td>
                </tr>
                 <tr>
                  <td>이해관계자-1(식별)</td>
                  <td class="input-group"><span class="input-group-addon">
                          <input type="checkbox">
                        </span>
                    <input type="text" class="form-control"></td>
                  <td><input type="radio" name="rdCheck5"></td>
                  <td><input type="radio" name="rdCheck5"></td>
                  <td><input type="radio" name="rdCheck5"></td>
                  <td><input type="radio" name="rdCheck5"></td>
                  <td><input type="radio" name="rdCheck5"></td>
                  <td>2점</td>
                  
                </tr>
                <tr><th colspan="2">총점</th><th colspan="5" style="text-align: right;">20</th><th colspan="1" style="text-align: left;">점</th></tr>
                
              </table>
            </div>
			
              	
              	<div class="form-group">
                <label>잘한 점 :</label>
					<div class="input-group">
                <span class="input-group-addon"><i class="fa fa-thumbs-o-up"></i></span>
                <textarea id="kanbanContent" class="form-control" placeholder="잘한 점"  style="height: 100px;"></textarea>
           		   </div>
              </div>
              
              <div class="form-group">
                <label>수정할 점 :</label>
					<div class="input-group">
                <span class="input-group-addon"><i class="fa fa-thumbs-o-down"></i></span>
                <textarea id="kanbanContent" class="form-control" placeholder="못한 점"  style="height: 100px;"></textarea>
           		   </div>
              </div>
              <div class="input-group pull-right">
                <a class="btn"><i class="fa fa-sign-out"></i> 취소</a>
           		 </div>
              <div class="form-group">
               <div class="input-group pull-right">
                <a class="btn"><i class="fa fa-file-text"></i> 수정</a>
           		 </div>
				<div class="input-group pull-right">
                <a class="btn"><i class="fa fa-save"></i> 저장</a>
           		 </div>
           		
              </div>
			
          </div>
          <!-- /.box -->
</div>
     <!--/칸반 추가 창  -->
     <!--==================================================================================  -->
     <!--마일스톤 점수 계산 Table  -->
     <!--/마일스톤 점수 계산 Table  -->
  </div>
  <!-- /.content-wrapper -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
<!-- REQUIRED JS SCRIPTS -->
<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/BTBP/resources/plugins/bootstrap/bootstrap.min.js"></script>
<script src="/BTBP/resources/plugins/app/app.min.js"></script>
</body>
</html>
