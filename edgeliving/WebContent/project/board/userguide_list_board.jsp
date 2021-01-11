<%@page import="vo.JoinBoardsMemberProdVO"%>
<%@page import="dao.JoinBoardsMemberProdDAO"%>
<%@page import="dao.BoardsDAO"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.ReviewDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<title>이용안내 게시판</title>
<link rel="stylesheet" href="../css/main.css" type="text/css" />

</head>

<style type="text/css">

	#whole_table {
	width: 600px;
	margin: auto;
	}


	#whole_table {
	border-collapse: collapse;
	/* text-align: center; */
	}
	
	
	/* #col1{width: 10%;}
	#col2{width: 50%;}
	#col3{width: 10%;}
	#col4{width: 20%;} */


	#col1, #col2, #col3, #col4{
	font-weight: bold;
	}
	
	.blank {
		width: 1200px;
		height: 80px;
		margin-left: 200px;
	}
	
	#titlearea {
	width: 1200px;
	height: 60px;
	text-align: center;
	margin: auto;
	margin-bottom : 100px;
 	border-bottom : 1px solid gray;
	font-size: 25px;
	color: gray;
	}

</style>


<body>
	<%
		BoardsDAO bDAO = new BoardsDAO();

		JoinBoardsMemberProdDAO jDAO = new JoinBoardsMemberProdDAO();
		
		int boardgroup = 1;

		int totalCount = bDAO.getTotalCount(boardgroup);

		//System.out.println("확인" + totalCount);

		int recordPerPage = 20;

		int totalPage = (totalCount % recordPerPage == 0) ? totalCount / recordPerPage
				: totalCount / recordPerPage + 1;

		// 현재페이지
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

		if (currentPage <= 5) {
			startPage = 1;
		} else if (currentPage >= 6) {
			startPage = currentPage - 4;
		}

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






	<%@ include file="../common/header.jsp"%>

	<div class="blank"></div>
	
	 <div id="titlearea">
 		<h3 id="title">이용안내 FAQ 게시판</h3>
 	</div>
	
	

	
	
	
<form action="">

	<table class="table table-striped table-bordered" style="width:1200px;" id="whole_table">
		<tr>
	
			<td id="col1" style="width:70px;">번호</td>
			<td id="col2">제목</td>
			<td id="col3" style= "text-align: center;">작성자</td>
			<td id="col4"  style= "text-align: center;">작성일</td>
			
		</tr>
		
		
			<%
				ArrayList<JoinBoardsMemberProdVO> list = jDAO.viewboardAll(startNo, endNo, boardgroup);

				for (JoinBoardsMemberProdVO vo : list) {
			%>

			<tr style="height:50px;">
			
				<td style="height:50px; text-align: center;"  ><%=vo.getBno() %></td>
				<td style="height:50px;"><a href="userguide_board_detail.jsp?bno=<%=vo.getBno()%>"><%=vo.getBtitle()%></a></td>
				
	
				<td style="height:50px;  text-align: center;"><%=vo.getId() %></td>
				<td style="height:50px;  text-align: center;"><%=vo.getBdate() %></td>
			</tr>
			<%
				}	
			%>
				
		<tr>
			<td colspan="6">
			
			<% 
			//페이지 수만큼 실행하기 그래서 totalPage
			for(int i=startPage; i<=endPage; i++){
			%>	
				<!--***페이징 cp현재 current page로 주소가 변경 되도록  -->
				<a href="userguide_list_board.jsp?cp=<%=i%>"><%=i %></a>
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