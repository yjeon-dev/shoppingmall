/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.29
 * Generated at: 2020-01-16 02:51:28 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.project.brand;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import vo.MemberVO;
import java.util.ArrayList;

public final class brand_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/project/brand/../common/header.jsp", Long.valueOf(1579140940086L));
    _jspx_dependants.put("/project/brand/../common/footer.jsp", Long.valueOf(1579140940075L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("vo.MemberVO");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>브랜드</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"../css/main.css\" type=\"text/css\" />\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <style>\r\n");
      out.write("    \r\n");
      out.write("    \t#total{\r\n");
      out.write("    \t\twidth: 1300px;\r\n");
      out.write("   \t\t\tmargin: 0px auto;\r\n");
      out.write("    \t}\r\n");
      out.write("    \t\r\n");
      out.write("    \t#container{\r\n");
      out.write("    \t\tmargin: 0px auto;\r\n");
      out.write("    \t}\r\n");
      out.write("    \r\n");
      out.write("\t\t.country1{\r\n");
      out.write("\t\t\tfloat: left;\r\n");
      out.write("   \t\t\tmargin-right: 100px;\r\n");
      out.write("\t\t\tpadding: 30px 20px;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t.country2{\r\n");
      out.write("\t\t\tmargin-right: 100px;\r\n");
      out.write("\t\t\tpadding: 30px 20px;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t.country1, .country2 {\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tborder-bottom: 1px solid gray;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\timg {\r\n");
      out.write("\t\t\tpadding: 20px 20px;\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t#blank{\r\n");
      out.write("\t\t\twidth: 500px;\r\n");
      out.write("\t\t\theight: 200px;\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("    </style>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    ");

   
    	//String homeURL = "http://192.168.0.4:8080/edgeliving/project";
    	String homeURL = "/edgeliving/project";
    	//String homeURL = "http://192.168.0.4:8080/edgeliving/project";
    	String WebURL = "/edgeliving";
    
    
      out.write("\r\n");
      out.write("<div id=\"header\">\r\n");
      out.write("\t\t<div class=\"header1\" >\r\n");
      out.write("\t\t\t<a href=\"");
      out.print(homeURL);
      out.write("/index.jsp\"><img src=\"");
      out.print(WebURL );
      out.write("/semiImages/logo.png\" alt=\"logo.png\"  id=\"mainlogo\"/>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t<div class=\"header1\">\r\n");
      out.write("\t\t\t<div>\r\n");
      out.write("\t\t\t\t<strong>인기검색어</strong> <a href=\"");
      out.print(homeURL );
      out.write("/product/prodlist_search.jsp?search=자크라디\" class=\"search_a\">자크라디</a> &nbsp;\r\n");
      out.write("\t\t\t\t<a href=\"");
      out.print(homeURL );
      out.write("/product/prodlist_search.jsp?search=임페리얼\" class=\"search_a\">임페리얼 포셀린</a> &nbsp; \r\n");
      out.write("\t\t\t\t<a href=\"");
      out.print(homeURL );
      out.write("/product/prodlist_search.jsp?search=보니타하우스\"\tclass=\"search_a\">보니타하우스</a> &nbsp;\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<br />\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\t<form action=\"");
      out.print(homeURL );
      out.write("/product/prodlist_search.jsp\" id=\"search_form\" name=\"search_frm\" onsubmit=\"return checkSearch()\">\r\n");
      out.write("\t\t\t \t\t<input type=\"text\" value=\"\" name=\"search\" size=\"40\" id=\"header_search_text\"/>\r\n");
      out.write("\t\t\t \t\t<input type=\"submit\" value=\"검색\" />\r\n");
      out.write("\t\t\t \t</form>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<script>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tfunction checkSearch(){\r\n");
      out.write("\t\t\tif(search_frm.search.value == \"\") {\r\n");
      out.write("\r\n");
      out.write("\t\t\t    alert(\"값을 입력해 주세요.\");\r\n");
      out.write("\r\n");
      out.write("\t\t\t    search_frm.search.focus();\r\n");
      out.write("\r\n");
      out.write("\t\t\t    return false;\r\n");
      out.write("\r\n");
      out.write("\t\t\t  }else{\r\n");
      out.write("\t\t\t\t  return true;\r\n");
      out.write("\t\t\t  }\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\r\n");
      out.write("\t\t \r\n");
      out.write("\r\n");
      out.write("\t\t  \r\n");
      out.write("\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t\t");


		Object obj = session.getAttribute("vo");
		
		MemberVO mVO = (MemberVO)obj;
		//
		if(obj == null){
			
		 
		
		
      out.write("\r\n");
      out.write("\t\t<div class=\"header1\" id=\"topAtag\" >\r\n");
      out.write("\t\t\t <a href=\"");
      out.print(homeURL );
      out.write("/member/login.jsp\" class=\"header_a2\">로그인</a>\r\n");
      out.write("\t\t\t<a href=\"");
      out.print(homeURL );
      out.write("/member/register.jsp\" class=\"header_a2\">회원가입</a> <a href=\"");
      out.print(homeURL );
      out.write("/member/login.jsp\" class=\"header_a2\">장바구니</a>\r\n");
      out.write("\t\t\t<a href=\"");
      out.print(homeURL );
      out.write("/member/login.jsp\" class=\"header_a2\">주문조회</a> <a href=\"");
      out.print(homeURL );
      out.write("/board/customer_center.jsp\" class=\"header_a2\">고객센터</a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t");

		}else{
			
			if(mVO.getAuthority() < 99){
				
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class=\"header1\" id=\"topAtag\" >\r\n");
      out.write("\t\t\t <a href=\"");
      out.print(homeURL );
      out.write("/member/logout.jsp\" class=\"header_a2\">로그아웃</a>\r\n");
      out.write("\t\t\t <a href=\"");
      out.print(homeURL );
      out.write("/myPage/myPage.jsp\"  class=\"header_a2\">마이페이지</a>\r\n");
      out.write("\t\t\t <a href=\"");
      out.print(homeURL );
      out.write("/mainpage/viewcart.jsp\" class=\"header_a2\">장바구니</a>\r\n");
      out.write("\t\t\t<a href=\"");
      out.print(homeURL );
      out.write("/checkout/orderlist.jsp\" class=\"header_a2\">주문조회</a> <a href=\"");
      out.print(homeURL );
      out.write("/board/customer_center.jsp\" class=\"header_a2\">고객센터</a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\t\t");

				
			}else{
				
      out.write("\r\n");
      out.write("\t\t\t<div class=\"header1\" id=\"topAtag\" >\r\n");
      out.write("\t\t\t <a href=\"");
      out.print(homeURL );
      out.write("/member/logout.jsp\" class=\"header_a2\">로그아웃</a>\r\n");
      out.write("\t\t\t <a href=\"");
      out.print(homeURL );
      out.write("/myPage/myPage.jsp\"  class=\"header_a2\">마이페이지</a>\r\n");
      out.write("\t\t\t <a href=\"");
      out.print(homeURL );
      out.write("/mainpage/viewcart.jsp\" class=\"header_a2\">장바구니</a>\r\n");
      out.write("\t\t\t<a href=\"");
      out.print(homeURL );
      out.write("/checkout/orderlist.jsp\" class=\"header_a2\">주문조회</a> <a href=\"");
      out.print(homeURL );
      out.write("/board/customer_center.jsp\" class=\"header_a2\">고객센터</a>\r\n");
      out.write("\t\t\t<a href=\"");
      out.print(homeURL );
      out.write("/admin/main.jsp\" class=\"header_a2\">관리자페이지</a>\r\n");
      out.write("\t\t\t");
      out.write("\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\t\t");

			}
		}
		
      out.write("\r\n");
      out.write("\t\t<div >\r\n");
      out.write("\t\t\t<ul id=\"topMenu\">\r\n");
      out.write("\t\t\t\t<li><a href=\"/edgeliving/project/product/prodlist.jsp?cate_no=0\" class=\"menu\" id=\"allCategory\">전체상품</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"/edgeliving/project/product/prodlist.jsp?cate_no=1\" class=\"menu\" id=\"newProd\">신상품</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"/edgeliving/project/product/prodlist.jsp?cate_no=2\" class=\"menu\" id=\"best50\">베스트40</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"/edgeliving/project/brand/brand.jsp\" class=\"menu\" id=\"brand\">브랜드</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"/edgeliving/project/board/review.jsp\" class=\"menu\" id =\"review\">생생후기</a></li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("\t<div id=\"contents\">\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"total\">\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"brand\">\r\n");
      out.write("\t<img src=\"../../semiImages/brand.jpg\" alt=\"\" />\r\n");
      out.write("\t</div>\r\n");
      out.write(" \r\n");
      out.write(" <!-----------------------------------------------------------------  -->\r\n");
      out.write(" \t<div id=\"container\">\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"country1\">\r\n");
      out.write("\t<img src=\"../../semiImages/poland.jpg\" alt=\"\" />\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"poland\">\r\n");
      out.write("\t<a href=\"/edgeliving/project/product/prodlist.jsp?cate_no=4\"><img src=\"../../semiImages/poland_milena.jpg\" alt=\"\" /></a>\r\n");
      out.write("\t<a href=\"/edgeliving/project/product/prodlist.jsp?cate_no=3\"><img src=\"../../semiImages/poland_zark.jpg\" alt=\"\" /></a>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write(" <!-----------------------------------------------------------------  -->\r\n");
      out.write(" \r\n");
      out.write("\t<div class=\"country2\">\r\n");
      out.write("\t<img src=\"../../semiImages/russia.jpg\" alt=\"\" />\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"russia\">\r\n");
      out.write("\t<a href=\"/edgeliving/project/product/prodlist.jsp?cate_no=5\"><img src=\"../../semiImages/russia_imperial.jpg\" alt=\"\" /></a>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-----------------------------------------------------------------  -->\r\n");
      out.write("\t<div class=\"country1\">\r\n");
      out.write("\t<img src=\"../../semiImages/czech.jpg\" alt=\"\" />\r\n");
      out.write("\r\n");
      out.write("\t<div id=\"czech\">\t\r\n");
      out.write("\t<a href=\"/edgeliving/project/product/prodlist.jsp?cate_no=7\"><img src=\"../../semiImages/czech_cheski.jpg\" alt=\"\" /></a>\r\n");
      out.write("\t<a href=\"/edgeliving/project/product/prodlist.jsp?cate_no=8\"><img src=\"../../semiImages/czech_cristal.jpg\" alt=\"\" /></a>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("<!-----------------------------------------------------------------  -->\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"country2\">\r\n");
      out.write("\t<img src=\"../../semiImages/england.jpg\" alt=\"\" />\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"england\">\r\n");
      out.write("\t<a href=\"/edgeliving/project/product/prodlist.jsp?cate_no=6\"><img src=\"../../semiImages/england_roayl.jpg\" alt=\"\" /></a>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("<!-----------------------------------------------------------------  -->\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"country1\">\r\n");
      out.write("\t<img src=\"../../semiImages/portugal.jpg\" alt=\"\" />\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"portugal\">\r\n");
      out.write("\t<a href=\"/edgeliving/project/product/prodlist.jsp?cate_no=10\"><img src=\"../../semiImages/portugal_altamira.jpg\" alt=\"\" /></a>\r\n");
      out.write("\t<a href=\"/edgeliving/project/product/prodlist.jsp?cate_no=11\"><img src=\"../../semiImages/portugal_bizew.jpg\" alt=\"\" /></a>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("<!-----------------------------------------------------------------  -->\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"country2\">\r\n");
      out.write("\t<img src=\"../../semiImages/korea.jpg\" alt=\"\" />\r\n");
      out.write("\t\r\n");
      out.write("\t<div id=\"korea\">\r\n");
      out.write("\t<a href=\"/edgeliving/project/product/prodlist.jsp?cate_no=9\"><img src=\"../../semiImages/bonita_masterclass.jpg\" alt=\"\" /></a>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t</div>\t\r\n");
      out.write("\t\r\n");
      out.write("<!-----------------------------------------------------------------  -->\t\r\n");
      out.write("</div>\r\n");
      out.write("</div>\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<div id=\"blank\"></div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    \t");
 String WebURL2 = "/edgeliving";
      out.write("\r\n");
      out.write("<div id=\"footer\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div class=\"footdiv\">\r\n");
      out.write("\t\t\t<div class=\"footText\"> 고객센터</div>\r\n");
      out.write("\t\t\t<div class=\"footPhone\"> 031-904-8072 </div>\r\n");
      out.write("\t\t\t<div>\r\n");
      out.write("\t\t\t\t<div class=\"footTimeImgDiv\">\r\n");
      out.write("\t\t\t\t<img src=\"");
      out.print(WebURL2 );
      out.write("/semiImages/logo.jpg\" alt=\"footTimelogo.jpg\"  id=\"footTimelogo\"/>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"footPdiv\">\r\n");
      out.write("\t\t\t\t<p class=\"footPtag\"><strong>평일</strong>오전 10시 ~ 오후 5시</p>\r\n");
      out.write("\t\t\t\t <p class=\"footPtag\"><strong>점심</strong>오전 12시 ~ 오후 1시</p>\r\n");
      out.write("\t\t\t\t <p class=\"footPtag\"><strong>휴무</strong>토/일/공휴일은 휴무</p>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div class=\"footdiv\">\r\n");
      out.write("\t\t\t<div class=\"footText\"> 카카오톡 문의</div>\r\n");
      out.write("\t\t\t<div class=\"footPhone\"><a href=\"#\"> 카카오톡 문의하기 </a></div>\r\n");
      out.write("\t\t\t<div>\r\n");
      out.write("\t\t\t\t<div class=\"footTimeImgDiv\">\r\n");
      out.write("\t\t\t\t<img src=\"");
      out.print(WebURL2 );
      out.write("/semiImages/logo.jpg\" alt=\"footTimelogo.jpg\"  id=\"footTimelogo\"/>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"footPdiv\">\r\n");
      out.write("\t\t\t\t <p class=\"footPtag\"><strong>평일</strong>오전 10시 ~ 오후 5시</p>\r\n");
      out.write("\t\t\t\t <p class=\"footPtag\"><strong>점심</strong>오전 12시 ~ 오후 1시</p>\r\n");
      out.write("\t\t\t\t <p class=\"footPtag\"><strong>휴무</strong>토/일/공휴일은 휴무</p>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t<div class=\"footdiv\">\r\n");
      out.write("\t\t\t<div class=\"footText\"> 도매 대량구매 문의</div>\r\n");
      out.write("\t\t\t<div class=\"footPhone\"> 031-904-8072 </div>\r\n");
      out.write("\t\t\t<div>\r\n");
      out.write("\t\t\t\t<div class=\"footTimeImgDiv\">\r\n");
      out.write("\t\t\t\t<img src=\"");
      out.print(WebURL2 );
      out.write("/semiImages/logo.jpg\" alt=\"footTimelogo.jpg\"  id=\"footTimelogo\"/>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"footPdiv\">\r\n");
      out.write("\t\t\t\t <p class=\"footPtag\"><strong>평일</strong>오전 10시 ~ 오후 5시</p>\r\n");
      out.write("\t\t\t\t <p class=\"footPtag\"><strong>점심</strong>오전 12시 ~ 오후 1시</p>\r\n");
      out.write("\t\t\t\t <p class=\"footPtag\"><strong>휴무</strong>토/일/공휴일은 휴무</p>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t<div class=\"footdiv\">\r\n");
      out.write("\t\t\t<div class=\"footText\"> 1:1 문의</div>\r\n");
      out.write("\t\t\t<div class=\"footPhone\"><a href=\"");
      out.print(WebURL2 );
      out.write("/project/board/question_list_board.jsp\"> 1:1 문의하기 > </a></div>\r\n");
      out.write("\t\t\t<div>\r\n");
      out.write("\t\t\t\t<div class=\"footTimeImgDiv\">\r\n");
      out.write("\t\t\t\t<img src=\"");
      out.print(WebURL2 );
      out.write("/semiImages/logo.jpg\" alt=\"footTimelogo.jpg\"  id=\"footTimelogo\"/>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"footPdiv\">\r\n");
      out.write("\t\t\t\t <p class=\"footPtag\">궁금한 점이 있으신가요?</p>\r\n");
      out.write("\t\t\t\t <p class=\"footPtag\">1:1 문의에 남겨주시면 </p>\r\n");
      out.write("\t\t\t\t <p class=\"footPtag\">친절히 답변 드리겠습니다.</p>\r\n");
      out.write("\t\t\t\t \r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div id=\"footUldiv\">\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<ul id=\"footUl\">\r\n");
      out.write("\t\t\t\t<li class=\"footli\"><a href=\"#\" class=\"footmenu\">회사소개</a></li>\r\n");
      out.write("\t\t\t\t<li class=\"footli\"><a href=\"#\" class=\"footmenu\">이용안내</a></li>\r\n");
      out.write("\t\t\t\t<li class=\"footli\"><a href=\"/edgeliving/project/policy/policy_info.jsp\" class=\"footmenu\">개인정보취급방침</a></li>\r\n");
      out.write("\t\t\t\t<li class=\"footli\"><a href=\"/edgeliving/project/policy/policy_use.jsp\" class=\"footmenu\">이용약관</a></li>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div id=\"footText\">\r\n");
      out.write("\t\t\t<ul id=\"footUl2\">\r\n");
      out.write("\t\t\t\t<li class=\"footli2\"> 법인명(상호) : <strong>주식회사 반장조</strong></li>\r\n");
      out.write("\t\t\t\t<li class=\"footli2\"> 대표자(성명) : 전누리 </li>\r\n");
      out.write("\t\t\t\t<li class=\"footli2\"> 개인정보보호책임자 : 김소현(김소현@naver.com)</li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div id=\"footText2\">\r\n");
      out.write("\t\t\t<ul id=\"footUl3\">\r\n");
      out.write("\t\t\t\t<li class=\"footli3\"> 사업자등록번호 : <strong>111-22-333333</strong></li>\r\n");
      out.write("\t\t\t\t<li class=\"footli3\"> 통신판매번호 : 2019-디아망-1234 </li>\r\n");
      out.write("\t\t\t\t<li class=\"footli3\"> 주소 : 서울특별시 종로구 율곡로10길 105 4층 중앙HTA</li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t</div>");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
