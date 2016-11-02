package project.jsp.bakeryl.test.service.Cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.cart;
import project.jsp.bakery.service.CartService;
import project.jsp.bakery.service.impl.CartServiceImpl;

public class SelectCartCountByMemberId {

	public static void main(String[] args) {
		cart cart = new cart();
		cart.setMemberId(2);

		/** (2) */
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

		Logger logger = LogManager.getFormatterLogger(SelectCartCountByMemberId.class.getName());

		CartService cartService = new CartServiceImpl(sqlSession, logger);

		/** (3) */
		List<cart> list = null;
		try {
			list = cartService.selectCartCountByMemberId(cart);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			return;
		} finally {
			sqlSession.close();
		}

		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}

	}

}