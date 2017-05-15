$("#username").focus(function() {
	$("span.a").css("display", "block");
});
$("#username").blur(function() {
	$("span.b").css("display", "none");
	$("span.a").css("display", "none");
	var x1 = document.getElementById("username").value.length;
	if(x1 < 2 || x1 > 10) {
		$("span.b").css("display", "block");
		$("#username").parent().parent()
			.removeClass()
			.addClass("form-group has-error has-feedback")
		$("#username").next().removeClass()
			.addClass("glyphicon glyphicon-remove form-control-feedback")
	} else {
		$("span.b").css("display", "none");
		$("#username").parent().parent()
			.removeClass()
			.addClass("form-group has-success has-feedback")
		$("#username").next().removeClass()
			.addClass("glyphicon glyphicon-ok form-control-feedback")
	}
});

$("#password").focus(function() {
	$("span.c").css("display", "block");
});
$("#password").blur(function() {
	$("span.c").css("display", "none");
	$("span.d").css("display", "none");
	var x2 = document.getElementById("password").value.length;
	if(x2 < 6) {
		$("span.d").css("display", "block");
		$("#password").parent().parent()
			.removeClass()
			.addClass("form-group has-error has-feedback")
		$("#password").next().removeClass()
			.addClass("glyphicon glyphicon-remove form-control-feedback")
	} else {
		$("span.d").css("display", "none");
		$("#password").parent().parent()
			.removeClass()
			.addClass("form-group has-success has-feedback")
		$("#password").next().removeClass()
			.addClass("glyphicon glyphicon-ok form-control-feedback")
	}

});

$("#re-password").focus(function() {
	$("span.e").css("display", "block");
});
$("#re-password").blur(function() {
	$("span.f").css("display", "none");
	$("span.e").css("display", "none");
	var x3 = document.getElementById("re-password").value;
	var x4 = document.getElementById("password").value;
	if(x3 != x4 || x3 == "") {
		$("span.f").css("display", "block");
		$("#re-password").parent().parent()
			.removeClass()
			.addClass("form-group has-error has-feedback")
		$("#re-password").next().removeClass()
			.addClass("glyphicon glyphicon-remove form-control-feedback")
	} else {
		$("span.f").css("display", "none");
		$("#re-password").parent().parent()
			.removeClass()
			.addClass("form-group has-success has-feedback")
		$("#re-password").next().removeClass()
			.addClass("glyphicon glyphicon-ok form-control-feedback")
	}
});