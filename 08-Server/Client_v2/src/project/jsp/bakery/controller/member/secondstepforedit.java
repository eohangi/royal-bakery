package project.jsp.bakery.controller.member;

import java.io.IOException;

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
import project.jsp.helper.WebHelper;

/**
 * Servlet implementation class FindPwOk
 */
@WebServlet("/member/secondstepforedit.do")
public class secondstepforedit extends BaseController {
	private static final long serialVersionUID = 2043125201428163394L;
	
	/**객체선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	MemberService memberService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		/**객체 생성*/
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		memberService = new MemberServiceImpl(logger, sqlSession);
		
		/**로그인 중일 때 만 이 기능을 이용 가능하다.*/
		if(web.getSession("loginInfo") == null){
			sqlSession.close();
			web.redirect(web.getRootPath() + "/MainIndex.do", "로그인 후에 이용 가능합니다.");
			return null;
		}
		
		/**비밀번호 파라미터 받기*/
		String memberPw = web.getString("mem_pw");
		logger.debug("jsp에서 날라온 비밀번호>>>>>>>>>>>>>>>>>" + memberPw);
		
		if(memberPw == null){
			sqlSession.close();
			web.redirect(null, "비밀번호를 입력하세요");
			return null;
		}
		//아이디랑 비번을 빈즈로
		Member loginInfo = (Member) web.getSession("loginInfo");
		Member member = new Member();
		member.setMem_id(loginInfo.getMem_id());
		member.setMem_pw(memberPw);
		
		//해당 아이디의 회원정보 조회
		try {
			loginInfo = memberService.selectLogInfo(member);
			logger.debug("회원정보 조회한 값>>>>>>>>>>>>>>>>" + loginInfo);
		} catch (Exception e) {
			e.printStackTrace();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		//조회한 값을 뷰로 넘겨야 해.
		request.setAttribute("memberInfo", loginInfo);
		
		//페이지 이동
		return "/member/InformationUpdate";
	}
	

}
