package project.jsp.bakery.controller.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.jsp.helper.BaseController;
import project.jsp.helper.WebHelper;

@WebServlet("/GOADDPRODUCT.do")
public class Productadd1 extends BaseController {
	private static final long serialVersionUID = 3328750502580610369L;
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		web = WebHelper.getInstance(request, response);
		
		/** (3) 로그인 여부 검사 */
		// 로그인 중이아니라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/1Adminclientinfo.do", "로그인하세요");
			return null;
		}
		
		return "/3Admin_product_add";
	}
	
}
