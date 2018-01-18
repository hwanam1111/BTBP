<%@ page contentType="text/html; charset=UTF-8"%>

<%-- 최초 메인 페이지 --%>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <link rel="apple-touch-icon" sizes="76x76" href="/BTBP/resources/main/teamup-icon.png">
	<link rel="icon" href="/BTBP/resources/main/teamup-icon.png">
    <title>BTBP - Best TeamWork Best Project</title>
    <link rel="stylesheet" href="/BTBP/resources/main/main_pc-eb1df5df9278a527e575036c9ad0d9f1.css">
    <script src="/BTBP/resources/main/jquery.min-8e67452f561a3b8ee8a82fdf57672cd5.js"></script>
	<script src="/BTBP/resources/main/main.script-009446ba53ec6ecc6b69d88c65df40e9.js"></script>
	<script src="/BTBP/resources/main/require-14915ab2710f54c99545249188d8bb22.js"></script>
	<script src="/BTBP/resources/main/tmup.mainpc.min-8eb60a05a62ab267ff4adc97e969b3a3.js"></script>
	<style type="text/css">
	td{
		text-align: center;
		padding: 40px;
		font-weight: bold;
		font-size: 30px;
	}
	</style>
    <script type="text/javascript">
    $(function(){
    	$('#btn_email_bottom').click(function(){
    		if($('#inputStart').val()==""){
    			alert('이메일을 입력해주세요.');
    			$('#inputStart').focus();
    			return;
    		}
    		alert('초대 메일이 발송 되었습니다.');
    		$('#frm').submit();
    	});
    	
    	$(window).scroll(function() {
   		  var $el = $('.header');
   		  var height = $(document).scrollTop();
   		  if(height >= 680) $el.addClass('white');
   		  else $el.removeClass('white');
   		});

    	
    })
    </script>
    <script>
	$("#btn-popup-close").click(function(e){
		e.preventDefault();
		$(".layer, #bg_pop").hide();
	});
	</script>
</head>
<body>
<a href="#content" class="skip">본문 바로가기</a>
<div class="wrap main_pc">
<span class="body_bg"></span>
<div class="header alpha">
<!--     <span class="header_bg"></span> -->
    <div class="main_wrap">
        <div class="content_box">
            <a href="main.do"><img src="/BTBP/resources/main/logo.png" style="width:120px; height:75px; position:relative; bottom:15px;" /></a>
            <div class="util_menu">
                <a class="m_menu" href="javascript:;">
                    <img src="/BTBP/resources/main/m_menu-c368eef11f10966193a173020c34a22d.png" class="m_menu_w"/>
                    <img src="/BTBP/resources/main/m_menu_b-a78ab42f04c4d89eb59e705fc729ffb0.png" class="m_menu_b"/>
                </a>
                <div class="util_box">
                    <ul class="gnb">
                        <li>
                             <a href="MemberLoginPage.do" >로그인</a>
                        </li>
                        <li>
                             <a href='MemberSavePage.do' 
								onclick="window.name='MemberSavePage.do';window.open(this.href, 'join',
                   				 'width=770,height=580, left=350, top=50');return false;">
						회원가입</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>    

