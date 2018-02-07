<%@ page contentType="text/html; charset=UTF-8"%>
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
  <link rel="stylesheet" href="/BTBP/resources/css/AdminLTE.css">
  <link rel="stylesheet" href="/BTBP/resources/css/skins/skin-purple.min.css">
  <link rel="stylesheet" href="/BTBP/resources/plugins/daterangepicker/daterangepicker.css">
<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/BTBP/resources/js/bootstrap.min.js"></script>
<script src="/BTBP/resources/js/app.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="/BTBP/resources/plugins/daterangepicker/daterangepicker.js"></script>
<script src="/BTBP/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
<script>
$(function () {
    $('#datepicker').datepicker({
      autoclose: true
    });
    $('#reservation').daterangepicker();
});
</script>
</head>
<body class="hold-transition skin-purple sidebar-mini">
<div>

  <!-- Content Wrapper. Contains page content -->
  <div>
  
     <!-- 칸반 추가 창 -->
    	<div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title">칸반 추가</h3>
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
			<div class="form-group">
                <label>제목 :</label>
			<div class="input-group">
                <span class="input-group-addon"><i class="fa fa-file-o"></i></span>
                <input type="email" class="form-control" placeholder="제목">
              </div>
              </div>

              <!-- Date range -->
              <div class="form-group" style="float: left;">
                <label>기한:</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" class="form-control pull-right" id="reservation">
                </div>
                <!-- /.input group -->
              </div>
              <!-- /.form group -->
			
				<div class="form-group">
                <label>체크리스트 :</label>
                
                  <div class="input-group">
                  <span class="input-group pull-left">
                <a class="btn"><i class="fa fa-plus"></i></a>
                 <a class="btn"><i class="fa fa-minus"></i></a>
           		 </span>
           		
                        <span class="input-group-addon">
                          <input type="checkbox">
                        </span>
                    <input type="text" class="form-control">
                  </div>
                  <!-- /input-group -->
                  
              </div>
              	
              	<div class="form-group">
                <label>세부 내용 :</label>
					<div class="input-group">
                <span class="input-group-addon"><i class="fa fa-clipboard"></i></span>
                <textarea id="kanbanContent" class="form-control" placeholder="세부내용"  style="height: 100px;"></textarea>
           		   </div>
              </div>
              
              <div class="form-group">
              <div class="input-group pull-right">
                <a class="btn"><i class="fa fa-sign-out"></i> 취소</a>
           		 </div>
           		 
           		 <div class="input-group pull-right">
                <a class="btn"><i class="fa fa-trash-o"></i> 삭제</a>
           		 </div>
           		 <div class="input-group pull-right">
                <a class="btn"><i class="fa fa-file-text"></i> 수정</a>
           		 </div>
				<div class="input-group pull-right">
                <a class="btn"><i class="fa fa-save"></i> 등록</a>
           		 </div>
           		 
              </div>
			
 

            
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

</div>

			
     <!--/칸반 추가 창  -->
     <!--==================================================================================  -->
     

  </div>
  <!-- /.content-wrapper -->
  
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 2.2.3 -->
<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/BTBP/resources/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="/BTBP/resources/js/app.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- date-range-picker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="/BTBP/resources/plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="/BTBP/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
<script>
$(function () {
    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    });
  //Date range picker
    $('#reservation').daterangepicker();


  });
</script>

</body>
</html>
