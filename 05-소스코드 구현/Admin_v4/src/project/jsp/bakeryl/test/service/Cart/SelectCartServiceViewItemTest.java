package project.jsp.bakeryl.test.service.Cart;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.cart;
import project.jsp.bakery.service.CartService;
import project.jsp.bakery.service.impl.CartServiceImpl;


public class SelectCartServiceViewItemTest {

	public static void main(String[] args) {
		cart cart = new cart();
		cart.setId(7);

		/** (2) */
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

		Logger logger = LogManager.getFormatterLogger(SelectCartServiceViewItemTest.class.getName());

		CartService cartService = new CartServiceImpl(sqlSession, logger);

		/** (3) */
		cart item = null;
		try {
			item = cartService.selectCartItem(cart);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			return;
		} finally {
			sqlSession.close();
		}

		/** (4) */
		System.out.println(item.toString());

	}

}