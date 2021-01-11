<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edge Living</title>
	<link rel="stylesheet" href="./css/main.css" type="text/css"/>
	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">   </script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="./js/main.js"></script>
	
	<style>
	

	.bodyDown{
		
	}
	</style>
	<script>
	$(document).ready(function () {
	    $('.bxslider').bxSlider({
	        auto: true, // 자동으로 애니메이션 시작
	        speed: 500,  // 애니메이션 속도
	        pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)
	        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
	        autoControls: true, // 시작 및 중지버튼 보여짐
	        pager: true, // 페이지 표시 보여짐
	        captions: true, // 이미지 위에 텍스트를 넣을을 수 있음
	    });
	});
		$(function(){
			var jbOffset = $("#topMenu").offset();
			console.log(jbOffset);
			$(window).scroll(function(){
				
				if($(document).scrollTop() > jbOffset.top){
					$("#topMenu").addClass("jbFixed");
					$("#contents").addClass("bodyDown");
				}else{
					$("#topMenu").removeClass("jbFixed");
				}
			});
			
		});
	
	</script>
</head>
<body>
	<%@ include file="./common/header.jsp" %>

	
<div id="contents">
		<!-- 메인 슬라이드 -->


	
		
	<%@ include file="./mainpage/imageSlide.jsp" %>
	
	<%@ include file="./mainpage/best10.jsp" %>
	<%@ include file="./mainpage/brand4.jsp" %>
	

	
	
	<%@ include file="./mainpage/new10.jsp" %>
	<%@ include file="./mainpage/recommend.jsp" %>
		

			
	
</div>
	<%@ include file="./common/footer.jsp" %>
	
</body>
</html>