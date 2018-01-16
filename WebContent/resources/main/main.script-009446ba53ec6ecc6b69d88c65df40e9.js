$(function(){
	$(".m_menu,.btn_close").click(function() {
		$(".util_box").show();
		$(".btn_close").show();
	})
	$(".btn_close").click(function() {
		$(".util_box").hide();
		$(".btn_close").hide();
	})
	$(".terms_of_use p a").click(function() {
		$(this).toggleClass("on");
		$(this).parents().next(".terms_of_use_txt").toggle()
	})
	$(".select").each(function(i) {
		$(this).find(".s_default").click(function(e) {
			e.preventDefault();
			$(".select:not(:eq(" + i + "))").removeClass("show");
			$(this).parent().toggleClass("show");
		})
	});
	$("span.checkbox > input[type=checkbox]").change(function() {
		var chked = $(this).prop("checked");
		if (chked) {
			$(this).parents(".checkbox, tr, li").addClass("checked");
		} else {
			$(this).parents(".checkbox, tr, li").removeClass("checked");
		}
	});
	
	$(".header .util_menu a.btn_login, .header .login_box .btn_close2").click(function(e){
        e.preventDefault();
        $(".header_popup").toggleClass("loginon");
    })
    $(document).bind("click",function(e){
        if(!$(e.target).parents().hasClass("header_popup")){
            $(".header header_popup").removeClass("loginon");
        }
    })
	
	$(".list_dotmenu").click(function(){
        $(".dot_menu").toggleClass("on")
			$(".list_dotmenu").toggleClass("on")
			$(".body_bg").toggle();
    })
    $(".dot_menu ul li a").click(function(){
        $(".list_dotmenu").next(".dot_menu").toggleClass("on")
			$(".list_dotmenu").toggleClass("on")
			$(".body_bg").hide();
    })
    $('.body_bg').click( function() {
			$(".list_dotmenu,.dot_menu,.id_list_wrap,.array li ul,.id_list_icon").removeClass("on")
			$(".select.sel_m.show").removeClass("show")
			$(".body_bg").hide()
        });
    $(document).bind("click",function(e){
        if(!$(e.target).parents().hasClass("util_menu")){
            $(".header .util_menu").removeClass("loginon");
        }
    })
	$(".select li a").click(function(e) {
		e.preventDefault();
		$(this).parents(".select").removeClass("show").find(".s_default").text($(this).text());
		
	}).focusin(function() {
		$(this).parents(".seelct").find(".s_default").text($(this).text());
		$(this).parents("ul").find("a").removeClass("on");
		$(this).addClass("on");		
	}).focusout(function() {
		$(this).removeClass("on");
	}).keydown(function(event) {
		if (event.keyCode == 9) {
			event.preventDefault();
			$(this).parents("ul").prev("a").focus();
			$(this).parents(".select").removeClass("show");
		}
	}).hover(function() {
		$(this).addClass("on").parent().siblings().children().removeClass("on");
	}, function() {
		$(this).removeClass("on");
	});
	$(".select").keydown(function(event) {
		var ct = $(this).find(".s_default").text();
		var cf;
		var ols = $(this).find("ul li").length;
		$(this).find("ul li").each(function(i) {
			if ($(this).find("a").text() == ct) {
				cf = i;
			}
		})
		if (event.keyCode == 40 && cf + 1 != ols) {
			//down
			event.preventDefault();
			cf++;
			var moveTxt = $(this).find("ul li:eq(" + cf + ") a").text();
			$(this).find(".s_default").text(moveTxt);
			$(this).find("ul li:eq(" + cf + ") a").focus();
		} else if (event.keyCode == 38 && cf != 0) {
			//up
			event.preventDefault();
			cf--;
			var moveTxt = $(this).find("ul li:eq(" + cf + ") a").text();
			$(this).find(".s_default").text(moveTxt);
			$(this).find("ul li:eq(" + cf + ") a").focus();
		} else if (event.keyCode == 32) {
			//space
			event.preventDefault();
			$(this).addClass("show");
			$(this).find("ul li:eq(" + cf + ") a").focus();
		} else if (event.keyCode == 27) {
			//ESC
			$(this).removeClass("show");
		}
	})
	$(document).click(function(event) {
		if (!$(event.target).parents("div").is(".select.show")) {
			$(".select").removeClass("show");
		}
		if (!$(event.target).parents("div").is(".ba_wrap")) {
			$(".ba_wrap").removeClass("show");
		}
	});
})