
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료 페이지</title>
<style>
	
	img{
		width:50px;
		height:50px;
		display: block; 
		margin: 0px auto;
		margin-top:50px;
	
	}
	div{
		text-align: center;
		margin-top:10px;
		color:gray;
	}
	#registerComplete_button{
		margin: 0px auto;
		margin-top:30px;
		margin-bottom:30px;
		
	}
	#registerComplete_goHome{
		background : pink;
		width:80px;
		height:40px;
		border-radius:15px;
		font-weight:700;
		color:gray;
		
	}
	#registerComplete_goLogin{
		background : white;
		width:80px;
		height:40px;
		border-radius:15px;
		font-weight:700;
		color:gray;
	}

	
</style>
<link rel="stylesheet" href="../css/main.css" type="text/css" />
</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<%
		Object registerCompleteobj = session.getAttribute("mname");
		if(registerCompleteobj!=null){
			String mname = (String)registerCompleteobj;
		
	%>
	<img src="./image/registerComplete.png" alt="회원가입완료" />
	
	<div id="registerComplete_complete">
		<b>회원가입</b>이 완료 되었습니다.
	</div>
	
	<div id="registerComplete_thanks">
		<b><%=mname%></b>님의 회원가입을 축하합니다.
		저희 쇼핑몰을 이용해주셔서 감사합니다.
	</div>
		 
		<div id="registerComplete_button">
		<a href="../index.jsp"><input type="button" value="홈으로" id="registerComplete_goHome"/></a>
		<a href="./login.jsp"><input type="button" value="로그인" id="registerComplete_goLogin" /></a>
		</div>
	<%} %>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>