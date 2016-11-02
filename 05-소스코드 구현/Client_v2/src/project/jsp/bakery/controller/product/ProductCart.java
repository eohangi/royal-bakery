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
 * Servlet implementation class ProductOk
 */
@WebServlet("/product/productCart.do")
public class ProductCart extends BaseController {

	private static final long serialVersionUID = 257911552415778284L;

	/** 1. 사용할 Helper */

	WebHelper web;
	SqlSession sqlSession;
	Logger logger;
	Product product;
	ProductService productService;
	CartService cartService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** 2. 객체생성+page형식  지정 */

		web = WebHelper.getInstance(request, response);
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		product = new Product();
		productService = new ProductServiceImpl(logger, sqlSession);
		cartService = new CartServiceImpl(sqlSession, logger);
		Member loginInfo = (Member) web.getSession("loginInfo");
		
		
		//Page형식을 JSON으로 지정
		response.setContentType("application/json");
		
		/** 3. data값 받기 */
		int memberId = web.getInt("memberId");	//초기값 0
		
		
		String rt= "FAIL";
		
		
		logger.debug("[DEBUG] id =" + memberId);

		// javabeans & list
		List<cart> myList =null;
		
		//memberId 에 값 입력
		memberId=loginInfo.getId();
						
		try {
			
			
			cart myCart = new cart();
			myCart.setMemberId(loginInfo.getId());

			//cart List
			myList=cartService.selectProductList(myCart);
			logger.debug("[DEBUG] : myList = "+myList.toString());
			
			//cart delete
			
			
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		if(itemList.size()!= 0){
			rt="OK";
		}

		// ** 처리 결과를 JSON으로 출력하기 *//*
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", rt);
		data.put("item", itemList);

		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);

		return null;
	}

}
