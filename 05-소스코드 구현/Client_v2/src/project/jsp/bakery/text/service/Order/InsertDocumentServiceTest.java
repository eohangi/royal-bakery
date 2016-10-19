package project.jsp.bakery.text.service.Order;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;

import project.jsp.bakery.model.order;

import project.jsp.bakery.service.OrderService;

import project.jsp.bakery.service.impl.OrderServiceImpl;

public class InsertDocumentServiceTest {

	public static void main(String[] args) {
		
		order order = new order();
		order.setOrderNo("111");
		order.setTotalSum("5000");
		order.setMemberId("1");
		order.setOrRegDate("2016-10-19");
		order.setPickupTime("2016-10-19");
		order.setBarcode("1233");
		order.setOrderCategory("pay");
		order.setOrEditTime("2016-10-19");
		
		/** 2) */
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
		Logger logger = LogManager.getFormatterLogger(InsertDocumentServiceTest.class.getName());
		OrderService orderService = new OrderServiceImpl(sqlSession, logger);
		
		/** (3) */
		try {
			orderService.insertOrder(order);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
			return;
		} finally {
			sqlSession.close();
		}

		/** (4) */
		System.out.println(order.getId() + "번 데이터 저장됨");

	}

}
