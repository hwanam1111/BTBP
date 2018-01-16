<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="btbp.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String boardType = request.getParameter("boardType"); %>
<!DOCTYPE html>
<html>
<link rel="apple-touch-icon" sizes="76x76" href="/BTBP/resources/main/teamup-icon.png">
	<link rel="icon" href="/BTBP/resources/main/teamup-icon.png">
    <title>TeamUP 팀업 - Communication is Everything</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<link rel="stylesheet" href="/BTBP/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="/BTBP/resources/css/AdminLTE.min.css">
<link rel="stylesheet" href="/BTBP/resources/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="/BTBP/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<script src="/BTBP/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/BTBP/resources/js/bootstrap.min.js"></script>
<script src="/BTBP/resources/plugins/fastclick/fastclick.js"></script>
<script src="/BTBP/resources/js/app.min.js"></script>
<script src="/BTBP/resources/js/demo.js"></script>
<script src="https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>
<script src="/BTBP/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>


<style type="text/css">
@import url(https://fonts.googleapis.com/earlyaccess/notosanskr.css);

body,table,div,p,h1,h2,h3,h4,h5,h6 {
   font-family: 'Noto Sans KR', serif;
}
	th, td{
		text-align: center;
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
	.pad {
    padding: 1px;
    }
</style>


<script>
   $(function(){	   
	   
		$('li').removeClass('active');
		<% if(boardType.equals("board")) {%>
			$('#Board').addClass('active');
		<% } else { %>
			$('#Notice').addClass('active');
		<% } %>
	   
	    $('#WriteCancel').click(function(){
	    	
	       //alert('${status}'+"/"+${pageNo})  
	    	 	
		   location.href="ProjectBoard.do?boardType=${status}&pageNo=${pageNo}"; 
	    });

		$('#OKBtn').click(function(){
			
			if($("#TeamBoardTitle").val() == ""){
				$("#TeamBoardTitle").focus();
				alert("제목을 입력해 주세요!")
				return;
			}else if($("#TeamBoardContent").val() == ""){
				$("#TeamBoardContent").focus();
// 				alert("글 내용을 입력해 주세요!")
// 				return; 
			}		
		
			$('#frm').submit();
			alert('글이 입력 되었습니다.');

			
		});
		
		
		CKEDITOR.replace('TeamBoardContent');
		$(".textarea").wysihtml5();
		
	   
                                                                       
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
      <h1>
      팀 게시판
        <small>프로젝트 팀원들만의 게시판</small>
      </h1>
    </section>

 <!-- Main content -->
    <section class="content">
      <div class="row">
       <!-- col -->
       <div class="col-md-12">
        
         
         <div class="box box-solid">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h4 class="box-title">글 올리기</h4>
            </div>
            <!-- /.box-header -->
            
          <div class="box-body">
            <form id="frm" action="ProjectBoardWrite.do" method="post" enctype="multipart/form-data">
              	<div class="form-group">
              	  <input class="form-control" id="TeamBoardTitle" name="boardTitle" placeholder="제목...">
              	</div>
              
              	<div class="form-group">
                		<div class="box-body pad">
							<textarea id="TeamBoardContent" name="boardContent" class="form-control" placeholder="내용..." rows="10" cols="80"></textarea>
	        			</div>                    
             	 </div>
             	 
				<input type="hidden" name="boardType" value="${status }">	
			<!-- 파일 업로드 (팀 게시판) -->		
			<c:if test="${status eq 'board' }">	
				<div class="form-group">
					<label for="file">파일 업로드</label> 
					<input type="file" id="file" name="file">
				</div>
			</c:if>
			<!-- 파일 업로드 (팀 게시판) -->	
			</form>
	      </div>
            <!-- /.box-body -->
            
		<div class="box-footer">
			<div class="pull-right">
               <button type="button" id="OKBtn" class="btn btn-primary">
               		<i class="fa fa-check"></i> 저장
               </button>
              
              
				<button type="button" id="WriteCancel" class="btn btn-danger">
					<span class="glyphicon glyphicon-remove"></span> 취소
				</button>
			  
			</div>
            
		</div>
		<!-- /.box-footer -->
        </div>
        <!-- /.box box-primary -->
       </div>
       <!-- /.box box-solid -->
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
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- /.wrapper -->

</body>
</html>