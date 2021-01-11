<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jdbc_Connection_pool.jsp</title>
</head>
<body>	
	<%
	
	// JNDI (Java Naming and Directory Interface)
	
	// 자바외부의 디렉토리에서 데이터와 객체를 참고(lookup)하기위한 자바 API
	
	// DBCP (DataBase Connection pool)
	
	// 데이터 베이스와 연결된 커넥션을 미리 만들어서 저장해 두고 있다가
	// 필요할 때 저정된 공간(pool)에서 가져다 쓰고 반환하는 기법
	
	
		Context initCtx = new InitialContext();
	
	// initCtx의 lookup메서드를 이용해서
	// "java:comp/env"에 ㄷ해당하는 객체
	// 를 찾아서 envCtx에 대입
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
	
	// envCtx의 lookup 메서드를 이용해서 "jdbc/orcl"에 해당하는 객체를 찾아서 ds에 대입
	
	DataSource ds = (DataSource)envCtx.lookup("jdbc/orcl");
	
	Connection conn = ds.getConnection();
	
	out.println("conn : " + conn);
	
	
	
	%>
	<table border="3" bordercolor="skyblue">
			<tr bgcolor="skyblue">
					<td>이름</td><td>직업</td>
			</tr>
			<%
				// 쿼리문
				String sql = "select ename, job from emp";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				// 쿼리문의 결과값을 rs에 담는다
				ResultSet rs = pstmt.executeQuery();
				// 추력
				while(rs.next()){
					out.println("<tr>");
					
					out.println("<td>");
					out.println(rs.getString("ename"));
					out.println("</td>");

					out.println("<td>");
					out.println(rs.getString("job"));
					out.println("</td>");
					out.println("</tr>");
				}
				
				rs.close();
				pstmt.close();
				conn.close();
			%>
	</table>
</body>
</html>