<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 전 비밀번호 확인 페이지</title>
<link rel="stylesheet" href="../css/main.css" type="text/css" />
<link rel="stylesheet" href="../css/myPagePwCheck.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script src="../js/httpRequest.js">
</script>
<script>
//지금 입력한 비밀번호와 db에 저장된 비밀번호가 동일한지 체크
$(function(){
	$("#OK").on("click",pwCheckup);
	
});
function pwCheckup(){
	console.log($("#myPagePwCheck_Pw").val());
	var txt = $("#myPagePwCheck_Pw").val().trim();
	<%
	Object pwCheckupobj = session.getAttribute("vo");
	
	String id = "";
	if(pwCheckupobj != null){
		MemberVO m = (MemberVO)pwCheckupobj;
		id = m.getId();
	%>
		var params = "pw="+txt+"&id=<%=id%>";
		console.log(params);
		sendRequest("pwCheckup.jsp",params,PWcallback,"GET");
	<%	
	}
	%>
}
function PWcallback(){
	if(xhr.readyState==4 && xhr.status==200){
		var msg = xhr.responseText.trim();
		var txt = $("#myPagePwCheck_Pw").val().trim();
		console.log(msg);
		if(msg=='true'){
			var url = "memberModify.jsp";
			$(location).attr('href', url);
		}
		else{
			alert("비밀번호를 정확히 입력해주세요. ");
		} 
	}
}
</script>

</head>
<body>
	<%@ include file="../common/header.jsp"%>
		<%
		Object m = session.getAttribute("vo");
		if(m==null){ 
			out.println("오류");
			response.sendRedirect("./login.jsp");
		}

		else{
			//로그인이 되어 있는 상태라면
			// 세션에 저장된 아이디를 가져와서
			// 그 아이디 해당하는 수정할 회원정보를 가져온다.
			MemberVO vo = (MemberVO)m;
	
	%>

	<div class="myPagePwCheck_path">
	<a href="../index.jsp">홈</a>>
	<strong>회원정보 수정</strong>
	</div>
	<h3 style="margin-left : 15%; margin-top : 5%;">회원정보 수정</h3>
	<div id="myPagePwCheck_div">
	<h2>비밀번호 확인</h2>
	<div id="myPagePwCheck_idname">
		<b><%=vo.getId() %></b>님의 회원정보를 안전하게 보호하기 위해
		비밀번호를 한번 더 확인해 주세요.
		<br />
		<br />
		<b>></b>비밀번호 <input type="password" name="myPagePwCheck_Pw" id="myPagePwCheck_Pw" />
		<br />
		<br />
		<input type="button" value="확인" id="OK"/>
	</div>
	
	</div>
	<%} %>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>