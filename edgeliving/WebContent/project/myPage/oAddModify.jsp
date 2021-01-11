<%@page import="vo.ReceiveaddrVO"%>
<%@page import="dao.ReceiveaddrDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 수정 페이지</title>
<link rel="stylesheet" href="../css/main.css" type="text/css" />
<link rel="stylesheet" href="../css/oAddModify.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>
<script src="../js/httpRequest.js">
</script>
<script>
//다음주소api//
window.onload = function(){
	var addressImg = document.getElementById("oAddModify_addressImg");
	addressImg.onclick=openKaKaoPostcode;
	
	function openKaKaoPostcode(){
		new daum.Postcode({
			oncomplete:function(data){
				document.getElementById("oAddModify_addNum").value=data.zonecode;
				document.getElementById("oAddModify_add1").value=data.address;
			}
		}).open();
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
		response.sendRedirect("../member/login.jsp");
	}else{
		//로그인이 되어 있는 상태라면
		// 세션에 저장된 아이디를 가져와서
		// 그 아이디 해당하는 수정할 회원정보를 가져온다.
		MemberVO vo = (MemberVO)m;
		ReceiveaddrDAO dao = new ReceiveaddrDAO();
		int rno = Integer.parseInt(request.getParameter("rno"));
	
%>
	<div class="oAddModify_path">
	<a href="../index.jsp">홈</a>>
	<a href="myPage.jsp">마이쇼핑</a>>
	<strong>배송 주소록 관리 페이지</strong>
	</div>
	
	<div id="oAddModify_box">
	<b style="font-size:20px;">배송 주소록 관리</b>
	<p>자주 쓰는 배송지를 등록 관리하실 수 있습니다.</p>
	</div>
	
	<form action="oAddModifyOK.jsp">
	<div class="oAddModify_address1">
	<div  class="oAddModify_address2">
	<span>주소</span>  <img src="./image/star.gif" alt="주소" />  
		<input type="hidden" name="rno" value="<%=rno %>" />
		<input type="text" name="oAddModify_addNum" id="oAddModify_addNum" style="width:120px;"/>
		<input type="button" value="우편번호" id="oAddModify_addressImg"/>
		<br /><br />
		<input type="text" name="oAddModify_add1" id="oAddModify_add1" size="80px"/> <p class="oAddModify_ptag">기본주소</p>  <br /><br />
		<input type="text" name="oAddModify_add2" id="oAddModify_add2" size="80px"/> <p class="oAddModify_ptag">상세주소</p>
		<br />
		<input type="checkbox" name="oAddModify_basicSave" id="oAddModify_basicSave" /><p>기본 배송지로 저장</p>
	</div>
	</div>
	<div id="oAddModify_btns">
		<input type="submit" value="수정" id="oAddModify_submit" />
		<a href="oAddList.jsp"><input type="button" value="취소" id="oAddModify_btn" /></a>
	</div>
	</form>
	
	
	<div id="oAddModify_ca">
	<div id="oAddModify_caution"><b style="margin-left:10px; font-size:13px;">배송주소록 유의사항</b></div>
	<div id="oAddModify_cautionList">
	<ul>
		<li>배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</li>
		<li>자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.</li>
		<li>기본 배송지는 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.</li>
	</ul>
	</div>
	</div>
<%
} %>
<%@ include file="../common/footer.jsp"%>
</body>
</html>