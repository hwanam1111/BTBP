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
    <title>TeamUP 팀업 - Communication is Everything</title>
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
<div class="header alpha white">
    <span class="header_bg"></span>
    <div class="main_wrap">
        <div class="content_box">
            <h1><a href="main.do" title="TeamUP">
                <svg id="logo_teamup" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="-80 317 550 160" xml:space="preserve">
							<g class="symbol">
								<path class="st0" d="M16.2,362.2c-11,0-19.9,8.8-20.1,19.8l0,0l0,0v30.7c0,5.5-4.4,9.9-9.9,9.9s-9.9-4.6-9.9-10v-25.5l0,0v0.1
								c0-2.8-2.3-5-5.1-5s-5.1,2.2-5.1,5l0,0l0,0c0,0,0,25.4,0,25.5c0,11.1,9,20.1,20.1,20.1s20.1-9,20.1-20.1c0,0,0-27.5,0-30.5l0,0
								c0-5,4.4-9.8,9.9-9.8s9.7,4.5,9.7,9.9c0,5.4-5,9.9-10,9.9l0,0c0,0,0.2,0,0.1,0c-2.8,0-5,2.2-5,5c0,2.8,2.2,5,5,5l0,0l0,0l0,0l0,0
								v0.1c10.7-0.1,20-8.9,20-20C36.2,371.1,27.3,362.2,16.2,362.2z"/>
								<path class="st0" d="M1.3,317.4c-44.2,0-80,35.8-80,80s35.8,80,80,80s80-35.8,80-80S45.4,317.4,1.3,317.4z M1.2,467.3
								c-38.6,0-70-31.3-70-70c0-38.6,31.3-70,70-70s70,31.3,70,70S39.9,467.3,1.2,467.3z"/>
							</g>
							<g class="logotype">
								<g class="teamup">
									<path class="st0" d="M349.5,379.2c-11,0-19.9,8.9-19.9,19.9v0.1v29.3c0,2.4,2,4.4,4.4,4.4c2.1,0,3.9-1.4,4.4-3.4l0.1,0.1v-0.4V429
									l0,0v-29.9c0-6.1,4.9-11,11-11s11,4.9,11,11s-4.9,11-11,11c-0.8,0-1.7-0.1-2.5-0.3c-0.4-0.1-0.8-0.2-1.3-0.2c-2.5,0-4.5,2-4.5,4.5
									c0,2,1.4,3.8,3.2,4.3l0,0l0.2,0.1c1.6,0.4,3.2,0.6,4.8,0.6c11,0,19.9-8.9,19.9-19.9C369.4,388.1,360.5,379.2,349.5,379.2z"/>
									<path class="st0" d="M323.1,386.3c0-2.4-2-4.4-4.4-4.4c-2.2,0-4,1.5-4.4,3.6V413c0,6.1-4.9,11-11,11s-11-4.9-11-11v-26.7v-0.4
									v-0.1c0-0.1,0-0.1,0-0.2c-0.3-2.1-2.2-3.7-4.4-3.7c-2.5,0-4.4,2-4.4,4.5v26.5v0.1c0,11,8.9,19.9,19.9,19.9s19.9-8.9,19.9-19.9
									v-0.1L323.1,386.3z"/>
									<path class="st0" d="M271.7,398.3c-2.9-3.2-7.1-5.1-11.7-5.1s-8.8,2-11.7,5.1c-2.9-3.1-7.1-5.1-11.7-5.1
									c-8.8,0-15.9,7.1-15.9,15.8l0,0v19.5l0,0c0,2.3,1.9,4.2,4.2,4.2c2.3,0,4.2-1.9,4.2-4.2l0,0v-6.7V409c0-4.1,3.3-7.5,7.5-7.5
									s7.5,3.3,7.5,7.5v12.8v6.7l0,0c0,2.3,1.9,4.2,4.2,4.2l0,0c2.3,0,4.2-1.9,4.2-4.2l0,0V409l0,0l0,0c0-4.1,3.3-7.5,7.5-7.5
									c4.1,0,7.5,3.3,7.5,7.5l0,0v19.5l0,0c0,2.3,1.9,4.2,4.2,4.2c2.3,0,4.2-1.9,4.2-4.2l0,0V409C275.9,404.9,274.3,401.2,271.7,398.3z"
									/>
									<path class="st0" d="M214,413.2v-0.1c0-10.8-8.8-19.6-19.6-19.6c-10.8,0-19.6,8.8-19.6,19.6c0,10.8,8.8,19.6,19.6,19.6
									c1.6,0,3.2-0.2,4.7-0.6l0,0c1.9-0.4,3.3-2.1,3.3-4.1c0-2.3-1.9-4.2-4.2-4.2c-0.4,0-0.8,0.1-1.2,0.2c-0.8,0.2-1.7,0.3-2.6,0.3
									c-6.2,0-11.2-5-11.2-11.2s5-11.2,11.2-11.2s11.2,5,11.2,11.2l0,0l0,0l0,0v15.5l0,0v0.6l0,0c0.3,2,2,3.6,4.1,3.6
									c2.3,0,4.2-1.9,4.2-4.2c0,0,0,0,0-0.1v-15.3H214z"/>
									<path class="st0" d="M169.9,422c-1-2.1-3.6-2.9-5.6-1.9l-3,1.5c-0.1,0-0.2,0.1-0.3,0.1l-1.6,0.8c-0.1,0-0.1,0.1-0.2,0.1l-2.2,1.1
									c-0.1,0-0.2,0.1-0.3,0.1c-1.1,0.4-2.3,0.6-3.5,0.6c-6.2,0-11.3-5.1-11.3-11.3c0-6.2,5.1-11.3,11.3-11.3c1.8,0,3.4,0.4,4.9,1.1
									c0.1,0.1,3.5,2.1,1,3.3l0,0l-10,4.9c-2.1,1-3,3.5-2,5.6s3.5,3,5.6,2l11.8-5.8l0.8-0.4c4-1.9,4.4-5.2,4.4-5.2
									c1-4.9-3.3-8.9-3.9-9.4c-3.4-2.9-7.8-4.6-12.6-4.6c-10.8,0-19.6,8.8-19.6,19.6c0,7.4,4,13.8,10,17.1c2.8,1.6,6,2.5,9.4,2.5
									c0.1,0,0.2,0,0.2,0c2.7,0,5.2-0.5,7.5-1.5c0.3-0.1,0.7-0.3,1-0.4l0.2-0.1l6.3-3.1C170,426.6,170.9,424,169.9,422z"/>
									<path class="st0" d="M129.6,423.6c-0.5-1-1.3-1.7-2.2-2c-1.1-0.4-2.3-0.4-3.4,0.1l-4.1,1.8c-2.7,1.3-5,0.9-5.4,0.9
									c-4.4-1-4.6-4.7-4.6-5.3v-17.2h12.9c2.3,0,4.2-1.9,4.2-4.2s-1.9-4.2-4.2-4.2H110v-7.2l0,0c0-2.3-1.9-4.2-4.2-4.2l0,0l0,0
									c-2.3,0-4.2,1.9-4.2,4.2l0,0v32.3c0.1,1.7,0.5,3.4,0.5,3.7c2,6.9,7.2,9.3,10.7,10c1.9,0.4,3.3,0.4,3.3,0.4
									c2.4,0.2,5.1-0.6,7.5-1.5l4-2c1.4-0.7,2.2-2,2.3-3.5C130.1,425,130,424.3,129.6,423.6z"/>
								</g>

							</g>
						</svg>
                <span class="blind">TeamUP</span></a></h1>
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
            <h2>Communication is<br> Everything</h2>
            <span>성공적인 프로젝트를 위한 커뮤니케이션의 모든 것을 담다.</span>
            <div class="btn_down">
                <a href="javascript:;" class="free_down">친구 초대하기</a>
                <a href="MemberLoginPage.do" class="teamup_down">팀업 시작하기</a>
            </div>
        </div>

        <div class="users_can content" align="center">
        	<h3>TeamUP 5 Developers</h3>
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
                        <h3>TeamUP을 통해 실시간 커뮤니케이션<br>통합 환경을 경험해보세요!</h3>
                        <p class="content_txt">
                            TeamUP 그룹피드는 그룹피드의 멤버들이 자유롭게 사용하는 소통의 장입니다.<br>
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
                <h3>프로젝트에 함께할 친구를 TeamUP에 초대해 보세요</h3>
                <div class="input_box">
                	<form id="frm" action="inviteMail.do" method="post">
                    <input type="text" class="input_txt" id="inputStart" name="emailAddr" autocomplete="off" placeholder="이메일 계정을 입력해주세요.">
                    <a class="pointer btn_email ga_event" id="btn_email_bottom" data-event="join">메일 보내기</a>
                    </form>
                </div>
                <p>친구의 이메일을 입력하면 TeamUP 초대 메일이 발송 됩니다.</p>
            </div>
            
        </div>
    </div>
<div class="footer">
    <div class="main_wrap">
        <div class="foot_menu">
            <ul>
                <li><a href="#">TeamUP</a></li>
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
                <li>(주) 팀업소프트 경기도 성남시 분당구 대왕판교로 670 팀업빌딩 (우) 01004</li>
                <li>Tel 070-5039-5803</li>
                <li><a href="mailto:help@teamupsoft.com">E-mail help@teamupsoft.com</a></li>
            </ul>
        </div>
        <div class="address">
            <address>
                <span>copyright (c) <a href="https://teamup.com" >TeamUPsoft corp.</a> All rights reserved.</span>
            </address>
        </div>
    </div>
</div>
</div>


</body>
</html>