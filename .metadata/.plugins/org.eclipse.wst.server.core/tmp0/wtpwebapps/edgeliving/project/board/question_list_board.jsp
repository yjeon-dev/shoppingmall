<%@page import="dao.BoardsDAO"%>
<%@page import="vo.JoinBoardsMemberProdVO"%>
<%@page import="dao.JoinBoardsMemberProdDAO"%>
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



<title>Q&A 게시판</title>
<link rel="stylesheet" href="../css/main.css" type="text/css" />

</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>

<script>

	$(function() {
		
	/* 	var jbOffset = $("#topMenu").offset();
		console.log(jbOffset);
		$(window).scroll(function() {

			if ($(document).scrollTop() > jbOffset.top) {
				$("#topMenu").addClass("jbFixed");
				$("#contents").addClass("bodyDown");
			} else {
				$("#topMenu").removeClass("jbFixed");
			}
		}); 
 */
		
		
/* 		var ck = document.getElementById("checkAll");
		ck.onclick = function() {

			var items = document.getElementsByName('ck');
			//console.dir(items);
			for (var i = 0; i < items.length; i++) {
				var box = items[i];

				box.checked = ck.checked;
			}
		} */

		
		$("#viewcart_list_deleteBtn").on("click", function() {
			document.frm.action = "cartDeleteList.jsp";
			document.frm.method = "get";
			document.frm.submit();
		})
	});
	
	
</script>

<style type="text/css">
#whole_table {
	width: 800px;
	margin: auto;
	
}


#whole_table {
	border-collapse: collapse;
/* 	text-align: center; */
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
	
	td {
	
	height: 75px;
}

/* 
#col1 {
	width: 10%;
}

#col2 {
	width: 10%;
}

#col3 {
	width: 50%;
}

#col4 {
	width: 10%;
}

#col5 {
	width: 10%;
}

#col6 {
	width: 10%;
}
 */
 
 
.blank {
	width: 1500px;
	height: 80px;
	}

	#thumnailimg{
	width: 50px;
	}

	#headline{
	margin: auto;
	}

	#col1, #col2, #col3, #col4, #col5{
	font-weight: bold;
	}

</style>

<body>
	<%
		BoardsDAO bDAO = new BoardsDAO();

		JoinBoardsMemberProdDAO jDAO = new JoinBoardsMemberProdDAO();
		
		int boardgroup = 3;

		int totalCount = bDAO.getTotalCount(boardgroup);

		//System.out.println("확인" + totalCount);

		int recordPerPage = 7;

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
 		<h3 id="title">Q&A 게시판</h3>
 	</div>

	
	<form action="">
		<table class="table table-striped table-bordered" style="width:1000px;" id="whole_table">
			<tr>


				<td id="col1" style="width:70px; text-align: center; height: 40px">번호</td>
				<td id="col2" style="width:100px; text-align: center;">상품번호</td>
				<td id="col3" style= "text-align: center;">제목</td>
				<td id="col4" style= "text-align: center;">작성자</td>
				<td id="col5" style= "text-align: center;">작성일</td>

			</tr>

			<%
				ArrayList<JoinBoardsMemberProdVO> list = jDAO.viewboardAll(startNo, endNo, boardgroup);

				for (JoinBoardsMemberProdVO vo : list) {
			%>

			<tr>
			
				<td id="img_talble" style= "text-align: center;"><%=vo.getBno()%></td>
		
 			
				<td style= "text-align: center;"><img src="<%=vo.getThumbnailimg()%>" alt="" id="thumnailimg"/></td>
		
				
				<td><a href="question_board_detail.jsp?bno=<%=vo.getBno()%>"><%=vo.getBtitle()%></a></td>
				
	
				<td style= "text-align: center;"><%=vo.getId()%></td>
				<td style= "text-align: center;"><%=vo.getBdate()%></td>
			</tr>
			<%
				}	
			%>



			<tr>
				<td colspan="6"><a href="question_write_board.jsp"><input type="button"
						value="글쓰기" /></a></td>
			</tr>


			<tr>
				<td colspan="6">
					<%
						//페이지 수만큼 실행하기 그래서 totalPage
						for (int i = startPage; i <= endPage; i++) {
					%> <!--***페이징 cp현재 current page로 주소가 변경 되도록  --> <a
					href="question_list_board.jsp?cp=<%=i%>"><%=i%></a> <%
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