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
@WebServlet("/product/productOk.do")
public class ProductOk extends BaseController {

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
		
		// 로그인 중이라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			sqlSession.close();
			web.redirect(web.getRootPath() + "/member/Login.do", "로그인을 먼저 해주세요.");
			return null;
		} else{
			logger.debug("[DEBUG] MemberInfo"+ loginInfo.toString());
		}
		
		/*//Page형식을 JSON으로 지정
		response.setContentType("application/json");*/
		
		/** 3. data값 받기 */
		int id = web.getInt("id");	//제품 id
		request.setAttribute("id", id);
		int quantity = web.getInt("quantity");	//주문 수량
		request.setAttribute("quantity", quantity);
		
		String rt= "FAIL";
		
		
		logger.debug("[DEBUG] id =" + id);

		/** 4. 조회할 제품 선택 */
		product.setId(id);

		// javabeans & list
		Product it = new Product();
		cart item = new cart();
		List<cart> myList =null;
		List<cart> itemList = null;
		try {
			//product select
			it = productService.selectProduct(product);
			it.setQuantity(quantity);
			it.setSumPrice(it.getProPrice()*quantity);
			logger.debug("[DEBUG] : product select =" +it.toString()+", quantity ="+it.getQuantity()+", sum ="+it.getSumPrice());
			
			//cart 값 정의
			cart cart = new cart();
			cart.setProId(it.getId());
			cart.setProName(it.getProName());
			cart.setCuPrice(it.getCuPrice());
			cart.setProCount(it.getQuantity());
			cart.setProPrice(it.getSumPrice());
			cart.setMemberId(loginInfo.getId());
			logger.debug("[DEBUG] : cart ="+ cart.toString());
			
			cart myCart = new cart();
			myCart.setMemberId(loginInfo.getId());

			//cart List
			myList=cartService.selectProductList(myCart);
			logger.debug("[DEBUG] : myList = "+myList.toString());
			
			if( myList.size()==0){
				//insert
				cartService.insertProductItem(cart);
				
				//cart select
				item=cartService.selectProductItem(cart);
				logger.debug("[DEBUG] : item = " + item.toString());
			} else{
				//List에 같은 제품이 있는지 검사하여 있다면 UPDATE를, 없다면 INSERT를 실행
				for(int i=0; myList.size() >i; i++){
					if(myList.get(i).getProId() == cart.getProId() ){
						//update
						myList.get(i).setProCount(myList.get(i).getProCount()+cart.getProCount());
						myList.get(i).setProPrice(myList.get(i).getProPrice()+cart.getProPrice());
						cartService.updateProductItem(myList.get(i));
						
						logger.debug("[DEBUG] : UPdate! = " + myList.get(i).toString());
						
						break;
					}else{
						//insert
						cartService.insertProductItem(cart);
						
						//cart select
						item=cartService.selectProductItem(cart);
						logger.debug("[DEBUG] : INSERT! item = " + item.toString());					
						break;
					}
						
				}
			}
			
			//cart List
			itemList=cartService.selectProductList(myCart);
			logger.debug("[DEBUG] : itemlist = " + itemList.toString());
			
			//cart delete
			
			
		} catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		if(it.getQuantity() != 0){
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
