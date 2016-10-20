package project.jsp.bakery.text.service.Order;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;

import project.jsp.bakery.model.Orders;

import project.jsp.bakery.service.OrderService;

import project.jsp.bakery.service.impl.OrderServiceImpl;

public class InsertDocumentServiceTest {

	public static void main(String[] args) {
		
		Orders orders = new Orders();
		orders.setOrderNo(1111);
		orders.setTotalSum(1000);
		orders.setMemberId(1);
		orders.setPickupTime(null);
		orders.setOrderCategory("reservation");

		
		/** 2) */
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
		Logger logger = LogManager.getFormatterLogger(InsertDocumentServiceTest.class.getName());
		OrderService orderService = new OrderServiceImpl(sqlSession, logger);
		
		/** (3) */
		try {
			orderService.insertOrder(orders);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			return;
		} finally {
			sqlSession.close();
		}

		/** (4) */
		System.out.println(orders.getId() + "번 데이터 저장됨");

	}

}
