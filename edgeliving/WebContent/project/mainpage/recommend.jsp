<%@page import="vo.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	ProductDAO dao3 = new ProductDAO();
	ArrayList<ProductVO> list3 = dao3.recommend20();

%>
<div id="recommend">
			<div id="recommendText"> JHTA 추천 상품 </div>
			<div id="recommendImgDiv">
				
				
				
			<%
				for(ProductVO vo3 : list3){
				int price3 = (int)(vo3.getPrice() * (1 - (vo3.getDiscount() * 0.01)));
			%>
				<div class="recommendDiv">
					<a href="./mainpage/productdetail.jsp?pno=<%=vo3.getPno()%>">
					<div>	<img src="<%=vo3.getThumbNailImg() %>" alt="<%=vo3.getPname() %>" class="recommendImg" />
					<p style="font-size: 13px;">
						<%
						int length = vo3.getPname().length();
						if(length >= 19 ){
					%>
						<%= vo3.getPname().substring(0,15) + "..." %>
					<%				
						}else{
					%>
						<%= vo3.getPname() %>
					<%		
						}
					%>
					</a>
					</p>
					
					
					</div>
					<p class="mainPrice"><%=df.format(vo3.getPrice()) %>원 </p>
					 <strong class="strongPrice"> <%=df.format(Math.round(price3 * 0.01)*100) %>원</strong>
				</div>
			<%
				}
			%>
				
			</div>
		</div>