<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.ProductDAO"%>
<%@page import="vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // 
	//파라미터 값 가져오기
	request.setCharacterEncoding("UTF-8");
    // 썸네일 파일이미지 주소 ..
  String saveDir = request.getRealPath("/upload");

  //  String saveDir = "http://192.168.0.4/edgeliving/upload/";
	String contents = request.getParameter("contents");
    int maxFileSize = 1024*1024*100;
    
    MultipartRequest mr = new MultipartRequest(request,saveDir,maxFileSize
			,"UTF-8",new DefaultFileRenamePolicy());
	String f = mr.getOriginalFileName("thumbnailimg");
	// 경로입력하는법 "http://192.168.0.4/edgeliving/upload/" + f 
	
    // detaildesc 주소..
	String brandname = mr.getParameter("brandname");
	String largecategory = mr.getParameter("largecategory");
	String pname = mr.getParameter("pname");
	String test = mr.getParameter("price");

	
	int price = Integer.parseInt(mr.getParameter("price"));
	int discount = Integer.parseInt(mr.getParameter("discount"));
	//String thumbnailimg = mr.getParameter("thumbnailimg");
	String pdesc = mr.getParameter("pdesc");
	int qty = Integer.parseInt(mr.getParameter("qty"));
	String detaildesc = mr.getParameter("contents");
    
	String search = brandname + " " + largecategory + " " + pname + " " + pdesc ;
    System.out.println("contents : " + contents);
    System.out.println("detaildesc : " + detaildesc);
    
    ProductVO vo = new ProductVO();
  
     vo.setBrandName(brandname);
    vo.setPname(pname);
    vo.setPrice(price);
    vo.setQty(qty);
    vo.setDiscount(discount);
    vo.setRecommend(0);
    vo.setSearch(search);
    vo.setDetailDesc(detaildesc);
    vo.setThumbNailImg("/edgeliving/upload/" + f );
    vo.setLargeCategory(largecategory);
    vo.setPdesc(pdesc);
    
    ProductDAO dao = new ProductDAO();
    dao.insertOne(vo); 
	 
	 %>