<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="btbp.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link rel="stylesheet" href="/BTBP/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet" href="/BTBP/resources/css/AdminLTE.min.css">
<link rel="stylesheet" href="/BTBP/resources/css/skins/_all-skins.min.css">
<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/BTBP/resources/js/bootstrap.min.js"></script>
<script src="/BTBP/resources/plugins/fastclick/fastclick.js"></script>
<script src="/BTBP/resources/js/app.min.js"></script>
<script src="/BTBP/resources/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="/BTBP/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="/BTBP/resources/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="/BTBP/resources/plugins/chartjs/Chart.min.js"></script>
<!-- <script src="/BTBP/resources/js/pages/dashboard2.js"></script> -->
<script src="/BTBP/resources/js/demo.js"></script>

<script src="http://www.playrtc.com/sdk/js/playrtc.js"></script>
  
<style>
.local-video {
	width: 100%;
	height: 100%;
}
.remote-video {
	width: 100%;
	height: 100%;
}
 </style>

<script type="text/javascript">
$(function(){
	$('li').removeClass('active');
	$('#Meeting').addClass('active');
	
	$('#calleeRemoteVideo').hide();
	$('#calleeLocalVideo').hide();
	$('#callerRemoteVideo').hide();
	$('#callerLocalVideo').hide();
	
	// 채널 생성 버튼 클릭시
	$('#createChannel').click(function(){
		$('#callerRemoteVideo').show();
		$('#callerLocalVideo').show();
		$('#calleeRemoteVideo').hide();
		$('#calleeLocalVideo').hide();
	});
	
	// 채널 입장 버튼 클릭시
	$('#connectChannelId').click(function(){
		$('#calleeRemoteVideo').show();
		$('#calleeLocalVideo').show();
		$('#callerRemoteVideo').hide();
		$('#callerLocalVideo').hide();
	});	
	
});
</script>

</head>
<body class="hold-transition skin-purple sidebar-mini">
<div class="wrapper">
<%@include file="header.jsp" %>
<%@include file="menu.jsp" %>

<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ -->




  <div class="content-wrapper">
    <section class="content-header">
    </section>

    <!-- Main content -->
    <section class="content">
      
      <div class="row">
        <div class="col-md-12">
          <div class="box box-danger">
            <div class="box-header with-border">
              <h3 class="box-title">화상 회의</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>

            <div class="box-body">
               <!-- @@@@@@@@@@@@@@@@@@@ -->
               
				    <div class="row">
				
				      <div class="col-md-6">
				        <h3>채널 만들기</h3>
				        <form class="form-inline">
				          <div class="form-group">
				            <input class="form-control" type="text" id="createChannelId"  readonly>
				          </div>
				          <button class="btn btn-success" id="createChannel">
				            <span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span> 채널 생성
				          </button>
				        </form>
				      </div>
				
				      <div class="col-md-6">
				        <h3>채널 참여</h3>
				        <form class="form-inline">
				          <div class="form-group">
				            <input class="form-control" type="text" id="connectChannelId" >
				          </div>
				          <button class="btn btn-warning" id="connectChannel">
				            <span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>채널 입장
				          </button>
				        </form>
				      </div>
				    </div>

               <!-- @@@@@@@@@@@@@@@@@@@ -->
            </div>
            
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      
      
      
       <div class="row">
        <div class="col-md-6">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">상대 화면</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
	            <video class="remote-video center-block" id="callerRemoteVideo"></video>
	            <video class="remote-video center-block" id="calleeRemoteVideo"></video>
            </div>
          </div>
		</div>
		<div class="col-md-6">
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">내 화면</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <video class="local-video pull-right" id="callerLocalVideo"></video>
              <video class="local-video pull-right" id="calleeLocalVideo"></video>
            </div>
          </div>
        </div>
      </div>
      
    </section>
</div>



<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ -->

<%@include file="footer.jsp" %>
<div class="control-sidebar-bg"></div>
</div>


<script>
    'use strict';

    var createChannelButton = document.querySelector('#createChannel');
    var createChannelId = document.querySelector('#createChannelId');
    var appCaller;

    appCaller = new PlayRTC({
      projectKey: "60ba608a-e228-4530-8711-fa38004719c1",
      localMediaTarget: "callerLocalVideo",
      remoteMediaTarget: "callerRemoteVideo"
    });

    appCaller.on('connectChannel', function(channelId) {
      createChannelId.value = channelId;
    });

    createChannelButton.addEventListener('click', function(e) {
      e.preventDefault();
      appCaller.createChannel();
    }, false);
  </script>
  <script>
    'use strict';

    var connectChannelId = document.querySelector('#connectChannelId');
    var connectChannelButton = document.querySelector('#connectChannel');
    var appCallee;

    appCallee = new PlayRTC({
      projectKey: "60ba608a-e228-4530-8711-fa38004719c1",
      localMediaTarget: "calleeLocalVideo",
      remoteMediaTarget: "calleeRemoteVideo"
    });

    connectChannelButton.addEventListener('click', function(e) {
      e.preventDefault();
      var channelId = connectChannelId.value;
      if (!channelId) { return };
      appCallee.connectChannel(channelId);
    }, false);
  </script>

</body>
</html>
