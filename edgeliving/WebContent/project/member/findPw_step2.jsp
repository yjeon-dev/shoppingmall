<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/httpRequest.js"></script>
<link rel="stylesheet" href="../css/main.css" type="text/css" />
<script>

	
	
		
	
		
		<%-- var pw = <%=session.getAttribute("pw")%>
		pw = document.getElementById("showPw").innerText; --%>	
		
		
		
	
	
	
	
	


</script>
<style>
h3,ul{
	margin-top:0px;
	margin-left: 10px;
}
#findPw_container{
	margin: 0px auto;
	
	height: 300px;
	width: 1000px;
	border: 1px solid black;
	background: #f5f5f5;
	border-radius: 10px;
}
#findPw_title{
	width: 100%;
	border-bottom: 1px solid darkgray;
	background: #e2e2e2;
	border-radius: 10px;
}
#findPw_sub_title{
	margin-left:150px;
}
#findPw__main{
padding-left:250px;
}
#findPw_info{
	display: inline-block;
}
#findPw_confirm_button_div{
	display: inline-block;
}
#findPw_confirm_button{
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
#findPw_confirm_button:hover{
	background: #FFFAFA;
   color: black;
}
#userkey_div{
 	padding-left:120px;
}
#findPw_confirm_button{
	margin-left:10px;
	
}
#findPw_code_button{
margin-left: 40px;
    width: 100px;
    background: #222222;
    color: white;
    border-radius: 8px;
}
#findPw_code_button:hover{
background: #FFFAFA;
   color: black;
}
#showPw_p_div{
	padding-left: 80px;
}
</style>
</head>

<% 
		Object findPw_step2obj = session.getAttribute("id"); 
		MemberVO pw = null;
		if(findPw_step2obj!=null){
			String id = (String)findPw_step2obj;
			System.out.println(id);
			MemberDAO dao = new MemberDAO();
			pw = dao.sendPw(id);
			System.out.println(pw.getPw());
		}
		%>
<body>

	<%@ include file="../common/header.jsp"%>

	<div id="findPw_container">

		<div id="findPw_title">
			<h3>비밀번호 찾기</h3>
			<ul>
				<li>가입하신 아이디와 이메일을 기입해 주시면 아이디 찾기가 가능합니다.</li>
			</ul>
		</div>
		<div id="findPw__main">
			<div id="findPw_sub_title">
				<h3><strong>비밀번호 찾기</strong></h3>
			</div>
			<div>
				<div id="findPw_info">
				<ul>
					<p><strong>아이디 :</strong>&nbsp&nbsp<input type="text" name="findPw_id" id="findPw_id" value="" /></p>
					<p><strong>이메일 :</strong>&nbsp&nbsp<input type="text" name="findPw_email" id="findPw_email" value=""/></p>
					</ul>
				</div>
				<div id="findPw_confirm_button_div">
					<input type="button" id="findPw_confirm_button" value="확인" onclick="sendCode()" />
				</div>
				<div id="userkey_div">
					<input type="text" name="" id="userkey" placeholder="코드를 입력하세요"/>
					<input type="submit" id="findPw_code_button" value="코드확인" onclick="codeCheck()" />
				</div>
				<div id="showPw_p_div">
					<p id="showPw_p" >회원님의 비빌번호는 : <%=pw.getPw() %> 입니다.</p>
				</div>
			</div>
		</div>
	</div>






	<%@ include file="../common/footer.jsp"%>
</html>
</body>