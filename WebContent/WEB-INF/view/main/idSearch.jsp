<%@ page contentType="text/html; charset=UTF-8"%>

<%-- 로그인 페이지 --%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="apple-touch-icon" sizes="76x76" href="/BTBP/resources/main/teamup-icon.png">
	<link rel="icon" href="/BTBP/resources/main/teamup-icon.png">
    <title>TeamUP 팀업 - Communication is Everything</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />

	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <link href="/BTBP/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/BTBP/resources/assets/css/material-kit.css" rel="stylesheet"/>
	<link href="/BTBP/resources/assets/css/demo.css" rel="stylesheet" />
	<script src="/BTBP/resources/assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="/BTBP/resources/assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="/BTBP/resources/assets/js/material.min.js"></script>
	<script src="/BTBP/resources/assets/js/nouislider.min.js" type="text/javascript"></script>
	<script src="/BTBP/resources/assets/js/bootstrap-datepicker.js" type="text/javascript"></script>
	<script src="/BTBP/resources/assets/js/material-kit.js" type="text/javascript"></script>

</head>

<body class="signup-page">
	<nav class="navbar navbar-transparent navbar-absolute">
    	<div class="container">
        	<!-- Brand and toggle get grouped for better mobile display -->
        	<div class="navbar-header">
        		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example">
            		<span class="sr-only">Toggle navigation</span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
        		</button>
        		<a class="navbar-brand" href="main.do">TeamUP</a>
        	</div>

        	<div class="collapse navbar-collapse" id="navigation-example">
        		<ul class="nav navbar-nav navbar-right">
					<li>
						<a href="MemberLoginPage.do" >로그인</a>
					</li>
					<li>
						<a href='MemberSavePage.do' 
								onclick="window.name='MemberSavePage.do';window.open(this.href, 'join',
                   				 'width=770,height=580, left=350, top=30');return false;">
						회원가입</a>
					</li>
        		</ul>
        	</div>
    	</div>
    </nav>

    <div class="wrapper">
		<div class="header header-filter" style="background-image: url('/BTBP/resources/images/login_bg.png'); background-size: cover; background-position: top center;">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
						<div class="card card-signup">
							<form class="form" method="post" action="idSearch.do">
								<div class="header header-primary text-center">
									<h4>아이디 찾기</h4>
								</div>
								<p class="text-divider"><font color="red">${result}</font></p>
								<div class="content">
									<input type="hidden" name="page" value="search">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">face</i>
										</span>
										<input type="text" class="form-control" id="memberName" name="memberName" placeholder="이름">
									</div>
									
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">email</i>
										</span>
										<input type="email" class="form-control" id="memberEmail" name="memberEmail" placeholder="이메일">
									</div>

								</div>
								<div class="footer text-center">
									<button class="btn btn-simple btn-primary btn-lg">아이디 찾기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
    
    
</body>
</html>
