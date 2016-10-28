package project.jsp.bakery.controller.cart;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Custom;
import project.jsp.bakery.model.Member;
import project.jsp.bakery.model.cart;
import project.jsp.bakery.service.CartService;
import project.jsp.bakery.service.impl.CartServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.PageHelper;
import project.jsp.helper.RegexHelper;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

@WebServlet("/cart/Cart.do")
public class CartPage extends BaseController {

	private static final long serialVersionUID = 4208114428968364694L;
	/**
	 * 특정 카테고리에 대한 상위 n개의 게시물 가져오기
	 * 
	 * @param category
	 *            - 가져올 카테고리
	 * @param listCount
	 *            - 가져올 게시물 수
	 * @return
	 * @throws Exception
	 */

	/** (1) 사용하고자 하는 Helper + Service 객체 선언 */
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;

	CartService cartService;

	RegexHelper regex;

	PageHelper pageHelper;
	// --> import study.jsp.helper.Upload;
	UploadHelper upload;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		web = WebHelper.getInstance(request, response);
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		regex = RegexHelper.getInstance();
		// --> import study.jsp.mysite.service.impl.BbsDocumentServiceImpl;
		cartService = new CartServiceImpl(sqlSession, logger);

		pageHelper = PageHelper.getInstance();

		upload = UploadHelper.getInstance();

		Member loginInfo = (Member) web.getSession("loginInfo");
		/** (3) 로그인 여부 검사 */
		// 로그인 중이라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			sqlSession.close();
			web.redirect(web.getRootPath() + "/member/Login.do", "로그인을 먼저 해주세요.");
			return null;
		}

		System.out.println("loginInfo=" + loginInfo);

		cart cart = new cart();
		cart.setMemberId(loginInfo.getId());
		System.out.println(cart);
		List<cart> cartlist = null;
	/*	System.out.println("cartlist=" + cartlist);*/
		List<cart> cartlist2 = null;
		try {
			cartlist = cartService.selectCartProMemberId(cart);
			System.out.println("cartlist=" + cartlist);
			cartlist2 = cartService.selectCartCuMemberId(cart);
		} catch (Exception e) {
			// TODO: handle exception
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		System.out.println("cartlist=" + cartlist);
		for (int i = 0; i < cartlist.size(); i++) {
			System.out.println(cartlist.get(i));
		}

		for (int z = 0; z < cartlist2.size(); z++) {
			System.out.println(cartlist2.get(z));
		}

		request.setAttribute("loginInfo", loginInfo.getId());

		request.setAttribute("cartlist", cartlist);
		request.setAttribute("cartlist2", cartlist2);
		String view = "cart/Cart";

		// "/WEB-INF/views/index.jsp"파일을 View로 사용한다.
		return view;
	}

}
