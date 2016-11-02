package project.jsp.bakery.controller.product;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Member;
import project.jsp.bakery.model.Product;
import project.jsp.bakery.model.cart;
import project.jsp.bakery.service.CartService;
import project.jsp.bakery.service.ProductService;
import project.jsp.bakery.service.impl.CartServiceImpl;
import project.jsp.bakery.service.impl.ProductServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.WebHelper;

/**
 * Servlet implementation class ProductCartDelete
 */
@WebServlet("/product/productCartDelete.do")
public class ProductCartDelete extends BaseController {

	private static final long serialVersionUID = 1365458693893568626L;

	/** 1. 사용할 Helper */

	WebHelper web;
	SqlSession sqlSession;
	Logger logger;
	cart cart;
	CartService cartService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** 2. 객체생성+page형식 지정 */

		web = WebHelper.getInstance(request, response);
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		cart = new cart();
		cartService = new CartServiceImpl(sqlSession, logger);
		Member loginInfo = (Member) web.getSession("loginInfo");

		/*
		 * //Page형식을 JSON으로 지정 response.setContentType("application/json");
		 */

		/** 3. data값 받기 */
		int proId = web.getInt("proId"); // 제품 id
		request.setAttribute("proId", proId);

		String rt = "FAIL";

		logger.debug("[DEBUG] proId =" + proId);

		/** 4. cart에 조건값 저장 */
		cart.setProId(proId);
		cart.setMemberId(loginInfo.getId());
		
		cart myCart = new cart();
		myCart.setMemberId(loginInfo.getId());

		// javabeans & list
		List<cart> myList = null;
		try {
			logger.debug("[DEBUG] : cart =" + cart.toString());
			
			// 조건에 맞는 값 데이터 베이스에서 삭제
			cartService.deleteProduct(cart);
			

			// cart List조회
			myList = cartService.selectProductList(myCart);
			logger.debug("[DEBUG] : itemlist = " + myList.toString());

			// cart delete

		} catch (

		Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		rt = "OK";

		// ** 처리 결과를 JSON으로 출력하기 *//*
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", rt);
		data.put("item", myList);

		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);

		return null;
	}

}
