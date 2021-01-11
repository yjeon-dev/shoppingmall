<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 페이지</title>
<link rel="stylesheet" href="../css/main.css" type="text/css" />
<link rel="stylesheet" href="../css/memberModify.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>
<script src="../js/httpRequest.js">
</script>
<script>

	//다음주소 api
	window.onload = function(){
		var addressImg = document.getElementById("memberModify_addressImg");
		addressImg.onclick=openKaKaoPostcode;
		
		function openKaKaoPostcode(){
			new daum.Postcode({
				oncomplete:function(data){
					document.getElementById("memberModify_addNum").value=data.zonecode;
					document.getElementById("memberModify_add1").value=data.address;
				}
			}).open();
		}
	}
	
	//지금 입력한 비밀번호와 db에 저장된 비밀번호가 동일한지 체크
	$(function(){
		$("#memberModify_nowPw").on("keyup",pwCheckup);
		
	});
	function pwCheckup(){
		console.log($("#memberModify_nowPw").val());
		var txt = $("#memberModify_nowPw").val().trim();
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
			var txt = $("#memberModify_nowPw").val().trim();
			console.log(msg);
			if(msg=='true'){
				$("#memberModify_nowPwCheck").html("정확히 입력했습니다.").css("color","red").css("display","inline");
			}
			else{
				//다 잘못된 비밀번호라고 뜸
				$("#memberModify_nowPwCheck").html("잘못된 비밀번호입니다. ").css("color","red").css("display","inline");
			} 
		}
	}
</script>
<script>

	 function isSame(){
		var newPw = document.getElementById("memberModify_newPw").value;
		var newPwCheck = document.getElementById("memberModify_newPwCheck").value;
	
		//비밀번호 값이 8자~16자가 아니면
		if(newPw.length<8||newPw.length>16){
			document.getElementById("memberModify_pwlimit").innerHTML='비밀번호는 8자 이상, 16글자 이하만 가능합니다. ';
			document.getElementById("memberModify_newPw").value=document.getElementById("memberModify_newPwCheck").value='';
			document.getElementById('memberModify_same').innerHTML='';
		}
		//비밀번호 값이 8자~16자면
		else if(newPw.length>8||newPw.length<16){
			document.getElementById("memberModify_pwlimit").innerHTML='사용가능합니다. ';
			document.getElementById('memberModify_same').innerHTML='';
		}
		//새비밀번호와 새비밀번호 확인 입력값이 일치한다면
		if(document.getElementById("memberModify_newPw").value!=''&&document.getElementById("memberModify_newPwCheck").value!=''){
			if(document.getElementById("memberModify_newPw").value==document.getElementById("memberModify_newPwCheck").value){
				document.getElementById('memberModify_same').innerHTML='비밀번호가 일치합니다.';
			}
			////기존 비밀번호와 다른 비밀번호인지 확인
			else if(document.getElementById("memberModify_newPw").value==document.getElementById("memberModify_nowPw").value){
				document.getElementById('memberModify_pwlimit').innerHTML='현재 비밀번호와 다른 비밀번호를 입력해주십시오.';
				
			}
			else{
				document.getElementById('memberModify_same').innerHTML='비밀번호가 일치하지 않습니다.';
			}
		}
	}

	 
	
</script>
<script>
	//회원 탈퇴
	$(function(){
		$("#memberModify_delete").on("click",memberDelete);
	});
	function memberDelete(){
		//현재 비밀번호를 입력해야지 탈퇴가 가능함
		var nowPw = $("#memberModify_nowPw").val();
		//form ID
		var memberDelete = document.getElementById("memberModify_form");
		
		if(nowPw!=null){
			memberDelete.action="memberDelete.jsp";
			memberDelete.method="get";
			memberDelete.submit();
		}
		//입력 안했으면 alert 창 띄우기
		else{
			alert("현재 비밀번호를 입력해주세요. ");
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
	}else{
		//로그인이 되어 있는 상태라면
		// 세션에 저장된 아이디를 가져와서
		// 그 아이디 해당하는 수정할 회원정보를 가져온다.
		MemberVO vo = (MemberVO)m;

	
%>
	<div class="memberModify_path">
	<a href="../index.jsp">홈</a>>
	<strong>회원정보수정</strong>
	</div>
	
	<h3 style="margin-left : 15%; margin-top : 5%;">회원정보수정</h3>

	<div id="memberModify_info">
		<img src="./image/member_img.gif" id="memberModify_profile" alt="회원프사" />
		<span></span>
		<div id="memberModify_thanks"><b><%=vo.getMname() %></b>님 저희 쇼핑몰을 이용해주셔서 감사합니다. </div>
	</div>


	<h4 style="margin-left : 15%;">기본정보</h4>
	<form action="memberModifyOk.jsp" id="memberModify_form">
	
	<p class="memberModify_ptag"><img src="./image/star.gif" alt="필수입력사항" style="margin-left:80%;"/>필수입력사항</p>
	

	<div class="memberModify_nowPw">
	현재 비밀번호 확인 <img src="./image/star.gif" alt="현재비번" />
		<input type="text" name="memberModify_nowPw" id="memberModify_nowPw" maxlength="16" />
		<p class="memberModify_ptag" id="memberModify_nowPwCheck"> (8자~16자)</p>
	</div>
	
	<div class="memberModify_newPw">
	새 비밀번호<img src="./image/star.gif" alt="새비밀번호" />
		<input type="password" name="memberModify_newPw" id="memberModify_newPw" maxlength="16"
		onchange="isSame()"/>
		<p class="memberModify_ptag" id="memberModify_pwlimit">(8자~16자)</p>
	</div>
	
	<div class="memberModify_newPwCheck">
	새 비밀번호 확인<img src="./image/star.gif" alt="새비밀번호 확인" />
		<input type="password" name="memberModify_newPwCheck" id="memberModify_newPwCheck" maxlength="16"
		onchange="isSame()"/>
		<p id="memberModify_same" style="display:inline; color:red; font-size:13px;"></p>
	</div>

	<div class="memberModify_address1">
	<div  class="memberModify_address2">
	주소<img src="./image/star.gif" alt="주소" />
	</div>
		<input type="text" name="memberModify_addNum" id="memberModify_addNum" style="width:120px;"/>
		<input type="button" value="우편번호" id="memberModify_addressImg"/>
		<br /><br />
		<input type="text" name="memberModify_add1" id="memberModify_add1" size="80px"/> <p class="memberModify_ptag">기본주소</p>  <br /> <br />
		<input type="text" name="memberModify_add2" id="memberModify_add2" size="80px"/> <p class="memberModify_ptag">상세주소</p>
	</div>
	
	<div class="memberModify_phone">
	휴대전화<img src="./image/star.gif" alt="휴대전화" />
		<select name="memberModify_number" id="memberModify_number" style="margin-left:20px;">
			<option value="010">010</option>
			<option value="011">011</option>
		<option value="016">016</option>
		</select> -
		<input type="text" name="memberModify_pho" id="memberModify_pho" style="width:100px"  maxlength="4">  -
		<input type="text" name="memberModify_ne" id="memberModify_ne" style="width:100px" maxlength="4">
	<input type="hidden" name="mno" value="<%=vo.getMno() %>" />
	</div>





	<br />
	<input type="submit" id ="memberModify_modify"value="회원정보수정"/>
	<a href="myPage.jsp"><input type="button" id ="memberModify_cancel" value="취소" /></a>
	<input type="button" value="회원탈퇴" id="memberModify_delete"/>
	</form>
	
		

<%
} %>
<%@ include file="../common/footer.jsp"%>
</body>
</html>