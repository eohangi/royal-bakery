package project.jsp.bakeryl.test.service.Cart;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.cart;
import project.jsp.bakery.service.CartService;
import project.jsp.bakery.service.impl.CartServiceImpl;


public class DeleteCartServiceItemTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		cart cart = new cart();
		cart.setId(9);
		
		/** (2) */
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

		Logger logger = LogManager.getFormatterLogger(DeleteCartServiceItemTest.class.getName());

		CartService cartService = new CartServiceImpl(sqlSession, logger);

		/** (3) */
		try {
			cartService.deleteCartItem(cart);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			return;
		} finally {
			sqlSession.close();
		}
		/** (4) */
		System.out.println("제거되었습니다.");

	}
}