<%@page import="java.text.DecimalFormat"%>
<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트</title>
<link rel="stylesheet" href="../css/main.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">   </script>
<script type="text/javascript">
$(function(){
	var jbOffset = $("#topMenu").offset();
	console.log(jbOffset);
	$(window).scroll(function(){
		
		if($(document).scrollTop() > jbOffset.top){
			$("#topMenu").addClass("jbFixed");
			$("#contents").addClass("bodyDown");
		}else{
			$("#topMenu").removeClass("jbFixed");
		}
	});
	
});

</script>
<style>

	.bodyDown{
		
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
#prodlist_pageDiv{
	text-align: center;
	font-size: 18px;
	padding-bottom: 120px;
	
}
#prodlist_pageDiv:hover {
	color: pink;
	
}
#prodlist_mainDiv{
	width: 1920px;
	background: white;
	margin: 0px auto;
	
	padding-top : 50px;
	
}
#prodlist_imgDiv{
	margin-left: 300px;
	margin-right: 300px;
	padding-bottom: 100px;

}
#prodlist_totalcount{
	display: inline-block;
	width: 500px;
}
#prodlist_orderlist{
	display: inline-block;
	width: 720px;
	text-align: right;
}
#prodlist_countlistDiv{
	width: 1270px;
	margin: 0px auto;
	
	border-top : 1px solid gray;
	padding-top : 20px;
	padding-bottom: 20px;
	
}
#prodlist_mainLogoDiv{
	width: 1200px;
	margin: 0px auto;
	
	margin-top: 50px;
	padding-top : 20px;
	
}
#prodlist_largecategoryDiv{
	padding-bottom: 30px;
	
}
.prodlist_largecategory_btn{
 	color: gray; 
 	font-size: 12px; 
 	background: white; 
 	padding: 5px 5px 5px 5px; 
 	width: 100px; 
}
</style>

<script>


</script>
</head>
<body>
	<%
		String queryStr = request.getQueryString();
		String cate_no = request.getParameter("cate_no");
		String reqOrdername = request.getParameter("ordername");
		String reqLargecategory = request.getParameter("la_ca");
		if(reqOrdername == null){
			reqOrdername = "pno";
		}
		if(reqLargecategory == null){
			reqLargecategory = "";
		}
