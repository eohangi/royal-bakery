package project.jsp.bakery.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Member;
import project.jsp.helper.BaseController;
import project.jsp.helper.WebHelper;

/** 관리자의 인덱스 페이지처럼 구동한다.*/


@WebServlet("/member/ADMINCLIENTINFO.do")
public class AdminClientInfo extends BaseController {
	private static final long serialVersionUID = 1964852046993498244L;
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	SqlSession sqlSession;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		web = WebHelper.getInstance(request, response);
		sqlSession = MyBatisConnectionFactory.getSqlSession();

		Member loginInfo = (Member) web.getSession("loginInfo");
		/** (3) 로그인 여부 검사 */
		// 로그인 중이라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			sqlSession.close();
		}
		/**(4)게시판 목록받기*/
		/**(5)회원목록받기*/

		System.out.println("loginInfo=" + loginInfo);

		// "/WEB-INF/views/index.jsp"파일을 View로 사용한다.
		return "1Admin_client_info";
	}
}
