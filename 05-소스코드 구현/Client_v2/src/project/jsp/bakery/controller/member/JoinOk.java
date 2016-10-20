package project.jsp.bakery.controller.member;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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
import project.jsp.helper.FileInfo;
import project.jsp.helper.RegexHelper;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

@WebServlet("/member/JoinOk.do")
public class JoinOk extends BaseController {
	private static final long serialVersionUID = 7756333457639528441L;
	/**(1)사용하고자 하는 Helper+ Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	UploadHelper upload;
	MemberService memberService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		/**(2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		upload = UploadHelper.getInstance();
		//회원가입 처리를 위한 Service객체
		memberService = new MemberServiceImpl(logger, sqlSession);
		
		/** (3) 로그인 여부 검사 */
		// 로그인 중이라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") != null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/MainIndex1.do", "이미 로그인 하셨습니다.");
			return null;
		}
			
		
		String userId = web.getString("mem_id");
		String userPw = web.getString("mem_pw");
		String userPwre = web.getString("mem_pw_re");
		String name = web.getString("mem_name");
		String email = web.getString("email");
		String tel = web.getString("phone_no");
		String birthdate = web.getString("birthdate");
		String gender = web.getString("gender");
		String postcode = web.getString("postcode");
		String addr1 = web.getString("addr1");
		String addr2 = web.getString("addr2");
		
		
		//전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인
		logger.debug("userId=" + userId);
		logger.debug("userPw=" + userPw);
		logger.debug("userPwre=" + userPwre);
		logger.debug("name=" + name);
		logger.debug("email=" + email);
		logger.debug("tel=" + tel);
		logger.debug("birthdate=" + birthdate);
		logger.debug("gender=" + gender);
		logger.debug("postcode=" + postcode);
		logger.debug("addr1=" + addr1);
		logger.debug("addr2=" + addr2);
		
		/** (5) 입력값의 유효성 검사 */
		// 아이디 검사
		if (!regex.isValue(userId)) {
			sqlSession.close();
			web.redirect(null, "아이디를 입력하세요.");
			return null;
		}

		if (!regex.isEngNum(userId)) {
			sqlSession.close();
			web.redirect(null, "아이디는 숫자와 영문의 조합으로 20자까지만 가능합니다.");
			return null;
		}

		if (userId.length() > 20) {
			sqlSession.close();
			web.redirect(null, "아이디는 숫자와 영문의 조합으로 20자까지만 가능합니다.");
			return null;
		}

		// 비밀번호 검사
		if (!regex.isValue(userPw)) {
			sqlSession.close();
			web.redirect(null, "비밀번호를 입력하세요.");
			return null;
		}

		if (!regex.isEngNum(userPw)) {
			sqlSession.close();
			web.redirect(null, "비밀번호는 숫자와 영문의 조합으로 20자까지만 가능합니다.");
			return null;
		}

		if (userPw.length() > 20) {
			sqlSession.close();
			web.redirect(null, "비밀번호는 숫자와 영문의 조합으로 20자까지만 가능합니다.");
			return null;
		}

		// 비밀번호 확인
		if (!userPw.equals(userPwre)) {
			sqlSession.close();
			web.redirect(null, "비밀번호 확인이 잘못되었습니다.");
			return null;
		}

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

		// 성별검사
		if (!regex.isValue(gender)) {
			sqlSession.close();
			web.redirect(null, "성별을 입력하세요.");
			return null;
		}

		if (!gender.equals("M") && !gender.equals("F")) {
			sqlSession.close();
			web.redirect(null, "성별이 잘못되었습니다.");
			return null;
		}

		/** (7) 전달받은 파라미터를 Beans 객체에 담는다. */
		Member member = new Member();
		member.setMem_id(userId);
		member.setMem_pw(userPw);
		member.setMem_name(name);
		member.setEmail(email);
		member.setPhone_no(tel);
		member.setBirthdate(birthdate);
		member.setGender(gender);
		member.setPostcode(postcode);
		member.setAddr1(addr1);
		member.setAddr2(addr2);

		/** (8) Service를 통한 데이터베이스 저장 처리 */
		try {
			memberService.insertMember(member);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			// 예외가 발생한 경우이므로, 더이상 진행하지 않는다.
			return null;
		}

		/** (9) 가입이 완료되었으므로 메인페이지로 이동 */
		sqlSession.close();
		web.redirect(web.getRootPath() + "/MainIndex1.do", "회원가입이 완료되었습니다. 로그인 해 주세요.");

		// INSERT,UPDATE,DELETE 처리를 수행하는 action 페이지들은
		// 자체적으로 View를 갖지 않고 결과를 확인할 수 있는
		// 다른 페이지로 강제 이동시켜야 한다. (중복실행 방지)
		// 그러므로 View의 경로를 리턴하지 않는다.
		return null;
	}
	
}
