<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="apple-touch-icon" sizes="76x76" href="/BTBP/resources/main/teamup-icon.png">
	<link rel="icon" href="/BTBP/resources/main/teamup-icon.png">
    <title>TeamUP 팀업 - Communication is Everything</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<!-- 2. modal css -->
<link rel="stylesheet" href="/BTBP/resources/plugins/css/modal.css">
</head>
<body>

	<div id="kpt_modal" class="sweet-alert showSweetAlert visible" 
		data-custom-class="" data-has-cancel-button="true"
		data-has-confirm-button="true" data-allow-outside-click="false"
		data-has-done-function="true" data-animation="pop" data-timer="null"
		style="display: none; margin-top: -300px; margin-right: 10px">
		<p style="display: block">
		<div>
			<!-- modal 전체 공간 차지하는 부분 -->
			<div class="box box-widget widget-user-2"
				style="width: 100%; height: 30%;">
				<!-- 이미지 넣는 부분 -->
				<div class="widget-user-header bg-white">
					<div class="widget-user-image">
						<img class="img-circle img-bordered-sm"
							src="/CPP/dist/img/user7-128x128.jpg" alt="User Avatar">
					</div>
					<!-- content body -->
					<h2 class="widget-user-username">
						<b>갓저씨<b></b>
					</h2>
					<h5 style="padding-left: 190px">project Manager</h5>
				</div>
				<!--/content body -->
				<div class="box-footer no-padding">
					<div class="col-md-13">
						<div class="box box-primary" style="overflow: auto;">
							<div class="box-body" style="width: 420px;height: 400px; padding: 0px;" >
								<div class="form-group" style="padding-left: 30px">
									<label>제목</label>
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
										<input type="text" class="form-control pull-right"
											id="reservation">
									</div>
									<!-- /.input group -->
								</div>
								<!-- /.form group -->
								<div class="form-group" id="checklist">
									<label>체크리스트 : 최대 5개까지 생성 가능</label>
									<div class="input-group">
										<span class="input-group pull-left">
											<a class="btn dynamicPlus"><i class="fa fa-plus"></i></a> 
											<a class="btn"><i class=" fa fa-check-square"></i></a>
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
									<div class="input-group check">
										<span class="input-group-addon"><i
											class="fa fa-clipboard"></i></span>
										<textarea id="kanbanContent" class="form-control"
											placeholder="세부내용" style="height: 100px;"></textarea>
									</div>									
								</div>																
								<!-- /.box-body -->
							</div>
							<div class="form-group">
								<div class="input-group pull-right">
									<a class="btn" id="close"><i class="fa fa-sign-out"></i> 취소</a>
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
							<!-- /.box -->

						</div>
						<!-- /.box-body -->
						<!-- /.box-footer -->
					</div>
				</div>
			</div>
			<!-- /.widget-user -->
		</div>
		</p>
	</div>
	<!-- 팝업 창 코딩 마지막 부분 -->

</body>
</html>