<div class="main_wrap" id="content">
        <span class="main_bg"></span>
        <div class='tit_txt content'>
            <h2>Best Teamwork<br> Best Project</h2>
            <span>성공적인 프로젝트를 위한 커뮤니케이션의 모든 것을 담다.</span>
            <div class="btn_down">
                <a href="javascript:;" class="free_down">친구 초대하기</a>
                <a href="MemberLoginPage.do" class="teamup_down">BTBP 시작하기</a>
            </div>
        </div>

        <div class="users_can content" align="center">
        	<h3>BTBP 5 Developers</h3>
        	<table>
        		<tr>
        			<td><img src="/BTBP/resources/upload/Members/dk.jpg" width=120px height=120px style="border-radius: 20px;"></td>
        			<td><img src="/BTBP/resources/upload/Members/dk.jpg" width=120px height=120px style="border-radius: 20px;"></td>
        			<td><img src="/BTBP/resources/upload/Members/thm.jpg" width=120px height=120px style="border-radius: 20px;"></td>
        			<td><img src="/BTBP/resources/upload/Members/북극곰의눈물.png" width=120px height=120px style="border-radius: 20px;"></td>
        			<td><img src="/BTBP/resources/upload/Members/한가인.JPG" width=120px height=120px style="border-radius: 20px;"></td>
        		</tr>
        		<tr>
        			<td>SilverLoad</td>
        			<td>DevKing</td>
        			<td>GodMan</td>
        			<td>HoonMas</td>
        			<td>Mini</td>
        		</tr>
        	</table>
        </div>

        <div class="main_content">
            <div class="content_wrap">
                <div class="content_lr">
                    <div class="content_right content_img">
                        <img src="/BTBP/resources/main/content_1-d17ad03672d386f86379441ddbc47776.jpg"/>
                    </div>
                    <div class="content_left content_text">
                        <h3>BTBP를 통해 실시간 커뮤니케이션<br>통합 환경을 경험해보세요!</h3>
                        <p class="content_txt">
                            BTBP 그룹피드는 그룹피드의 멤버들이 자유롭게 사용하는 소통의 장입니다.<br>
                            파일 첨부, 캡처, 강제 알림 등 을 활용하여, 편리하게 피드글을 작성해보세요.<br>
                            그룹 멤버간의 의견 교류와 프로젝트 자료 공유 등 피드글을 통한<br>
                            효율적인 협업을 지원합니다.
                        </p>
                        <ul>
                            <li>
                                <span class="content_icon icon_1"></span>그룹피드 생성
                                <p>누구든지 자유롭게 필요에 따라 그룹피드를 만들 수 있습니다.</p>
                            </li>
                            <li>
                                <span class="content_icon icon_2"></span>그룹피드 설정
                                <p>관리자는 설정을 변경하여 다양한 그룹피드를 만들 수 있습니다.</p>
                            </li>
                            <li>
                                <span class="content_icon icon_3"></span>멤버 초대
                                <p>그룹 피드에 함께할 동료 또는 팀을 초대하여 커뮤니케이션이 가능합니다.</p>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="content_lr">
                    <div class="content_left content_img">
                        <img src="/BTBP/resources/main/content_2-d1cbf7b5e66192a926150857a8bade28.jpg"/>
                    </div>
                    <div class="content_right content_text">
                        <h3>동료와 즉각적인 소통이 필요할 때,<br>언제든지 대화를 시작할 수 있습니다.</h3>
                        <p class="content_txt">
                            PC는 기본, 모바일까지 최적화된 메신저는 언제 어디서나 동료와 중요한 대화를<br>
                            나눌 수 있도록 편리한 소통 환경을 제공합니다. 1:1 대화는 물론, 단체까지 지원하는<br>
                            팀업 메신저를 사용하고 쾌적한 업무 환경을 만들어보세요.
                        </p>
                        <ul>
                            <li>
                                <span class="content_icon icon_4"></span>대화 시작하기
                                <p>1:1대화부터 단체대화까지 동료와 대화를 시작할 수 있습니다.</p>
                            </li>
                            <li>
                                <span class="content_icon icon_5"></span>대화 내용 검색
                                <p>동료와의 대화에서 원하는 내용을 검색하고, 확인할 수 있습니다.</p>
                            </li>
                            <li>
                                <span class="content_icon icon_6"></span>파일 공유하기
                                <p>모바일과 PC환경에서 자유롭게 파일을 미리 보고, 공유할 수 있습니다.</p>
                            </li>
                        </ul>
                    </div>

                </div>

                <div class="content_lr">
                    <div class="content_right content_img">
                        <img src="/BTBP/resources/main/content_3-bf12e3446ece29eef5df2e6aa9944fda.jpg"/>
                    </div>
                    <div class="content_left content_text">
                        <h3>사내에서 사용 중인 서비스와 연동하여<br>업무 관련 정보를 원활하게 관리할 수 있습니다.</h3>
                        <p class="content_txt">
                            사내에서 사용하던 인트라넷과 같은 사내 API, Dropbox 와 같은 각종 드라이브 서비스와  <br>
                            Trello, Redmine 등 협업관리툴을 TeamUP과 연동하여 사용해보세요. <br>
                            외부 앱 알림지원으로 업무관련 정보들간의 소통을 실시간으로 지원합니다.
                        </p>
                        <ul>
                            <li>
                                <span class="content_icon icon_7"></span>사내 API 연동
                                <p>기존에 사용하던 인트라넷 및 사내서비스와 연동 할 수 있습니다.</p>
                            </li>
                            <li>
                                <span class="content_icon icon_8"></span>외부 앱 연동 (준비중)
                                <p>각종 드라이브 서비스와 협업관리툴을 연동하여 사용해보세요.</p>
                            </li>
                            <li>
                                <span class="content_icon icon_9"></span>업무용 파일 통합
                                <p>모든 자료를 통합 관리할 수 있는 Hybrid Cloud 형태의 스토리지를 제공합니다.</p>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="content_lr">
                    <div class="content_left content_img">
                        <img src="/BTBP/resources/main/content_4-2ab74a9a721c4db342147a464ef67c57.jpg"/>
                    </div>
                    <div class="content_right content_text">
                        <h3>외부 거래처와 편리한 협업 환경을 만들어<br>함께 커뮤니케이션 할 수 있습니다.</h3>
                        <p class="content_txt">
                            우리 회사는 물론, 외부 파트업체와도 팀업을 사용해보세요. 메일 계정만 있다면,<br>
                            외부 거래처와도 편리한 협업 환경을 만들어 함께 커뮤니케이션 할 수 있습니다.
                        </p>
                        <ul>
                            <li>
                                <span class="content_icon icon_10"></span>다양한 도메인 지원
                                <p>메일 계정만 있다면 여러 개의 팀을 만들어 협업할 수 있습니다. </p>
                            </li>
                            <li>
                                <span class="content_icon icon_11"></span>팀 설정
                                <p>팀의 성격에 따라 초대 권한과 초대 가능한 도메인을 설정 가능합니다.</p>
                            </li>
                            <li>
                                <span class="content_icon icon_12"></span>초대장 보내기
                                <p>생성한 팀에서 함께 협업 할 동료에게 초대장을 전송할 수 있습니다.</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="entry_form" style="background:url('/BTBP/resources/main/w_footer-f3d5d325525db40e68a56a90905fc6e0.jpg') no-repeat;">
                <h3>프로젝트에 함께할 친구를 BTBP에 초대해 보세요</h3>
                <div class="input_box">
                	<form id="frm" action="inviteMail.do" method="post">
                    <input type="text" class="input_txt" id="inputStart" name="emailAddr" autocomplete="off" placeholder="이메일 계정을 입력해주세요.">
                    <a class="pointer btn_email ga_event" id="btn_email_bottom" data-event="join">메일 보내기</a>
                    </form>
                </div>
                <p>친구의 이메일을 입력하면 BTBP 초대 메일이 발송 됩니다.</p>
            </div>
            
        </div>
    </div>
<div class="footer">
    <div class="main_wrap">
        <div class="foot_menu">
            <ul>
                <li><a href="#">BTBP</a></li>
                <li><a href="#">주요기능</a></li>
                <li><a href="#">개발자센터</a></li>
                <li><a href="#">다운로드</a></li>
            </ul>
            <ul>
                <li><a href="#">공지사항</a></li>
                <li><a href="#">고객지원</a></li>
                <li><a href="#">서비스 이용약관</a></li>
                <li><a href="#">개인정보 취급방침</a></li>
            </ul>
            <ul class="last">
                <li>(주) BTBP소프트 경기도 성남시 분당구 대왕판교로 670 팀업빌딩 (우) 01004</li>
                <li>Tel 070-0000-0000</li>
                <li><a href="mailto:help@btbpsoft.com">E-mail help@btbpsoft.com</a></li>
            </ul>
        </div>
        <div class="address">
            <address>
                <span>copyright (c) <a href="#" >BTBPsoft corp.</a> All rights reserved.</span>
            </address>
        </div>
    </div>
</div>
</div>


</body>
</html>