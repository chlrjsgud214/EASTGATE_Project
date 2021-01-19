/**
 * 
 */
$(function() {
		/*$('.gnb>li').hover(function() {
			$(this).children('ul', 'ul ul li').slideDown()
		}, function() {
			$('.gnb ul').hide()
		})
		var auto = setInterval(main_left,3000)
		var btn_name;
		$('.dir_btn button').click(function() {
			btn_name = $(this).attr('class');
			switch(btn_name) {
			case 'left_btn' : main_left(); break;
			case 'right_btn' : main_right(); 
		}
		})*/
	
		function main_left() {
			$('.slider').animate({'margin-left' : -1020}, function() {
				$(this).find('li:first-child').insertAfter($(this).find('li:last-child'));
				$(this).css('margin-left',0)
			})
		}
		function main_right() {
			$('.slider').css('margin-left',-1020);
			$('.slider li:last-child').insertBefore('.slider li:first-child')
			$('.slider').animate({'margin-left' : 0})
		}
		var n=0, pos=300;
		$('.btn button').click(function() {
			var name = $(this).attr('class')
			if(name == 'right_btn1' && n<4) {n++}
			if(name == 'left_btn1' && n>0) {n--}
		
			$('.menu').stop().animate({'margin-left' : -pos*n})
		})
})//ready