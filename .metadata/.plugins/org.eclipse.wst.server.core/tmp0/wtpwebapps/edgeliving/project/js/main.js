/**
 * 
 */
	$(function(){
			var jbOffset = $("#topMenu").offset();
			console.log(jbOffset);
			$(window).scroll(function(){
				
				if($(document).scrollTop() > jbOffset.top){
					$("#topMenu").addClass("jbFixed");
					//$("#contents").addClass("bodyDown");
				}else{
					$("#topMenu").removeClass("jbFixed");
				}
			});
			
			
			
			
		});