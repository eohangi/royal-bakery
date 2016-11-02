package project.jsp.bakery.test.mybatis.Order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Document;
import project.jsp.bakery.model.Orders;
import project.jsp.bakery.service.DocumentService;
import project.jsp.bakery.service.OrderService;
import project.jsp.bakery.service.impl.DocumentServiceImpl;
import project.jsp.bakery.service.impl.OrderServiceImpl;

public class SelectDocumentListServiceTest {

	public static void main(String[] args) {
		
		/** (2) */
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();

		Logger logger = LogManager.getFormatterLogger(SelectDocumentListServiceTest.class.getName());

		OrderService orderService = new OrderServiceImpl(sqlSession, logger);

		/** (3) */
		
		Orders orders = new Orders();
		orders.setOrderCategory("reservation");
		orders.setListCount(5);
		orders.setListCount(5);
		
		List<Orders> list = null;
		try {
			list = orderService.selectOrderList(orders);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			return;
		} finally {
			sqlSession.close();
		}

		/** (4) */
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
		}

	}

}