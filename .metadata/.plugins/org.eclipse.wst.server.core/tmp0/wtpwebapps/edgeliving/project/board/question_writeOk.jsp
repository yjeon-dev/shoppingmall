<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="vo.BoardsVO"%>
<%@page import="dao.BoardsDAO"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	<%
	  request.setCharacterEncoding("UTF-8");
	Object mnoobj = session.getAttribute("vo");
	
	if(mnoobj != null){
		
		String id = request.getParameter("writer");
		String btitle = request.getParameter("title");
		String bdesc = request.getParameter("contents3");
		System.out.println("bdesc : " + bdesc);
		MemberDAO mDao = new MemberDAO();
		MemberVO mVo = (MemberVO) mnoobj; 
		int mno = mVo.getMno();
		System.out.println("mno : " + mno);
		String strpno = request.getParameter("pno");
		int pno = 0;
		if(strpno != null){
			pno = Integer.parseInt(strpno);
			
		}else{
			pno = 0;
		}
		int boardgroup = 3;
		String orderno = "";
		String bcategory = " "; 
		// 게시글에서 글쓰기를 누르면 글쓰는 jsp에 pno 을 넘겨줄거임. -> wirteok pno를 또 넘겨줄거임 그래서 여기 서 받음
		
		
		BoardsDAO bDao = new BoardsDAO();
		BoardsVO bVo = new BoardsVO();
		
		bVo.setBtitle(btitle);
		bVo.setBdesc(bdesc);
		bVo.setBoardgroup(boardgroup);
		bVo.setMno(mno);
		bVo.setPno(pno);
		bVo.setOrderno(orderno);
		bVo.setBcategory(bcategory);

		System.out.println("getMno : " + bVo.getMno());
		System.out.println("getPno : " + bVo.getPno());
		System.out.println("getBtitle : " + bVo.getBtitle());
		System.out.println("getBoardgroup : " + bVo.getBoardgroup());
		System.out.println("getOrderno : " + bVo.getOrderno());
		System.out.println("getBcategory : " + bVo.getBcategory());
		System.out.println("getBdesc : " + bVo.getBdesc());
		bDao.insertOne(bVo);
	}else{
		response.sendRedirect("../member/login.jsp");
	}



	 response.sendRedirect("question_list_board.jsp");


%>

