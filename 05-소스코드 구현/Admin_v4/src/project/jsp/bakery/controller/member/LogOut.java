package project.jsp.bakery.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.jsp.bakery.model.Member;
import project.jsp.helper.BaseController;
import project.jsp.helper.WebHelper;

@WebServlet("/ADMINLOGOUT.do")
public class LogOut extends BaseController {
	
	private static final long serialVersionUID = -2660471800687223687L;
	/** 1)사용하고자 하는 Helper+ Service 객체 선언 */
	WebHelper web;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		/** 2)필요한 헬퍼 객체 생성 */
		web = WebHelper.getInstance(request, response);
		
		
		/** 3) 로그인 여부 검사 */
		// 로그인중인 회원 정보 가져오기
		Member loginInfo = (Member) web.getSession("loginInfo");
		// 로그인중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (loginInfo == null) {
			web.redirect(web.getRootPath() + "/ADMINLOGIN.do", "로그인 후에 이용 가능합니다.");
			return null;
		}
		
		
		/** 4) 로그아웃 */
		// 로그아웃은 모든 세션 정보를 삭제하는 처리
		web.removeAllSession();
		
		
		/** 5) 페이지 이동 */
		web.redirect(web.getRootPath() + "/ADMINLOGIN.do", "로그아웃 하셨습니다.");

		return null;
	}

}
