package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator // javax.mail임
{
	String id = "wjsalfl"; // 네이버 아이디  구글도됨
	String password = "zopasw1357"; // 네이버 패스워드 구글도됨
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		// SMTP 서버에 보낼 인증 id, pw 객체 리턴
		return new PasswordAuthentication(id, password);
	}

	public String getId() {
		return id;
	}
	
	
	
	
}
