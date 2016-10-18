package project.jsp.helper;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailHelper {
	// ----------- 싱글톤 객체 생성 시작 ----------
	private static MailHelper current = null;

	public static MailHelper getInstance() {
		if (current == null) {
			current = new MailHelper();
		}
		return current;
	}

	public static void freeInstance() {
		current = null;
	}

	private MailHelper() {
		super();
	}
	// ----------- 싱글톤 객체 생성 끝 ----------

	/**
	 * 메일을 발송한다.
	 * @param sender - 발송자 메일 주소
	 * @param receiver - 수신자 메일 주소
	 * @param subject - 제목
	 * @param content - 내용
	 * @throws MessagingException
	 */
	// --> import javax.mail.MessagingException;
	public void sendMail(String sender, String receiver, String subject, String content) 
			throws MessagingException {

		/** 메일 발송 환경설정 */
		// 발송 정보를 담기 위한 객체
		// --> import java.util.Properties;
		Properties p = new Properties();

		// 본인의 Gmail 주소로 계정 설정
		p.put("mail.smtp.user", "자신의 Gmail 주소");

		// Google SMTP 서버 정보 설정 
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465");

		// 아래 정보는 수정하지 마세요.
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		/** 미리 준비한 SMTPAuthenticator클래스에 대한 인증정보 객체 생성 */
		// helper 패키지에 준비한 인증정보 리턴 기능을 갖는 클래스의 객체 생성
		// --> import javax.mail.Authenticator;
		Authenticator auth = new SMTPAuthenticator();

		/** 인증정보와 설정정보를 하나로 묶어서 메일서버에 대한 세션객체 생성 */
		// --> import javax.mail.Session;
		Session ses = Session.getInstance(p, auth);

		// 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
		ses.setDebug(true);

		/** 세션을 포함하는 메시지 객체 생성 --> 발신주소,수신주소,제목,내용 설정 */
		// 메일의 내용을 담기 위한 객체
		// --> import javax.mail.internet.MimeMessage;
		MimeMessage msg = new MimeMessage(ses);

		// 제목 설정
		msg.setSubject(subject);

		// 보내는 사람의 메일주소
		// --> import javax.mail.Address;
		Address fromAddr = new InternetAddress(sender);
		msg.setFrom(fromAddr);

		// 받는 사람의 메일주소
		Address toAddr = new InternetAddress(receiver);
		// --> import javax.mail.Message;
		msg.addRecipient(Message.RecipientType.TO, toAddr);

		// 메시지 본문의 내용과 형식, 캐릭터 셋 설정
		msg.setContent(content, "text/html;charset=UTF-8");

		/** 메일 발송하기 */
		// --> import javax.mail.Transport;
		Transport.send(msg);

	}
}
