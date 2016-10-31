package project.jsp.bakery.controller.product;

import java.io.IOException;
import java.util.HashMap;
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
import project.jsp.bakery.model.Product;
import project.jsp.bakery.service.ProductService;
import project.jsp.bakery.service.impl.ProductServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.WebHelper;

/**
 * Servlet implementation class ProductOk
 */
@WebServlet("/product/productOk.do")
public class ProductOk extends BaseController {

	private static final long serialVersionUID = 257911552415778284L;

	/** 1. 사용할 Helper */

	WebHelper web;
	SqlSession sqlSession;
	Logger logger;
	Product product;
	ProductService productService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** 2. 객체생성+page형식  지정 */

		web = WebHelper.getInstance(request, response);
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		product = new Product();
		productService = new ProductServiceImpl(logger, sqlSession);

		//Page형식을 JSON으로 지정
		response.setContentType("application/json");
		
		/** 3. data값 받기 */
		int id = web.getInt("id");	//제품 id
		request.setAttribute("id", id);
		int quantity = web.getInt("quantity");	//주문 수량
		request.setAttribute("quantity", quantity);
		
		String rt= "FAIL";
		
		
		logger.debug("[DEBUG] id =" + id);

		/** 4. 조회할 제품 선택 */
		product.setId(id);

		// javabeans
		Product item = new Product();

		try {
			item = productService.selectProduct(product);
			item.setQuantity(quantity);
			item.setSumPrice(item.getProPrice()*quantity);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		if(item.getQuantity() != 0){
			rt="OK";
		}

		// ** 처리 결과를 JSON으로 출력하기 *//*
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", rt);
		data.put("item", item);

		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);

		return null;
	}

}
