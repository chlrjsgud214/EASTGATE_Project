/**
 * 
 */
$(function() {
		$('.gnb>li').hover(function() {
			$(this).children('ul', 'ul ul').slideDown()
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
		})
	
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
})//ready