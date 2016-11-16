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
import project.jsp.helper.WebHelper;


@WebServlet("/cart/CartItemDelete.do")
public class CartItemDelete extends BaseController {

	private static final long serialVersionUID = 1365458693893568626L;

	WebHelper web;
	SqlSession sqlSession;
	Logger logger;
	cart cart;
	CartService cartService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		web = WebHelper.getInstance(request, response);
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		cart = new cart();
		cartService = new CartServiceImpl(sqlSession, logger);
		Member loginInfo = (Member) web.getSession("loginInfo");

		System.out.println("loginInfo=" + loginInfo);
	
		/** 3. data값 받기 */
		int id = web.getInt("id"); // 제품 id
		System.out.println("id=" + id);
		request.setAttribute("id", id);

		cart.setId(id);
		String rt = "FAIL";

		logger.debug("[DEBUG] id =" + id);
		cart.setMemberId(loginInfo.getId());

		cart myCart = new cart();
		myCart.setMemberId(loginInfo.getId());
		
		List<cart> cartlist = null;
		List<cart> cartlist2 = null;
		try {
			logger.debug("[DEBUG] : cart =" + cart.toString());
	
			cartService.deleteCartItem(cart);

			cartlist = cartService.selectCartProMemberId(myCart);
			System.out.println("cartlist=" + cartlist);
			cartlist2 = cartService.selectCartCuMemberId(myCart);

		} catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		for (int i = 0; i < cartlist.size(); i++) {
			System.out.println(cartlist.get(i));
		}

		for (int z = 0; z < cartlist2.size(); z++) {
			System.out.println(cartlist2.get(z));
		}

		request.setAttribute("loginInfo", loginInfo.getId());

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", rt);
		data.put("item", cartlist);
		data.put("item2", cartlist2);

		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);

		return null;
	}

}
