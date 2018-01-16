/*jslint white: true, browser: true, undef: true, nomen: true, eqeqeq: true, plusplus: false, bitwise: true, regexp: true, strict: true, newcap: true, immed: true, maxerr: 14 */
/*global window: false, REDIPS: true */

/* enable strict mode */
"use strict";

// define init and show methods
var redipsInit,
//	showContent,
	getContent;

// redips initialization
redipsInit = function () {
	var num = 0,			// 성공적으로 놓여진 요소들의 숫자
		rd = REDIPS.drag;	// REDIPS.drag lib 를 참조
	// initialization
	rd.init();
	// hover가 되었을 시의 색깔 지정
	rd.hover.colorTd = '#9BB3DA';
	// init 시의 showContent 함수를 호출
//	showContent();
	// drop을 했을 시에 content를 초기화
	rd.event.dropped = function () {
//		showContent();
	};
	// DIV의 요소들이 삭제 될 때 마다 showContent 함수를 호출
	rd.event.deleted = function () {
//		showContent();
	};
};


// TD content들을 보기 위한 코딩 부분
//showContent = function () {
//	// 오른쪽 테이블의 TD 내용을 보기 위한 코딩 부분
//	var td1 = getContent('td1'),
//		td2 = getContent('td2'),
//		td3 = getContent('td3'),
//		td4 = getContent('td4'),
//		//밑에다가 innerHTML로 화면에다가 찍어줌
//		message = document.getElementById('message');
//	// show block content
//	message.innerHTML = 'td1 = ' + td1 + '<br>' +
//						'td2 = ' + td2 + '<br>' +
//						'td3 = ' + td3 + '<br>' +
//						'td4 = ' + td4;
//};
//

// content 가져오기 (TD 안에 있는 DIV 요소들)
getContent = function (id) {
	var td = document.getElementById(id),
		content = '',
		cn, i;
	// TD는 많은 DIV 요소들을 가질 수 있음
	for (i = 0; i < td.childNodes.length; i++) {
		// set reference to the child node
		cn = td.childNodes[i];
		// childNode 들은 반드시 drag 라는 class 이름과 DIV 를 가지고 있어야 함
		if (cn.nodeName === 'DIV' && cn.className.indexOf('drag') > -1) { // and yes, it should be uppercase
			// append DIV id to the result string
			content += cn.id + '_';
		}
	}
	// cut last '_' from string
	content = content.substring(0, content.length - 1);
	// return result
	return content;
};


// add onload event listener
if (window.addEventListener) {
	window.addEventListener('load', redipsInit, false);
}
else if (window.attachEvent) {
	window.attachEvent('onload', redipsInit);
}
