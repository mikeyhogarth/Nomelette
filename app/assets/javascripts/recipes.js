$(document).ready(function(){
	$(".cooked_on_og").on("click", function(e) {

		e.preventDefault();
		
		$link = $(this);
		var url = $link.attr("href");		
		$.post(url);
		$link.fadeOut(function(){
			$(".facebook_og_section").html("Huzzah!").fadeIn();
		});
	});		
});		
