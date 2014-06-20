var baseUrl = $("meta[name='BEdita.base']").attr("content");
var webroot = $("meta[name='BEdita.webroot']").attr("content");

jQuery.fn.toggleText = function(a, b) {
	return this.each(function() {
		jQuery(this).text(jQuery(this).text() == a ? b : a);
	});
};

jQuery.fn.minimodal = function(data) {
	if (data.url == undefined) {
		return false;
	}
	var position = $(this).position();
	var modclass = "";
	if (data.modalClass != undefined) {
		modclass = data.modalClass;
	}
	
	if (!$('.minimodal').is(":visible")) {
		$(this).after("<div class='minimodal'><a class='xclose' /><div class='modalcontent " + modclass + "'></div>");
	} else {
		$(".minimodal .modalcontent").html("");
	}

	$(".minimodal").css({
		"left": "" + (position.left - 40) + "px",
		"top": "" + (position.top - 80) + "px"
	});

	$(".minimodal .modalcontent").css({
		background: "#FFF url('" + webroot + "img/loadingAnimation.gif') center no-repeat"
	}).load(data.url, data).ajaxComplete(function(){
		$(this).css("background-image", "none");
	});

	$(".minimodal").draggable({
		handle: "H1"
	});

	$(".minimodal .xclose").click(function(){
		$(this).closest('.minimodal').remove();
	});
	
};

$(document).ready(function(){
	
/*
	$(".headmenu LI").mouseover(function(){
		$(this).addClass("on");
		
	});
*/
 	$(document).pngFix(); 

	
	$(".menuP LI").hover(
	function(){
		/*var currentmenu = $(this).attr("title");
		var p = $("."+currentmenu);
		var position = p.position();
		var leftpos = position.left+'px';
		
		$("UL.subsection").css({'margin-left':leftpos});
		$("#"+currentmenu).show("fast");*/
		
		$(".subsection", this).show();
		
	},
	
	function () {
		$(".subsection", this).hide();
	});	
	
	
	$(".XXXthumb A").click(function(){
		
		var heightM = $(document).height();
		var widthM = $(document).width();
		$(".giannicontainer").show();		
		$(".overlay").show().height(heightM).fadeTo(0.5, 0.5);
		var imagesource 		= $(this).attr("rel");
		var imagetitle 			= $(this).attr("title");
		var imagedescription 	= $(this).parent().find(".thumbdescription").text();
		
		$(".bigImg").attr({src:imagesource, alt:imagetitle, width:680});
		$(".bigImgTitle").text(imagetitle);
		$(".bigImgDescription").text(imagedescription);
		
	});

	
 	$(".close").click(function () {
		$(".overlay").hide();
		$(".giannicontainer").hide();
		$("object").show();
	});
	
	
});

$(document).ready(function(){

	$('.subdocs').prependTo('.menuP');

});



