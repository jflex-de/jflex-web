// keep in sync with flex.css #title
var MATERIAL_HEADER_HEIGHT = 100;

$(document).ready(function() {
    /* Material header gets sticky. */
	$(window).scroll(function() {
	    var navbar=$('#header');
	    var content=$('#content');
		if ($(this).scrollTop() > MATERIAL_HEADER_HEIGHT) {  
			navbar.addClass('material-header-collapsed');
			content.addClass('material-header-collapsed');
		} else {
			navbar.removeClass('material-header-collapsed');
			content.removeClass('material-header-collapsed');
		}
	});
});
