<%@page import="vo.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
		<%
		String column2 = "pdate";
		ProductDAO dao2 = new ProductDAO();
		ArrayList<ProductVO> list2 = dao2.top10(column2);
		
		
		%>
			
			
			<div id="new10">
			<div id="new10Text">  NEW 신상품 10 </div>
			<div id="new10ImgDiv">
					<%
						for(ProductVO vo2 : list2){
						int price2 = (int)(vo2.getPrice() * (1 - (vo2.getDiscount() * 0.01)));
					
						
					%>
					<div class="new10Div">
					<a href="./mainpage/productdetail.jsp?pno=<%=vo2.getPno()%>">
					<div>	<img src="<%=vo2.getThumbNailImg() %>" alt="<%=vo2.getPname() %>" class="new10Img" />
					<p style="font-size: 13px;">
						<%
						int length = vo2.getPname().length();
						if(length >= 19 ){
					%>
						<%= vo2.getPname().substring(0,15) + "..." %>
					<%				
						}else{
					%>
						<%= vo2.getPname() %>
					<%		
						}
					%>
					</a>
					</p>
				
					</div>
					<p class="mainPrice"><%=df.format(vo2.getPrice()) %>원 </p>
					 <strong class="strongPrice"> <%=df.format(Math.round(price2 * 0.01)*100) %>원</strong></div>	
					
					<%
						}
					%>
			
			
			</div>
		</div>
