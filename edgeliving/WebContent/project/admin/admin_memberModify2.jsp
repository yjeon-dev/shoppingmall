<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정(관리자용)</title>
<link rel="stylesheet" href="../css/main.css" type="text/css" />
<link rel="stylesheet" href="../css/register.css" type="text/css" />
</head>
<body>

<%
	String strmno = request.getParameter("mno");
	int mno = 0;
	
	
	
	MemberDAO dao = new MemberDAO();
	mno = Integer.parseInt(strmno);
	MemberVO vo = null;
				
	//MemberVO vo = null;
	if (strmno != null){
		mno = Integer.parseInt(strmno);
		 vo = dao.getOne(mno);
		
	}else{
		
	response.sendRedirect("./main.jsp");
	}
			
	String strphone = vo.getPhone();
	String strtel = vo.getTel();
	String strdob = vo.getDob();
	String[] arrphone = strphone.split("-");
	String[] arrtel = strtel.split("-");
	String[] arrdob = strdob.split("-");
	

	
%>

	<%@ include file="../common/header.jsp"%>
	<%  %>
<div class="register_path">
	<a href="#">홈</a>>
	<strong>정보수정</strong>
</div>


<h3>정보수정</h3>


<h4>기본정보</h4>
<form action="admin_memberModifyOk.jsp">
<p class="ptag"><img src="./image/star.gif" alt="필수입력사항" style="margin-left:90%;"/>필수입력사항</p>
<div class="register_basicinfo">

	<div class="register_id">
	아이디<img src="./image/star.gif" alt="아이디" />
		<input type="text" name="id" id="" value="<%=vo.getId() %>" style="margin-left:30px;"readonly/>
		<p class="ptag"> (영문소문자/숫자, 4~16자)</p>
	</div>
	
	<div class="register_pw">
	비밀번호<img src="./image/star.gif" alt="비밀번호" />
		<input type="password" name="pw" id="" style="margin-left:15px;"  value="<%=vo.getPw() %>"/>
		<p class="ptag"> (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)</p>
	</div>
	
	<div class="register_pwCheck">
	비밀번호 확인<img src="./image/star.gif" alt="비밀번호 확인" />
		<input type="password" name="pwCheck" id="" style="margin-left:10px;"  />
	</div>
	
	<div class="register_name">
	이름<img src="./image/star.gif" alt="이름" />
		<input type="text" name="name" id="" style="margin-left:30px;"  value="<%=vo.getMname() %>" readonly/>
	</div>
	
	<div class="register_address1">
	<div  class="register_address2">주소<img src="./image/star.gif" alt="주소" /></div>
		<input type="text" name="addNum" id="" style="width:120px;"  value="<%=vo.getAddrpost() %>"/>
		<a href="#"><img src="./image/address.gif" alt="우편번호" /></a>
		<br /><br />
		<input type="text" name="add1" id=""  value="<%=vo.getAddrbasic() %>"/> 기본주소  <br /> <br />
		<input type="text" name="add2" id=""  value="<%=vo.getAddrdetail() %>"/> 상세주소
	</div>
	
	<div class="register_phone">
	휴대전화<img src="./image/star.gif" alt="휴대전화" />
		<!-- <select name="number" id="" style="margin-left:20px;">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
		</select>
 -->		
		<input type="text" name="number" id="" value=<%=arrphone[0] %> style="width:100px"> 
		-
		<input type="text" name="pho" id=""  value=<%=arrphone[1] %>  style="width:100px">  -
		<input type="text" name="ne" id=""  value=<%=arrphone[2] %>  style="width:100px">
	</div>
	
	<div class="register_email">
	이메일<img src="./image/star.gif" alt="이메일" />
	<input type="text" name="email" id="" style="margin-left:35px;"  value="<%=vo.getEmail() %>"/>
	</div>
	
	<div class="register_gender">
	성별<img src="./image/star.gif" alt="성별" />
	<input type="radio" name="man" id="" style="margin-left:50px;" />남자
			<input type="radio" name="woman" id="" />여자
	</div>
	
	<div class="register_dob">
	생년월일<img src="./image/star.gif" alt="생년월일" />
	<input type="text" name="year" id="" value=<%=arrdob[0] %> style="width:80px; margin-left:20px;"/>년
	<input type="text" name="month" id=""value=<%=arrdob[1] %> style="width:80px;"/>월
	<input type="text" name="day" id="" value=<%=arrdob[2] %> style="width:80px;" />일
	<input type="checkbox" name="yang" id="" />양력
	<input type="checkbox" name="um" id="" />음력
	</div>
</div>
 	 
	<div class="register_email">
	권한
	<img src="./image/star.gif" alt="권한" />
	<input type="text" name="autority" value="<%=vo.getAuthority() %>" id="" style="margin-left:35px;"/>
	</div>
	
	<div class="register_email">
	적립금
	<img src="./image/star.gif" alt="적립금" />
	<input type="text" name="point" id="" value="<%=vo.getPoint() %>" style="margin-left:35px;"/>
	</div>
 	<input type="hidden" name="mno" value="<%=vo.getMno() %>" />
	<br />
	<input type="submit" value="정보수정" style="margin-left:50%; background:white; width:100px; height:50px; border-radius:15px;" />
	<br />
	<br />
	<br />
	</form>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>