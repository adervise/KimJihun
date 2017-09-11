$(function(){				
	/**
	 @ window 창 높이값을 컨텐츠에 적용 ( 높이값 - nHeader 높이값 )
	**/
	winHeight();
	$(window).resize(function(){winHeight();});
	/**
	 @ 사이드 메뉴 스크롤
	**/
	$(window).resize(function(){
		$("#nSnb").height( $("body").outerHeight() - 46 );
	});
	$("#nSnb").height( $("body").outerHeight() - 46 );
	/*$("#nSnb").mCustomScrollbar({
		autoHideScrollbar:true,
		autoDraggerLength:true,
		advanced:{
        	updateOnBrowserResize: true,
    		updateOnContentResize: true
    	}
	});*/
});
/**
 @ window 창 높이값을 컨텐츠에 적용 ( 높이값 - nHeader 높이값 )
**/
function winHeight(){
	if ($(window).height() > 600){
		$("#nContent").css("min-height" , $(window).height()-66);
	}
}

/**
 @ 레이어 영역
**/
var is_mask_run = false;

$(window).resize(function() {if(is_mask_run){modalWindow();}});
$(window).scroll(function() {if(is_mask_run){modalWindow();}});

/**
 @ // 레이어 영역
**/


$(function(){
	//calendar
	$( ".date" ).datepicker()

});
// modal_공통
function layerClose(id)
{
	if (!id) {
		$('#layerMask').hide();
		$('#layerWrap,.layerWrap').hide();

	} else {
		$('#layerMask').hide();
		$('.layerWrap,#' + id).hide();
	}

	document.location.href = "index.jsp";
}
function popResizing(){
	var dial_width =$('#layerWrap').width();
	var dial_height = $('#layerWrap').height();
	var winH = $(window).height();
	var winW = $(window).width();

	$('#layerWrap').css({'width':dial_width,'height':dial_height});
	if (dial_height > $(window).height()){
		//$('#'+id).css('top', 50);
		$('#layerWrap').css({"top":50,"height":dial_height/2});
		$('#layerWrap').find(".board_list").css({"height":dial_height/2-150,"overflow-y":"scroll"});
	}
	else
	$('#layerWrap').css('top', dial_height/2);
	$('#layerWrap').css('left', winW/2-dial_width/2);
};
//layer
function changelayer(target)
{
    $("#layerWrap").html('');
    jQuery.ajax({
        url: target,
        type: "post",
        success: function (result) {
            $("#layerWrap").html(result);
            $("#layerWrap").find("script").each(function (i) {
                eval($(this).text());
            });
        },
        error: function (result) {
            alert("Error");
        }
    });
}
function initLayer(target) { //팝업열기버튼 온클릭으로 호출
    var maskHeight = $(document).height();
	var maskWidth = $(window).width();
	$('#layerMask').css({'width':maskWidth,'height':maskHeight});
	// 마스크 effect
	$('#layerMask').fadeTo("slow",0.8);
    jQuery.ajax({
        url: target,
        type: "post",
        success: function (result) {
            $("#layerWrap").html(result);
            /*$("#layerWrap").find("script").each(function (i) {
                eval($(this).text());
            });*/
			popResizing();
			$("#layerWrap").show();
        },
        error: function (result) {
            alert("Error");
        }
    });

    return false;
};
