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
import project.jsp.helper.RegexHelper;
import project.jsp.helper.WebHelper;

/**
 * Servlet implementation class FindPwOk
 */
@WebServlet("/member/thirdstepforedit.do")
public class thirdstepforedit extends BaseController {
	private static final long serialVersionUID = 2043125201428163394L;
	
	/**객체선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	MemberService memberService;
	RegexHelper regex;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		/**객체 생성*/
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		memberService = new MemberServiceImpl(logger, sqlSession);
		
		/**변경값 파라미터 받기*/
		String memId = web.getString("mem_id");
		String name = web.getString("mem_name");
		String email = web.getString("email");
		String tel = web.getString("phone_no");
		String birthdate = web.getString("birthdate");
		String postcode = web.getString("postcode");
		String addr1 = web.getString("addr1");
		String addr2 = web.getString("addr2");
		String gender = web.getString("gender");
		String regDate = web.getString("reg_date");
		//로그출력
		System.out.println("변경된값>>>>>>>>>>>>>>>>>>>>>>>>");
		logger.debug("아이디=" + memId);
		logger.debug("이름=" + name);
		logger.debug("이메일=" + email);
		logger.debug("전번=" + tel);
		logger.debug("생일=" + birthdate);
		logger.debug("우편=" + postcode);
		logger.debug("주소1=" + addr1);
		logger.debug("주소2=" + addr2);
		logger.debug("성별=" + gender);
		logger.debug("가입일자=" + regDate);
		
		//유효성 검사
		// 이름 검사
		if (!regex.isValue(name)) {
			sqlSession.close();
			web.redirect(null, "이름을 입력하세요.");
			return null;
		}

		if (!regex.isKor(name)) {
			sqlSession.close();
			web.redirect(null, "이름은 한글만 입력 가능합니다.");
			return null;
		}

		if (name.length() < 2 || name.length() > 5) {
			sqlSession.close();
			web.redirect(null, "이름은 2~5글자 까지만 가능합니다.");
			return null;
		}

		// 이메일 검사
		if (!regex.isValue(email)) {
			sqlSession.close();
			web.redirect(null, "이메일을 입력하세요.");
			return null;
		}

		if (!regex.isEmail(email)) {
			sqlSession.close();
			web.redirect(null, "이메일의 형식이 잘못되었습니다.");
			return null;
		}

		// 연락처 검사
		if (!regex.isValue(tel)) {
			sqlSession.close();
			web.redirect(null, "연락처를 입력하세요.");
			return null;
		}

		if (!regex.isCellPhone(tel) && !regex.isTel(tel)) {
			sqlSession.close();
			web.redirect(null, "연락처의 형식이 잘못되었습니다.");
			return null;
		}

		// 생년월일 검사
		if (!regex.isValue(birthdate)) {
			sqlSession.close();
			web.redirect(null, "생년월일을 입력하세요.");
			return null;
		}
		
		
		/** (7) 전달받은 파라미터를 Beans 객체에 담는다. */
		Member member = new Member();
		member.setMem_id(memId);
		member.setMem_name(name);
		member.setEmail(email);
		member.setPhone_no(tel);
		member.setBirthdate(birthdate);
		member.setPostcode(postcode);
		member.setAddr1(addr1);
		member.setAddr2(addr2);
		member.setGender(gender);
		member.setReg_date(regDate);

		/** (8) Service를 통한 데이터베이스 저장 처리 */
		try {
			memberService.updateMember(member);
			logger.debug("저장될 값>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + member.toString());
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			// 예외가 발생한 경우이므로, 더이상 진행하지 않는다.
			return null;
		}

		/** 페이지 이동*/
		sqlSession.close();
		web.redirect(web.getRootPath() + "/MainIndex.do", "정보 수정이 성공적으로 완료되었습니다.");

		return null;
	}

}
