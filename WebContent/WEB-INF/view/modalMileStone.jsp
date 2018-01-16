<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="btbp.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	MileStoneVO mvo = null;
	Object obj = request.getParameter("milestone");
	if(obj != null) mvo  = (MileStoneVO)obj;
%>
<!DOCTYPE html>
<html>
<head>
<link rel="apple-touch-icon" sizes="76x76" href="/BTBP/resources/main/teamup-icon.png">
	<link rel="icon" href="/BTBP/resources/main/teamup-icon.png">
    <title>TeamUP 팀업 - Communication is Everything</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
	<!--     Fonts and icons     -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
	<!-- CSS Files -->
    <link href="/BTBP/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
	<!--   Core JS Files   -->
	<script src="/BTBP/resources/assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="/BTBP/resources/assets/js/bootstrap.min.js" type="text/javascript"></script>

</head>
<style>
.tableLine li {
	border: thin;
			  }
th{
	text-align: center;
	vertical-align: middle;
}
</style>
<body>
			<div class="container" >
			<br /><br />
				<div class="row">
					<div class="box box-widget widget-user-2"
				style="width: 100%; height: 30%;">

				<!--/content body -->
				<div class="box-footer no-padding">
					<div class="col-md-13">
						<div class="box-body box-profile">
			
			<c:if test="${!mList.isEmpty()}">	
			<c:forEach var="mvo" items="${mList}">
              <h3 class="profile-username text-center"><b>${mvo.cardGroup}</b>-${mvo.cardTitle}</h3>
              <ul class="list-group list-group-unbordered" style="list-style: none;">
              <dl class="accordion">
              <c:forEach var="i" begin="0" end="11" step="1">
              <c:if test="${mvo.checkArr[i] ne null}">
                <dt class="list-group-item">
                  <div class="input-group">
                        <span class="input-group-addon">
                          <input type="checkbox" class="alpha_btn ${milestone.checkPointArr[i]}" style="display: block; width: 15px; height: 15px;">
                        </span>
                    <input type="text" class="form-control" readonly="readonly" value="${mvo.checkArr[i]}">
                  </div>
                </dt>
                <dd>
                  <table class="table table-hover tableLine" style= " valign:middle; text-align: center;">
                   <tr>
                  <th rowspan="2">상태</th>
                  <th colspan="5">점수체크</th>
                  <th rowspan="2">점수</th>
                </tr>
                <tr style="text-align: center;">
                <th>1</th><th>2</th><th>3</th><th>4</th><th>5</th>
                </tr>
                  <tr name="check${i+1}Point">
                  <td>${mvo.cardTitle}-${i+1}</td>
                  	<c:forEach var="j" begin="1" end="5" step="1">
                  		<c:choose>
                  			<c:when test="${milestone.checkPointArr[i]  eq j }">
                  			<td><input type="radio" class="radio_btn" value="${j}" checked='checked'/></td> 
                  			<input type="hidden" class="radio_btn_score" value="${j}"/>
                  			</c:when>
                  			<c:otherwise>
                  			<td><input type="radio" class="radio_btn" value="${j}"/></td> 
                  			</c:otherwise>
                  		</c:choose>
				   </c:forEach>
                  <td>점</td>
                </tr>
                </table>
                 </dd>
                </c:if>
                </c:forEach>
                </dl>
              </ul>
              </c:forEach>
			<button class="btn btn-primary pull-right" id="Insert_score">OK</button>
			</c:if>
            </div>
						<!-- /.box-body -->
						<!-- /.box-footer -->
					</div>
				</div>
			</div>
				</div>
			</div>
	
</body>
<script>
$(function(){
	
	$('.accordion').each(function(){		
	var dl=$(this);
	var allDt=dl.find('dt');
	var allDd=dl.find('dd');
	allDd.hide();
	
	allDt.css('cursor','pointer');
	
	$('.alpha_btn').each(function(){
		$(this).click(function(){
			var dt =$(this).parent().parent().parent();
			var dd = dt.next();		
			dd.slideToggle(); // toggle 이벤트 걸어주기
		})
	});

	
	for(var i=1; i<=5; i++){
		$('.'+i).prop("checked", true);
		$('.'+i).parent().parent().parent().next().show();
		}
	
	
	$('.radio_btn_score').each(function(){
		var checkedScore = $(this).val();
		$(this).parent().children('td').eq(6).text(checkedScore+"점");
	})
	
	
	});
	
	// 라디오 버튼 클릭시 화면에 점수 입력 해줌
	$('.radio_btn').each(function(){
		// 라디오 버튼 클릭시, 
		// 1. 오른쪽에 클릭한 radio_btn이 몇 점인지 화면에 보여줌
		// 2. 5개 중 하나만 체크가 되도록 설정 
		$(this).click(function(){
			var saveClick = $(this);
			$(this).parent().siblings().children().removeAttr("checked");
			$(saveClick).prop("checked", true);
			var chk = $(this).is(':checked'); // 체크가 된 값 
			if(chk){
				var checkScore = $(this).val(); 	
				$(this).parent().parent().children("td").eq(6).text(checkScore+"점");
			} 
		})
	})
	
	$('#Insert_score').click(function(){
		var checkPointArray = []; // CheckPoint의 값을 담기 위한 배열
		var cardNoArr = ""; // card_no의 값을 담기 위한 배열
		var scoreArr = []; // score 값을 담기 위한 배열
		var rowNoArr = []; // rowNo의 값을 담기 위한 배열
		
		$('.radio_btn').each(function(){
		var chk = $(this).is(':checked');
		if(chk){
				// 필요한 값 row_no, card_no, 어떤 checkPoint인지, 
				checkPointArray.push($(this).parent().parent().attr("name")) // checkPoint name
				check = $(this).parent().parent().children().eq(0).text();	// card_no
				cardNoArr =	check.split('-');
				scoreArr.push($(this).val()); // score
				rowNoArr.push(${rowNo}); // row_no
				
			}
		})
		location.href="modalMileStoneInsertCheck.do?scoreArr="+scoreArr+"&rowNoArr="+rowNoArr+"&cardNoArr="+cardNoArr[0]+"&checkPointArray="+checkPointArray;
		
	})
	
})
</script>
</html>