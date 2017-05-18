
jQuery(document).ready(function(){
	jQuery(".dataGrid tr:even").addClass("even");
	/*$('.dataGrid tr').each( function() {
		var row = $(this);
		row.hover(
			function() {
				setTimeout( function() { row.addClass('over'); }, 0 );
			},
			function() {
				setTimeout( function() { row.removeClass('over'); }, 0 );
			}
		);
	});*/
	/*$(".dataGrid tr").mouseover(function() {$(this).addClass("over");}).mouseout(function() {$(this).removeClass("over");});*/
	/*$(".dataGrid th").mouseover(function() {$(this).addClass("over");}).mouseout(function() {$(this).removeClass("over");});*/

});