<%@page import="mail.SMTPAuthenticator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>

<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



	<%
	request.setCharacterEncoding("UTF-8");
	//받는사람
	String id = request.getParameter("findPw_id");
	String email = request.getParameter("findPw_email");
	session.setAttribute("id", id);
	
	/* MailSender ms = new MailSender();
	ms.makeNumber(email);
	
	String pw = ms.getPassword();
	ms.updatePassword(pw); */
	
	SMTPAuthenticator sa = new SMTPAuthenticator();
	Authenticator auth = sa;

	 
	 //랜덤키값
		int key  = (int)(Math.random()*1000000);
		session.setAttribute("key", key);
		
	//보내는 사람 ID : 
	String from = sa.getId() + "@naver.com";	
	String subject = "비밀번호 찾기 인증키 발송해 드립니다";
	
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberVO> list = dao.getAll();
	
	System.out.println("id : "+id+"  email : "+ email);
	
	for(MemberVO vo : list){
		if(vo.getId().equals(id) && vo.getEmail().equals(email)){
			//System.out.println("for문 void : "+vo.getId()+" voemail : "+ vo.getEmail());
	
	String content = "<p>아래의 인증키를 인증 페이지에 입력해 주세요</p>";
	content +="<h1> 인증키 : "+key+"입니다</h1>";
	
	
	Properties p = new Properties(); // 정보를 담을 객체 
	
	p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", 
				"javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	


		Session ses = Session.getInstance(p, auth);

		ses.setDebug(true);

		//메일의 내용을 담을 객체
		MimeMessage msg = new MimeMessage(ses);

		msg.setSubject(subject);

		//javax.mail.Address
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr); //보내는사람

		Address toAddr = new InternetAddress(email);
		//받는사람
		msg.addRecipient(Message.RecipientType.TO, toAddr);

		//내용과 인코딩
		msg.setContent(content, "text/html;charset=UTF-8");
		
		Transport.send(msg);
		
		}
	}
		out.println(key);
	%>	
		
	

	
	
	
