<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 검색리스트</title>
<link rel="stylesheet" href="../css/main.css" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
	
</script>
<script type="text/javascript">
	$(function() {
		var jbOffset = $("#topMenu").offset();
		console.log(jbOffset);
		$(window).scroll(function() {

			if ($(document).scrollTop() > jbOffset.top) {
				$("#topMenu").addClass("jbFixed");
				$("#contents").addClass("bodyDown");
			} else {
				$("#topMenu").removeClass("jbFixed");
			}
		});

	});
</script>
<style>
.bodyDown {
	
}

.prodlist_listDiv {
	width: 320px;
	display: inline-block;
	text-align: center;
	height: 380px;
	padding-top: 40px;
}

.prodlist_Img {
	width: 300px;
	height: 300px;
}

#prodlist_pageDiv {
	text-align: center;
	font-size: 18px;
	padding-bottom: 120px;
}

#prodlist_pageDiv:hover {
	color: pink;
}

#prodlist_mainDiv {
	width: 1920px;
	background: white;
	margin: 0px auto;
	padding-top: 50px;
}

#prodlist_imgDiv {
	margin-left: 300px;
	margin-right: 300px;
	padding-bottom: 100px;
}

#prodlist_totalcount {
	display: inline-block;
	width: 500px;
}

#prodlist_orderlist {
	display: inline-block;
	width: 720px;
	text-align: right;
}

#prodlist_countlistDiv {
	width: 1270px;
	margin: 0px auto;
	border-top: 1px solid gray;
	padding-top: 20px;
	padding-bottom: 20px;
}

#prodlist_mainLogoDiv {
	width: 1200px;
	margin: 0px auto;
	margin-top: 50px;
	padding-top: 20px;
}

#prodlist_largecategoryDiv {
	padding-bottom: 30px;
}

.prodlist_largecategory_btn {
	color: gray;
	font-size: 12px;
	background: white;
	padding: 5px 5px 5px 5px;
	width: 100px;
}
</style>
</head>
<body>
	<%
		String queryStr = request.getQueryString();
		String cate_no = request.getParameter("cate_no");
		String reqOrdername = request.getParameter("ordername");
		String reqSerarch = request.getParameter("search");
		if (reqOrdername == null) {
			reqOrdername = "pno";
		}
		if(reqSerarch == null){
			reqSerarch = "";
		}
		
		//		String ordername = "pno";
		String ordername = reqOrdername;
		String brandname = "";

		DecimalFormat df = new DecimalFormat("#,###");
		ProductDAO pDAO = new ProductDAO();
		int totalCount = pDAO.getTotalCount(reqSerarch);
		/* 	brandname = "";
			largecategory = reqLargecategory;
			searchBrand = brandname;
			searchLargeCategory = largecategory;
			totalCount = pDAO.getTotalCount(); */

		int recordPerPage = 40;
		int totalPage = (totalCount % recordPerPage == 0) ? totalCount / recordPerPage
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
		String h2Tag = "";
	%>
	<%@ include file="../common/header.jsp"%>
	<div id="contents">
		<%
			h2Tag = "검색어 : " + reqSerarch;
			String orderbycategory = "pno";
			ArrayList<ProductVO> list = pDAO.prodSearch40(startNo, endNo, reqSerarch, ordername);
		%>
		<h2 style="text-align: center; padding-top: 50px"><%=h2Tag%></h2>


		<div id="prodlist_mainDiv">
			<div id="prodlist_imgDiv">

				<div id="prodlist_countlistDiv">
					<div id="prodlist_totalcount">
						<p style="color: gray; font-size: 15px;">
							총
							<%=totalCount%>개의 상품이 등록되어 있습니다.
						</p>
					</div>
					<div id="prodlist_orderlist">
						<input type="button" value="신상품" id="prodlist_orderNew"
							style="color: gray; font-size: 12px; background: white; padding: 5px 5px 5px 5px;"
							onclick="orderNew();" /> <input type="button" value="상품명"
							id="prodlist_orderPname"
							style="color: gray; font-size: 12px; background: white; padding: 5px 5px 5px 5px;"
							onclick="orderNew2();" /> <input type="button" value="낮은가격"
							id="prodlist_orderPriceup"
							style="color: gray; font-size: 12px; background: white; padding: 5px 5px 5px 5px;"
							onclick="orderNew3();" /> <input type="button" value="높은가격"
							id="prodlist_orderPricedown"
							style="color: gray; font-size: 12px; background: white; padding: 5px 5px 5px 5px;"
							onclick="orderNew4();" />


					</div>
				</div>

				<%
					for (ProductVO vo2 : list) {
						int price2 = (int) (vo2.getPrice() * (1 - (vo2.getDiscount() * 0.01)));
				%>

				<div class="prodlist_listDiv">

					<div>
						<a href="../mainpage/productdetail.jsp?pno=<%=vo2.getPno()%>"> <img
							src="<%=vo2.getThumbNailImg()%>" alt="<%=vo2.getPname()%>"
							class="prodlist_Img" />
						</a>
						<p style="font-size: 13px;">
							<%
								int length = vo2.getPname().length();
									if (length >= 19) {
							%>
							<a href="./productdetail.jsp?pno=<%=vo2.getPno()%>"> <%=vo2.getPname().substring(0, 15) + "..."%>
							</a>
							<%
								} else {
							%>
							<a href="./productdetail.jsp?pno=<%=vo2.getPno()%>"> <%=vo2.getPname()%>
							</a>
							<%
								}
							%>
						</p>

					</div>
					<p class="mainPrice"><%=df.format(vo2.getPrice())%>원
					</p>
					<strong class="strongPrice"> <%=df.format(Math.round(price2 * 0.01) * 100)%>원
					</strong>
				</div>

				<%
					}
				%>
			</div>
			<div id="prodlist_pageDiv">
				<%
					for (int i = startPage; i <= endPage; i++) {
						
				%>
				<!-- 누를때마다 커런트페이지가 바뀌도록  -->
				
<%-- 				<a href="http://192.168.0.4/edgeliving/project/product/prodlist_search.jsp?cp=<%=i%>&<%=queryStr%>"><%=i%></a> --%>
				<a href="/edgeliving/project/product/prodlist_search.jsp?cp=<%=i%>&<%=queryStr%>"><%=i%></a>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<script>
				function orderNew(){
					location.href="/edgeliving/project/product/prodlist_search.jsp?ordername=pdate desc &<%=queryStr%>";
				}
				function orderNew2(){
					location.href="/edgeliving/project/product/prodlist_search.jsp?ordername=pname&<%=queryStr%>";
				}
				function orderNew3(){
				location.href="/edgeliving/project/product/prodlist_search.jsp?ordername=price&<%=queryStr%>";
					
				}
				function orderNew4(){
					location.href="/edgeliving/project/product/prodlist_search.jsp?ordername=price desc&<%=queryStr%>";
					
				}
			
			
				</script>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>