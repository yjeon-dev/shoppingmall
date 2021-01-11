<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../css/main.css" type="text/css" />





</head>
<body>

	<%@ include file="../common/header.jsp"%>
	
	
	<form action="loginOk.jsp">
	<div id="login_container">
		
		<div id=login_title>
			<h3>로그인</h3>
		</div>
		<div id="login_main">
		<div id="login_sub_title">
			<h3><strong>LOGIN</strong></h3>
		</div>
			<div id="login_leftarea">
				<input type="text" id="login_id" name="login_id" placeholder="ID"  onKeyup="this.value=this.value.replace(/[^A-Za-z0-9]/g,'');"/><br />
				<input type="password" id="login_pw" name="login_pw" placeholder="PASSWORD"/><br />
			</div>
			<div id="login_button_div">
				<input type="submit" value="로그인"  id="login_button"/>
			</div>
				
			<div id="login_rightarea">
				<li>아이디를 잊어 버리셨나요?<a href="findId.jsp"> <strong>아이디 찾기</strong></a></li>
				<li>비밀번호를 잊어 버리셨나요?<a href="fiindPw.jsp"> <strong>비밀번호 찾기</strong></a></li>
				<li>회원으로 가입하시면 다양한 혜택이 기다리고 있어요!<a href="<%=homeURL %>/member/register.jsp"> <strong>회원가입</strong></a></li>
			</div>
		</div>
	</div>
	</form>







	<%@ include file="../common/footer.jsp"%>

</body>
</html>