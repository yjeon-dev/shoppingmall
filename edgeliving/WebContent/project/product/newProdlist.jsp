<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<h2 style="text-align: center;  padding-top: 50px"><%=h2Tag%></h2>

	
		<div id="prodlist_mainDiv">
			<div id="prodlist_imgDiv">
			
			<div id="prodlist_countlistDiv">
				<div id="prodlist_totalcount">
				<p style="color: gray; font-size: 15px;">총 <%=totalCount %>개의 상품이 등록되어 있습니다.</p>
				</div>
				<div id="prodlist_orderlist">
					<input type="button" value="신상품" id="prodlist_orderNew" style="color: gray; font-size: 12px; background: white; padding: 5px 5px 5px 5px;" onclick="orderNew();" />
					<input type="button" value="상품명" id="prodlist_orderPname" style="color: gray; font-size: 12px; background: white; padding: 5px 5px 5px 5px;" onclick="orderNew2();"/>
					<input type="button" value="낮은가격" id="prodlist_orderPriceup" style="color: gray; font-size: 12px; background: white; padding: 5px 5px 5px 5px; " onclick="orderNew3();" />
					<input type="button" value="높은가격" id="prodlist_orderPricedown" style="color: gray; font-size: 12px; background: white; padding: 5px 5px 5px 5px;" onclick="orderNew4();" />


				</div>
			</div>
			
				<%
					for (ProductVO vo2 : list) {
							int price2 = (int) (vo2.getPrice() * (1 - (vo2.getDiscount() * 0.01)));
				%>

				<div class="prodlist_listDiv">

					<div>
					<a href="../mainpage/productdetail.jsp?pno=<%=vo2.getPno()%>">	<img src="<%=vo2.getThumbNailImg()%>" alt="<%=vo2.getPname()%>"	class="prodlist_Img" /> </a>
						<p style="font-size: 13px;">
							<%
								int length = vo2.getPname().length();
										if (length >= 19) {
							%>
						<a href="../mainpage/productdetail.jsp?pno=<%=vo2.getPno()%>">	<%=vo2.getPname().substring(0, 15) + "..."%> </a>
							<%
								} else {
							%>
						<a href="../mainpage/productdetail.jsp?pno=<%=vo2.getPno()%>">	<%=vo2.getPname()%> </a>
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
				<a href="prodlist.jsp?cp=<%=i%>&<%=queryStr%>"><%=i%></a>
				<%
					}
				%>
			</div>
		</div>
	
			