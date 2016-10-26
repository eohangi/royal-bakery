package project.jsp.bakery.controller.member;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Member;
import project.jsp.bakery.service.MemberService;
import project.jsp.bakery.service.impl.MemberServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.MailHelper;
import project.jsp.helper.Util;
import project.jsp.helper.WebHelper;

/**
 * Servlet implementation class FindPwOk
 */
@WebServlet("/member/FindPwOk.do")
public class FindPwOk extends BaseController {
	private static final long serialVersionUID = -1384505874053364104L;
	/**객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	MailHelper mail;
	Util util;
	MemberService memberService;
	

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**객체 생성*/
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		mail = MailHelper.getInstance();
		util = Util.getInstance();
		memberService = new MemberServiceImpl(logger, sqlSession);
		/**로그인 여부 검사*/
		//로그인 중이라면 이 페이지를 이용할 수 없다
		if(web.getSession("loginInfo") != null){
			sqlSession.close();
			web.redirect(web.getRootPath() + "/MainIndex.do", "이미 로그인 중입니다.");
			return null;
		}
		
		
		/**파라미터 받기*/
		//입력된 메일 주소를 받는다.
		String email = web.getString("email");
		logger.debug("로거.email from FindPwOk =" + email);
		if(email == null){
			sqlSession.close();
			web.redirect(null, "이메일 주소를 입력해주세요");
			return null;
		}
		
		/**임시 비번 생성*/
		String newPassword = Util.getInstance().getRandomPassword();
		
		/**입력값을 자바 빈즈에 저장*/
		Member member = new Member();
		member.setEmail(email);
		member.setMem_pw(newPassword);
		
		/**서비스를 통한 비밀번호 갱신*/
		try {
			memberService.updateMemberPasswordByEmail(member);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			e.getStackTrace();
			return null;
		} finally {
			sqlSession.close();
		}
		/**발급된 비번을 메일로 발송*/
		String sender = "Admin@RoyalBakery.com";
		String subject = "회원님의 RoYal BaKery새로운 비밀번호 안내";
		String content = "회원님의 새 비밀번호 <strong>" + newPassword + "</strong>입니다.";
		try {
			//사용자가 입력한 메일주소를 수신자로 설정하여 메일 발송하기
			mail.sendMail(sender, email, subject, content);
			logger.debug("보내는사람" + sender + "이메일"+email+ "받는사람"+subject + "내용"+content);
		} catch (MessagingException e) {
			e.printStackTrace();
			web.redirect(null, "메일발송에 실패,관리자에게 문의바랍니다.");
			return null;
		}
		/**결과 페이지 이동*/
		//여기서는 이전 페이지로 이동함
		web.redirect(null, "새로운 비밀번호발급 성공");
		return null;
	}


}
