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
 	//$(document).pngFix(); 

	
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


 	gino=$(".headmenu").css("background");
	$(".toggle-menu").click(function(){
	    
	    $(this).toggleClass("open");

	    if ($(this).hasClass("open")) {
	    	
			$(".headmenu").animate({right:"+0px"});
	    	$(".headmenu *").show();
	    	$(".headmenu").css("background", gino);
	    	$(".subdocs li:nth-child(5)").hide();
	    	$(".subdocs li:nth-child(6)").hide();
	    	$(".subdocs li:nth-child(7)").hide();
	    	$(".subdocs li:nth-child(8)").hide();
	    	$(".subdocs li:nth-child(9)").hide();
	    	$(".subdocs li:nth-child(10)").hide();
	    	$(".subdocs a h1").hide();
	   }else{
	    	$(".headmenu").animate({right:"-320px"});
	    	$(".headmenu *").not(this).hide();
	    	$(".headmenu").css("background", "#e6e6e6");

	    }

	});

/*$(".toggle-menu").click(function () {
   if (!$(".headmenu").hasClass("open")) {
       $(".headmenu").animate({right:"0px"}).addClass("open");
   } else {
       $(".headmenu").animate({right:"-320px"}).removeClass("open");
   }
});*/

	/*$(window).resize(function() {
  if ($(window).width() < 2000) {
     $(".what-does-bedita iframe").hide();
  }
 else {
    $(".what-does-bedita iframe").show();
 }
});*/


$(window).resize(function() {
  if ($(window).width() < 2000) {
     $(".what-does-bedita iframe").hide();
  }
 else {
    $(".what-does-bedita iframe").show();
 }
});

	$('A[target="scroll"]').click(function(event) {
		event.preventDefault();
		var nickname = $(this).attr('rel');
		var element = $('.content-main .'+nickname);
		var offsetTop = element.offset().top;
		$('body').animate({
			scrollTop: offsetTop
		}, 500);
	})


		$("#hidden").css("display","none");
	$(".closer-look").css("padding-bottom","270px");
	$(".closer-look").css("padding-top","180px");

	display=$(".more").css("display");
	$(".more").click(function() {
	$("#hidden").css("display",display);
	$(".more").css("display","none");
	$(".closer-look").css("padding-bottom","150px");
	$(".closer-look").css("padding-top","90px");
	});


});

$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    startAt: 0,
    slideshow: false
  });
});


        



