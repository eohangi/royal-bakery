package project.jsp.bakery.controller.Admin2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.controller.mypage.OrderCommon;
import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Orders;
import project.jsp.bakery.service.CartService;
import project.jsp.bakery.service.OrderService;
import project.jsp.bakery.service.impl.CartServiceImpl;
import project.jsp.bakery.service.impl.OrderServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.PageHelper2;
import project.jsp.helper.WebHelper;

/**
 * Servlet implementation class ReservationOk
 */
@WebServlet("/ReservationOk.do")
public class ReservationOk extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5797514098879518042L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	CartService cartService;
	OrderCommon order;
	
	//OrderService orderService;

	PageHelper2 pageHelper;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		// --> import study.jsp.mysite.service.impl.BbsDocumentServiceImpl;
		OrderService orderService = new OrderServiceImpl(sqlSession, logger);
		cartService = new CartServiceImpl(sqlSession, logger);
		pageHelper = PageHelper2.getInstance();
		order = OrderCommon.getInstance();
		
		int orderNo = web.getInt("order_no");
		String orderCategory = web.getString("orderCategory");
		System.out.println("orderNo = "+ orderNo);
		System.out.println("orderCategory = "+orderCategory);
		
		Orders orders = new Orders();
		orders.setOrderNo(orderNo);
		orders.setOrderCategory(orderCategory);
		
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
		/** 저장 완료 후 읽기 페이지로 이동하기 */
		web.redirect(null, "결제 완료 했습니다.");
		
		return null;
	}


}
