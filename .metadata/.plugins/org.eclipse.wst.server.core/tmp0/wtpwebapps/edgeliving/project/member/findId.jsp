<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/httpRequest.js"></script>
<link rel="stylesheet" href="../css/main.css" type="text/css" />
<!-- <link rel="stylesheet" href="../css/findId.css" type="text/css" /> -->
<style>
h3,li{
	margin-top:0px;
	margin-left: 5px;
	padding: 0px;
	text-align: left;
	padding-left: 0px;
}

#findId_container{
	margin: 0px auto;
	height: 300px;
	width: 1000px;
	border: 1px solid black;
	background: #f5f5f5;
	border-radius: 10px;
}
#findId_title{
	width: 100%;
	border-bottom: 1px solid darkgray;
	background: #e2e2e2;
	border-radius: 10px;
}
#findId_main{
	padding-left:250px;
}
#findId_info{
	display: inline-block;
}

#findId_confirm_button_div{
	display: inline-block;
}
#findId_confirm_button{
	display: inline-block;
	height: 80px;
    width: 100px;
    background: #222222;
    color: white;
    border-radius: 10px;
    outline: none;
    margin-top: 25px;
	position: relative;
	bottom: 15px;
	left: 30px;
}
#findId_confirm_button:hover{
	background: #FFFAFA;
   color: black;
}
#showId{
	padding-left: 50px;
	
}

</style>
<script>
	function findId_check(){
		var findId_name = document.getElementById("findId_name").value;
		var findId_email = document.getElementById("findId_email").value;
		
		var params1 = "findId_name="+encodeURIComponent(findId_name);
		var params2 = "findId_email="+encodeURIComponent(findId_email);
	
		sendRequest("findId_step1.jsp", params1+'&'+params2,callback1,"POST");
		//sendRequest("findId_step1.jsp", params2,callback2,"POST");
	}
	function callback1(){
		console.log("콜백함수1 호출됨")
				console.log(xhr.status);
		
		if(xhr.readyState==4){
			if(xhr.status==200){
				var id = document.getElementById("showId");
				id.innerHTML=xhr.responseText;
			}
		}
	}
	/* function callback2(){
		console.log("콜백함수2 호출됨")
		if(xhr.readyState==4){
			if(xhr.status==200){
				var id = document.getElementById("showId");
				id.innerHTML=xhr.responseText;
			}
		}
	} */
</script>



</head>
<body>

	<%@ include file="../common/header.jsp"%>
	
	
	<div id="findId_container">
		
		<div id="findId_title">
			<h3>아이디 찾기</h3>
			<ul>
				<li>가입하신 이메일과 이름을 기입해 주시면 아이디 찾기가 가능합니다.</li>
			</ul>
		</div>
		<div id="findId_main">
		<div id="login_sub_title" style="padding-left:150px; margin-bottom:20px; margin-top:10px;">
			<h3><strong>아이디 찾기</strong></h3>
		</div>
				<div id="findId_info">
				<ul>
					<p><strong>이름 :</strong>&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="findId_name" id="findId_name" /></p>
					<p><strong>이메일 :</strong>&nbsp&nbsp<input type="text" name="findId_email" id="findId_email" /></p>
				</ul>
				</div>
				<div id="findId_confirm_button_div">
					<input type="button" id="findId_confirm_button" value="확인" onclick="findId_check()"/>
				</div>
				<div id="showId">
					<p></p>
				</div>
				
		</div>
	</div>







	<%@ include file="../common/footer.jsp"%>

</body>
</html>