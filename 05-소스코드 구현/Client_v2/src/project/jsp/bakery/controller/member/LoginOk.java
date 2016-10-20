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
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

@WebServlet("/member/LoginOk.do")
public class LoginOk extends BaseController {
	private static final long serialVersionUID = -6153454275069476233L;
	/** 1)사용하고자 하는 Helper + Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	MemberService memberService;
	UploadHelper upload;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		/** 2)사용하고자 하는 Helper + service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		memberService = new MemberServiceImpl(logger, sqlSession);
		upload = UploadHelper.getInstance();

		/** 3)로그인 여부 검사 */
		// 로그인 중이라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") != null) {
			// 이미 sqlsession객체를 생성했으므로,데이터 베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "index.do", "이미 로그인 하셨습니다.");
			return null;
		}

		/** 4)파라미터 처리 */
		// topbar.jsp에 배치된 폼으로부터 전송되는 입력값;
		String userId = web.getString("mem_id");
		String userPw = web.getString("mem_pw");

		logger.debug("mem_id=" + userId);
		logger.debug("mem_pw=" + userPw);

		if (userId == null || userPw == null) {
			sqlSession.close();
			web.redirect(null, "아이디,비번 입력값이 없다");
			return null;
		}
		/** 5)전달받은 파라미터를 beans에 설정한다. */
		Member member = new Member();
		member.setMem_id(userId);
		member.setMem_pw(userPw);
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
		
		
		
		/**
		 * 7)프로필 이미지 처리 //프로필 이미지가 있을 경우 썸네일을 생성하여 쿠키에 별도로 저장 String profileImg
		 * = loginInfo.getProfile_img(); if(profileImg != null){ try{ String
		 * profileThumbnail = upload.createThumbnail(profileImg, 40, 40, true);
		 * web.setCookie("profileThumbnail", profileThumbnail, -1); }catch
		 * (Exception e){ web.redirect(null, e.getLocalizedMessage()); return
		 * null; } }
		 */
		
		
		
		/** 8)조회된 회원 정보를 세션에 저장 */
		// 로그인 처리는 아이디와 비밀번호를 기반으로 조회된 정보를
		// 세션에 보관하는 과정을 말한다.
		// 로그인에 대한 판별은 저장된 세션정보의 존재여부로 판별한다.
		web.setSession("loginInfo", loginInfo);
		logger.debug("login : " + loginInfo.toString());
		
		
		/** 9)페이지 이동 */
		// 이전 페이지 구하기(javascript로 이동된 경우 조회 안됨)
		String movePage = request.getHeader("referer");
		if (movePage == null) {
			movePage = web.getRootPath() + "/MainIndex1.do";
		}
		sqlSession.close();
		web.redirect(movePage, null);
		return null;

	}

}
