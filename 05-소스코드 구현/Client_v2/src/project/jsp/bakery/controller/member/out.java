package project.jsp.bakery.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.jsp.helper.BaseController;
import project.jsp.helper.WebHelper;

/**비번 입력 페이지의 컨트롤러*/
@WebServlet("/member/Out.do")
public class out extends BaseController {

	private static final long serialVersionUID = 9050235882240253557L;
	/**사용하고자 하는 헬퍼 객체 선언*/
	WebHelper web;
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**헬퍼 객체 생성*/
		web = WebHelper.getInstance(request, response);
		
		/**로그인 여부 검사*/
		//로그인 중이아니라면 이 페이지를 이용할 수 없다.
		if(web.getSession("loginInfo") == null){
			web.redirect(web.getRootPath() + "/MainIndex1.do", "로그인 해주세요.");
			return null;
		}
		
		/**사용할 View의 이름 리턴*/
		return "/view/member/out";
	}
	
}
