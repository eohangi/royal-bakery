package project.jsp.helper;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * 메일 서버에 대한 인증 정보를 리턴해 주기 위한 클래스 
 */
public class SMTPAuthenticator extends Authenticator {
	/**
	 * 메일 발송시 계정 정보를 리턴해 주는 역할을 한다.
	 */
	@Override
    public PasswordAuthentication getPasswordAuthentication() {
		// 자신의 Gmail 메일 주소와 비밀번호 입력.
        return new PasswordAuthentication("positivenum@gmail.com", "0180qwer");
    }
}