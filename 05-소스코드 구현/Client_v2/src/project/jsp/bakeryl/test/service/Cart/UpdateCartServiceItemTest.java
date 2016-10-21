package project.jsp.bakeryl.test.service.Cart;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.cart;
import project.jsp.bakery.service.CartService;

import project.jsp.bakery.service.impl.CartServiceImpl;

public class UpdateCartServiceItemTest {

	public static void main(String[] args) {
		cart cart = new cart();
		cart.setId(10);
		cart.setProName("초코빵");
		cart.setProPrice(2000);
		cart.setProCount(2);
		cart.setOrderNo("20111111");
		cart.setCuText("카스테라슈크림케익");
		cart.setCuPrice(20000);
		cart.setEditDate("2011-11-11");
		cart.setRegDate("2011-11-11");
		
		/** (2) */
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

		Logger logger = LogManager.getFormatterLogger(UpdateCartServiceItemTest.class.getName());

		CartService cartService = new CartServiceImpl(sqlSession, logger);

		/** (3) */
		try {
			cartService.updateCartItem(cart);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			return;
		} finally {
			sqlSession.close();
		}

		/** (4) */
		System.out.println("수정되었습니다.");

	}

}
