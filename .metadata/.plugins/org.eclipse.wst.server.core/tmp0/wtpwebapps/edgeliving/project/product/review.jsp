<%@page import="vo.MemberVO"%>
<%@page import="dao.ReviewDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품후기</title>
<link rel="stylesheet" href="./css/main.css" type="text/css" />
</head>

<style type="text/css">

	table {
		width: 1200px;
		margin: auto;
		border-bottom: 1px solid black;
	}
	
	table, th, td {
		border-top : 1px solid black;
		border-collapse: collapse;
		text-align: center;
	}
	
	#col1{width: 10%;}
	#col2{width: 10%;}
	#col3{width: 50%;}
	#col4{width: 10%;}
	#col5{width: 10%;}
	#col6{width: 10%;}
	
	.blank {
		width: 500px;
		height: 80px;
	}

</style>

	<%-- <%   주석 지우지 마세요!!!!!!!!!!!!!!!!!!!!!!!
	
			//사용자 id 띄우기
			Object obj = session.getAttribute("vo");
			
			String id ="";
			if(obj !=null) {
				MemberVO m = (MemberVO) obj;
				
				id = m.getId();
				out.println(id);
			
			} else {
				response.sendRedirect("../login.jsp");
			}
	%> --%>


	<%-- <%
		//id가 admin 이면 check로 바꾸기
		if(id.equals("admin")){
	%> --%>


	<script>
	window.onload = function() {
	
		var ck = document.getElementById("checkAll");
		ck.onclick = function() {
	
			//이름이 같은 elements들을 items로 가져왔다
			var items = document.getElementsByName('ck');
			
			/* items가 여러개이기 때문에 for문을 돌려서 */
			for (var i = 0; i < items.length; i++) {
				var box = items[i];
				//box의 상태는 , ck의 상태와 같게해준다(true or false)
				box.checked = ck.checked;
			}
		}
	}

	</script>
	
	<%-- <% } %> --%>



<body>
	<%@ include file="../common/header.jsp"%>
	<div class="blank"></div>
	
<form action="deleteList.jsp">
	<table>
		<tr>
			<%-- <%
				if(id.equals("admin")){
					out.println("<th id='check'>");	
					out.println("<input type='checkbox' id='checkAll' />");	
					out.println("</th>");	
				}
			%> --%>

			<td id="col1">게시물번호</td>
			<td id="col2">이미지</td>
			<td id="col3">제목</td>
			<td id="col4">작성자</td>
			<td id="col5">평점</td>
			<td id="col6">날짜</td>
		</tr>
		
		<%
			ReviewDAO dao = new ReviewDAO();
		
			// 페이징 / 총 게시물 수 
			int totalCount = dao.getTotalCount();
		
			// 한페이지당 게시물 건수
			int recordPerPage = 20;
			
			// 총페이지수 
			
			int totalPage = (totalCount%recordPerPage==0)?totalCount/recordPerPage:
				totalCount/recordPerPage+1;
			
			// 화면출력되는 곳 - 나중 지우기
			//out.println("총게시물 수:" + totalCount +"<br />");
			//out.println("한페이지당 게시물건수:" + recordPerPage+"<br />");
			//out.println("총페이지수:" + totalPage+"<br />");
		
			
			// 현재페이지
			String cp = request.getParameter("cp");
			int currentPage=0;
			if(cp!=null) {
				currentPage = Integer.parseInt(cp);
			} else {
				currentPage =1;
			}
			
			int startNo = (currentPage-1)*recordPerPage+1;
			int endNo = currentPage*recordPerPage;
			
			int startPage =1;
			int endPage = totalPage;
			
			if(currentPage<=5) {
				startPage = 1;
			} else if(currentPage>=6){
				startPage = currentPage-4;
			}
			
			
			//
			if(totalPage-currentPage<=5){
				endPage=totalPage;
			}else if(totalPage-currentPage>5){
				if(currentPage <=5){
					if(totalPage>10){
						endPage=10;
					}else{ 
						endPage=totalPage;
					}
					
					
				}else{
				endPage=currentPage+4; 
				}
			}
			
			
			//out.println("현재페이지:" +currentPage+"<br />");
			//out.println("현재페이지에서 출력할 게시물의 시작번호:" +startNo+"<br />");
			//out.println("시작페이지번호:" +startPage+"<br />");
			//out.println("끝페이지 번호 :" +endPage+"<br />");
			
		%>
		
		<tr>
				<td colspan="6">
				<a href="write.jsp"><input type="button" value="글쓰기" /></a>
				</td>
		</tr>
		
				
		<tr>
			<td colspan="6">
			
			<% 
			//페이지 수만큼 실행하기 그래서 totalPage
			for(int i=startPage; i<=endPage; i++){
			%>	
				<!--***페이징 cp현재 current page로 주소가 변경 되도록  -->
				<a href="list.jsp?cp=<%=i%>"><%=i %></a>
			<% 
			} 
			%>
			</td>
			</tr>
		
	</table>
		
</form>


	<div class="blank"></div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>