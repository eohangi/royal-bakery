package project.jsp.bakery.controller.cart;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import com.fasterxml.jackson.databind.ObjectMapper;
import project.jsp.bakery.dao.MyBatisConnectionFactory;
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

	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	CartService cartService;
	RegexHelper regex;
	PageHelper pageHelper;
	UploadHelper upload;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 페이지 형식을 JSON으로 설정한다.
		response.setContentType("application/json");

		logger = LogManager.getFormatterLogger(request.getRequestURI());
		web = WebHelper.getInstance(request, response);
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		regex = RegexHelper.getInstance();
		cartService = new CartServiceImpl(sqlSession, logger);

		pageHelper = PageHelper.getInstance();

		upload = UploadHelper.getInstance();

		Member loginInfo = (Member) web.getSession("loginInfo");
		/** (3) 로그인 여부 검사 */
		// 로그인 중이라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			sqlSession.close();
			web.printJsonRt("Not_Login");
			return null;
		}

		System.out.println("loginInfo=" + loginInfo);

		cart cart = new cart();
		cart.setMemberId(web.getInt("memberId"));
		cart.setMemberId(loginInfo.getId());

		System.out.println(cart);
		List<cart> cartlist = null;
		List<cart> cartlist2 = null;
		try {
			cartlist = cartService.selectCartProMemberId(cart);
			System.out.println("cartlist=" + cartlist);
			cartlist2 = cartService.selectCartCuMemberId(cart);
		} catch (Exception e) {

			web.printJsonRt("Data_fail");
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

		// ** 처리 결과를 JSON으로 출력하기 *//*
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("item", cartlist);
		data.put("item2", cartlist2);

		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		return null;
	}

}
