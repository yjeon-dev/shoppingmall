<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String search = "";
%>
	<script>
		window.onload = function(){
			var ck = document.getElementById("checkAll");
			ck.onclick = function(){
	
				var items  = document.getElementsByName('ck');
				//console.dir(items);
				for(var i =0 ;i<items.length;i++){
					var box = items[i];
					
					box.checked=ck.checked;
				}
			}
			
			$("#admin_delete_prodBtn").on("click",function(){
				document.frm.action="admin_productDeleteList.jsp";
				document.frm.method="get";
				document.frm.submit();
			})
		}
	</script>
<%
	MemberDAO mDAO = new MemberDAO();
	int totalCount = mDAO.getTotalCount();
	int recordPerPage = 10;
	int totalPage = (totalCount % recordPerPage == 0)
			? totalCount / recordPerPage
			: totalCount / recordPerPage + 1;

	String cp = request.getParameter("cp");
	int currentPage = 0;
	if (cp != null) {
		currentPage = Integer.parseInt(cp);
	} else {
		currentPage = 1;
	}

	int startNo = (currentPage - 1) * recordPerPage + 1;
	int endNo = currentPage * recordPerPage;
	int startPage = 1;
	int endPage = totalPage;

	//시작페이지 끝페이지의 미세조정
	if (currentPage <= 5) {
		startPage = 1;
	} else if (currentPage >= 6) {
		startPage = currentPage - 4;
	}
	//끝페이지의 미세조정
	//현재페이지가 17이면 맨마지막페이지가18
	if (totalPage - currentPage <= 5) {
		endPage = totalPage;
	} else if (totalPage - currentPage > 5) {
		if (currentPage <= 5) {
			if (totalPage > 10) {
				endPage = 10;
			} else {
				endPage = totalPage;
			}
		} else {
			endPage = currentPage + 4;
		}

	}
%>
<script>
	
		
		function search33(){
			console.log("gd");
			var strSearch = document.getElementById("search").value;
			location.href="main.jsp?a=2&search="+strSearch;
		}
</script>

<%
	search = request.getParameter("search");
	if (search == null) {
		search = "";
	}
	ArrayList<MemberVO> list = mDAO.selectAll(startNo, endNo, search);
%>
<form name="frm">
	<table class="table table-bordered"
		style="width: 1450px; margin-left: 10px; text-align: center">
		<tr>

			<th><input type="checkbox" id='checkAll' /></th>
			<th>회원번호</th>
			<th>ID</th>
			<th>PW</th>
			<th>이름</th>
			<th>권한</th>
			<th>생년월일</th>
			<th>적립금</th>
			<th>핸드폰번호</th>
			<th>전화번호</th>
			<th>우편번호</th>
			<th>기본주소</th>
			<th>상세주소</th>
			<th>성별</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>

		<%
			String queryStr = request.getQueryString();
			for (MemberVO vo : list) {
		%>
		<tr>
			<td style="width: 100px"><input type="checkbox" name="ck"
				value="<%=vo.getMno()%>" /></td>
			<td style="width: 200px"><%=vo.getMno()%></td>
			<td style="width: 160px"><%=vo.getId()%></td>
			<td style="width: 160px"><%=vo.getPw()%></td>
			<td style="width: 160px"><%=vo.getMname()%></td>
			<td style="width: 110px"><%=vo.getAuthority()%></td>
			<td style="width: 200px"><%=vo.getDob()%></td>
			<td style="width: 300px"><%=vo.getPoint()%></td>
			<td style="width: 200px"><%=vo.getPhone()%></td>
			<td style="width: 200px"><%=vo.getTel()%></td>
			<td style="width: 200px"><%=vo.getAddrpost()%></td>
			<td style="width: 300px"><%=vo.getAddrbasic()%></td>
			<td style="width: 500px"><%=vo.getAddrdetail()%></td>
			<td style="width: 50px"><%=vo.getGender()%></td>
			<td><a href="./admin_memberModify2.jsp?mno=<%=vo.getMno()%>"><input
					type="button" value="수정" /></a></td>
			<td><a
				href="./admin_productDelete?mno=<%=vo.getMno()%>&qurey=<%=queryStr%>"><input
					type="button" value="삭제" /></a></td>

		</tr>
		<%
			}
		%>
		<tr>
			<td colspan="16"><input type="button" value="삭제하기"
				id="admin_delete_prodBtn" class="btn btn-danger" /> 
				<input	type="text" name="search" id="search" /> 
				<input type="button" value="검색" class="btn btn-info" id="search_memBtn" onclick="search33()" /> 
				<input type="button" value="회원추가"	class="btn btn-primary" /></td>
		</tr>
		<tr>
			<td colspan="16">
				<%
					for (int i = startPage; i <= endPage; i++) {
				%> <!-- 누를때마다 커런트페이지가 바뀌도록  --> <a
				href="main.jsp?<%=queryStr%>&cp=<%=i%>"><%=i%></a> <%
 	}
 %>
			</td>
		</tr>
	</table>
</form>

