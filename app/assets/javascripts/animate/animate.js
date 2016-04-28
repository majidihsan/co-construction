var _el = $(".papersheet");

_el.click(function() {

	if (_el.hasClass("clicked")) {
		$(this).removeClass("clicked");
		$(this).parent("body").removeClass("clicked");
	} else {
		$(this).addClass("clicked");
		$(this).parent("body").addClass("clicked");
	}

});