//		String ordername = "pno";
		String ordername = reqOrdername;
		String brandname = "";
		String largecategory = reqLargecategory;
		String searchBrand = "";
		String searchLargeCategory="";
		DecimalFormat df = new DecimalFormat("#,###");
		ProductDAO pDAO = new ProductDAO();
		int totalCount = 40;
		if (cate_no.equals("1") || cate_no == null) {
			 totalCount = 40;	
		}else if(cate_no.equals("2")){
			totalCount = 40;	
		}else if(cate_no.equals("3")){
			brandname = "자크라디";
			largecategory = reqLargecategory;
			searchBrand = brandname;
			searchLargeCategory = largecategory;
			totalCount = pDAO.getTotalCount(brandname, largecategory);	
		}else if(cate_no.equals("4")){
			brandname = "밀레나";
			largecategory = reqLargecategory;
			searchBrand = brandname;
			searchLargeCategory = largecategory;
			totalCount = pDAO.getTotalCount(brandname, largecategory);	
		}else if(cate_no.equals("5")){
			brandname = "임페리얼포슬린";
			largecategory = reqLargecategory;
			searchBrand = brandname;
			searchLargeCategory = largecategory;
			totalCount = pDAO.getTotalCount(brandname, largecategory);	
		}else if(cate_no.equals("6")){
			brandname = "로얄크라운더비";
			largecategory = reqLargecategory;
			searchBrand = brandname;
			searchLargeCategory = largecategory;
			totalCount = pDAO.getTotalCount(brandname, largecategory);	
		}else if(cate_no.equals("7")){
			brandname = "체스키포슬란";
			largecategory = reqLargecategory;
			searchBrand = brandname;
			searchLargeCategory = largecategory;
			totalCount = pDAO.getTotalCount(brandname, largecategory);	
		}else if(cate_no.equals("8")){
			brandname = "크리스탈렉스";
			largecategory = reqLargecategory;
			searchBrand = brandname;
			searchLargeCategory = largecategory;
			totalCount = pDAO.getTotalCount(brandname, largecategory);	
		}else if(cate_no.equals("9")){
			brandname = "마스터클래스";
			largecategory = reqLargecategory;
			searchBrand = brandname;
			searchLargeCategory = largecategory;
			totalCount = pDAO.getTotalCount(brandname, largecategory);	
		}else if(cate_no.equals("10")){
			brandname = "알타미라";
			largecategory = reqLargecategory;
			searchBrand = brandname;
			searchLargeCategory = largecategory;
			totalCount = pDAO.getTotalCount(brandname, largecategory);	
		}else if(cate_no.equals("11")){
			brandname = "비쥬";
			largecategory = reqLargecategory;
			searchBrand = brandname;
			searchLargeCategory = largecategory;
			totalCount = pDAO.getTotalCount(brandname, largecategory);	
		}
		
		else {
			brandname = "";
			largecategory = reqLargecategory;
			searchBrand = brandname;
			searchLargeCategory = largecategory;
			totalCount = pDAO.getTotalCount();
		}
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
			if (cate_no.equals("1") || cate_no == null) {
				
				
				h2Tag = "신상품";
				String orderbycategory = "pdate";
				ArrayList<ProductVO> list = pDAO.top40(startNo, endNo, orderbycategory,ordername);
		%>
				
				<%@ include file="./newProdlist.jsp"%>
		
		
		<%	
			}else if(cate_no.equals("2")){
				
				h2Tag = "베스트 40";
				String orderbycategory = "recommend";
				ArrayList<ProductVO> list = pDAO.top40(startNo, endNo, orderbycategory,ordername);
		%>		
			
			<%@ include file="./newProdlist.jsp"%>
		
		<%	
			}else if(cate_no.equals("3")){
	
				ArrayList<ProductVO> list = pDAO.top40(startNo, endNo, searchBrand, searchLargeCategory,ordername);
		%>
		
			<div id="prodlist_mainLogoDiv">
			<img src="../../semiImages/zark.PNG" alt="../../semiImages/zark.png"  style="text-align: center" />
			</div>
				
			<%@ include file="./newProdlist2.jsp"%>
		
			
		<%		
			}else if(cate_no.equals("4")){
	
				ArrayList<ProductVO> list = pDAO.top40(startNo, endNo, searchBrand, searchLargeCategory,ordername);
		%>
			<div id="prodlist_mainLogoDiv">
			<img src="../../semiImages/milena.PNG" alt="../../semiImages/zark.png"  style="text-align: center" />
			</div>
				<%@ include file="./newProdlist2.jsp"%>
		<%
			}else if(cate_no.equals("5")){
		
				ArrayList<ProductVO> list = pDAO.top40(startNo, endNo, searchBrand, searchLargeCategory,ordername);
		%>
			<div id="prodlist_mainLogoDiv">
			<img src="../../semiImages/impo.PNG" alt="../../semiImages/zark.png"  style="text-align: center" />
			</div>
				<%@ include file="./newProdlist2.jsp"%>
		<%
			}else if(cate_no.equals("6")){
	
				ArrayList<ProductVO> list = pDAO.top40(startNo, endNo, searchBrand, searchLargeCategory,ordername);
		%>
			<div id="prodlist_mainLogoDiv">
			<img src="../../semiImages/rcd.PNG" alt="../../semiImages/zark.png"  style="text-align: center" />
			</div>
				<%@ include file="./newProdlist2.jsp"%>
		<%
			}else if(cate_no.equals("7")){
	
				ArrayList<ProductVO> list = pDAO.top40(startNo, endNo, searchBrand, searchLargeCategory,ordername);
		%>
			<div id="prodlist_mainLogoDiv">
			<img src="../../semiImages/cesky.PNG" alt="../../semiImages/zark.png"  style="text-align: center" />
			</div>
				<%@ include file="./newProdlist2.jsp"%>
		<%
			}else if(cate_no.equals("8")){
			
				ArrayList<ProductVO> list = pDAO.top40(startNo, endNo, searchBrand, searchLargeCategory,ordername);
		%>
			<div id="prodlist_mainLogoDiv">
			<img src="../../semiImages/crystal.PNG" alt="../../semiImages/zark.png"  style="text-align: center" />
			</div>
				<%@ include file="./newProdlist2.jsp"%>
		<%
			}else if(cate_no.equals("9")){
				h2Tag = "마스터클래스";
		
				ArrayList<ProductVO> list = pDAO.top40(startNo, endNo, searchBrand, searchLargeCategory,ordername);
		%>
			<h2 style="text-align: center;  padding-top: 50px"><%=h2Tag%></h2>
		
			
				<%@ include file="./newProdlist2.jsp"%>
		<%
			}else if(cate_no.equals("10")){
		
				ArrayList<ProductVO> list = pDAO.top40(startNo, endNo, searchBrand, searchLargeCategory,ordername);
		%>
			<div id="prodlist_mainLogoDiv">
			<img src="../../semiImages/altamira.PNG" alt="../../semiImages/zark.png"  style="text-align: center" />
			</div>
				<%@ include file="./newProdlist2.jsp"%>
		<%
			}else if(cate_no.equals("11")){
				h2Tag = "비쥬";
				ArrayList<ProductVO> list = pDAO.top40(startNo, endNo, searchBrand, searchLargeCategory,ordername);
		%>
			<h2 style="text-align: center;  padding-top: 50px"><%=h2Tag%></h2>

				<%@ include file="./newProdlist2.jsp"%>
		<%
			}else if(cate_no.equals("0")){
				h2Tag = "전체 상품";
				String orderbycategory = "pno";
				ArrayList<ProductVO> list = pDAO.top40(startNo, endNo, orderbycategory,ordername);
		%>
				<%@ include file="./newProdlist.jsp"%>
		<%		
			}
		%>
		
	


	</div>
	<script>
				function orderNew(){
				
				
					location.href="./prodlist.jsp?ordername=pdate desc &<%=queryStr%>";
					
				}
				function orderNew2(){
			
			
					location.href="./prodlist.jsp?ordername=pname&<%=queryStr%>";
					
				}
				function orderNew3(){
				
			
					location.href="./prodlist.jsp?ordername=price&<%=queryStr%>";
					
				}
				function orderNew4(){
				
					location.href="./prodlist.jsp?ordername=price desc&<%=queryStr%>";
					
				}
			
			
				</script>

	<%@ include file="../common/footer.jsp"%>

</body>
</html>