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
public class FindIdOk extends BaseController {
	private static final long serialVersionUID = -6369564966520623972L;
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
			web.redirect(web.getRootPath() + "/MainIndex1.do", "이미 로그인 중입니다.");
			return null;
		}

		/**파라미터 받기*/
		String memname = web.getString("mem_name");
		String email = web.getString("email");
		logger.debug("로거.mem_name from FindIdOk = " + memname);
		logger.debug("로거.email from FindIdOk =" + email);
		if(email == null || memname == null){
			sqlSession.close();
			web.redirect(null, "필수 입력사항을 확인해주세요.");
			return null;
		}
		
		/**입력값을 자바 빈즈에 저장*/
		Member member = new Member();
		member.setEmail(email);
		member.setMem_name(memname);
		logger.debug("Email from FindIdOk = " + email + "name from FindIdOk" + memname);
		
		/** 6)service를 통한 회원 인증 */
		Member loginInfo = null;
		// 아이디와 비번이 일치하는 회원정보를 조회하여 리턴한다.
		try {
			loginInfo = memberService.selectLogInfo(member);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/**서비스를 통한 입력값 조회*/
		try {
			memberService.selectCountByNameEmail(member);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			e.getStackTrace();
			return null;
		} finally {
			sqlSession.close();
		}
		
		
		web.redirect(null, "새로운 비밀번호발급 성공");
		return null;
	}


}
