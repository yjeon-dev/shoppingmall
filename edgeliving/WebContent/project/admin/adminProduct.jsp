<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
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
			
			$("#admin_delete_memBtn").on("click",function(){
				document.frm.action="admin_memberDeleteList.jsp";
				document.frm.method="get";
				document.frm.submit();
			});
			
		}
	</script>
<%
	ProductDAO pDAO = new ProductDAO();

	int totalCount = pDAO.getTotalCount();
	int recordPerPage = 5;
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
			location.href="main.jsp?a=3&search="+strSearch;
		}
</script>

<%
	search = request.getParameter("search");
	if (search == null) {
		search = "";
	}
	ArrayList<ProductVO> list = pDAO.selectAll(startNo, endNo, search);
%>
<form name="frm">
	<table class="table table-bordered"
		style="width: 1450px; margin-left: 10px; text-align: center">
		<tr>

			<th><input type="checkbox" id='checkAll' /></th>
			<th>제품번호</th>
			<th>브랜드</th>
			<th>대분류</th>
			<th>품목명</th>
			<th>썸네일이미지</th>
			<th>재고</th>
			<th>등록일</th>
			<th>가격</th>
			<th>할인율</th>
			<th>최종가격</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>

		<%
			String queryStr = request.getQueryString();

			for (ProductVO vo : list) {
			int price = (int)(vo.getPrice() * (1 - (vo.getDiscount() * 0.01)));
		%>
		<tr>
			<td style="width: 100px"><input type="checkbox" name="ck" /></td>
			<td style="width: 200px"><%=vo.getPno()%>	</td>
			<td style="width: 200px"><%=vo.getBrandName()%></td>
			<td style="width: 160px"><%=vo.getLargeCategory()%></td>
			<td style="width: 450px"><%=vo.getPname()%></td>
			<td style="width: 160px"><img src="<%=vo.getThumbNailImg()%>" alt="<%=vo.getThumbNailImg()%>" width="80px" height="80px" /></td>
			<td style="width: 110px"><%=vo.getQty()%></td>
			<td style="width: 200px"><%=vo.getPdate()%></td>
			<td style="width: 200px"><%=vo.getPrice()%></td>
			<td style="width: 100px"><%=vo.getDiscount()%></td>
			<td style="width: 200px"><%=price%></td>
			<td><a href="./admin_productModify.jsp?pno=<%=vo.getPno()%>"><input
					type="button" value="수정" /></a></td>
			<td><a
				href="./admin_prodDelete.jsp?pno=<%=vo.getPno()%>&qurey=<%=queryStr%>"><input
					type="button" value="삭제" /></a></td>

		</tr>
		<%
			}
		%>
		<tr>
			<td colspan="12"><input type="button" value="삭제하기"
				id="admin_delete_memBtn" class="btn btn-danger" /> 
				<input	type="text" name="search" id="search" /> 
				<input type="button" value="검색" class="btn btn-info" id="search_memBtn" onclick="search33()" /> 
				<input type="button" value="제품추가"	class="btn btn-primary" 
				onclick="window.open('admin_productAdd.jsp','제품추가','width=1400,height=1000,location=no,status=no,scrollbars=yes');" /></td>
		</tr>
		<tr>
			<td colspan="12">
				<%
					for (int i = startPage; i <= endPage; i++) {
				%> <!-- 누를때마다 커런트페이지가 바뀌도록  --> <a
				href="main.jsp?cp=<%=i%>&<%=queryStr%>"><%=i%></a> <%
 	}
 %>
			</td>
		</tr>
	</table>
</form>

