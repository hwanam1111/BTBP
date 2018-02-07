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
<script src="/BTBP/resources/js/demo.js"></script>
<script type="text/javascript">
$(function(){
	$('li').removeClass('active');
	$('#Meeting').addClass('active');
});
</script>
</head>
<body class="hold-transition skin-purple sidebar-mini">
<div class="wrapper">
<%@include file="header.jsp" %>
<%@include file="menu.jsp" %>

<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ -->

  <div class="content-wrapper">
    <section class="content-header"></section>
    <section class="content">
    
    <img src="/BTBP/resources/images/appearBg.png" id="appearBg" height="91" style="position: absolute; ">
    <iframe src="https://appear.in/BTBP_${pInfo.projectNo }" width="100%" height="650" ></iframe>
    
    </section>
  </div>



<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ -->

<%@include file="footer.jsp" %>
<div class="control-sidebar-bg"></div>
</div>
</body>
</html>
