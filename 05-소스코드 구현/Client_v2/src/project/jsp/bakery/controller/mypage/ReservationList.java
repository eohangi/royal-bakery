package project.jsp.bakery.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Member;
import project.jsp.bakery.model.Orders;
import project.jsp.bakery.service.CartService;
import project.jsp.bakery.service.CustomService;
import project.jsp.bakery.service.OrderService;
import project.jsp.bakery.service.impl.CartServiceImpl;
import project.jsp.bakery.service.impl.CustomServiceImpl;
import project.jsp.bakery.service.impl.OrderServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.PageHelper;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;



/**
 * Servlet implementation class ReservationList
 */
@WebServlet("/mypage/ReservationList.do")
public class ReservationList extends BaseController {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = -8657584745711897477L;
	
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

	PageHelper pageHelper;
	// --> import study.jsp.helper.Upload;
	UploadHelper upload;

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
		pageHelper = PageHelper.getInstance();
		
		order = OrderCommon.getInstance();

		upload = UploadHelper.getInstance();
		
		/** (3) 게시판 카테고리 값을 받아서 view에 전달 */
		String category = web.getString("orderCategory");
		request.setAttribute("orderCategory", category);
		Member loginInfo = (Member) web.getSession("loginInfo");
		/** (4) 존재하는 게시판 인지 판별 - 이름 비교 */
		try {
			String orderName = order.getOrderName(category);
			request.setAttribute("orderName", orderName);
		} catch (Exception e) {
			// TODO: handle exception
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (5) 조회할 정보에 대한 beans 생성 */
		Orders orders = new Orders();
		orders.setOrderCategory(category);
		//orders.setMemberId(loginInfo.getId());
		
		Orders order = new Orders();
		order.setOrderCategory(category);
		order.setMemberId(loginInfo.getId());
		
		int page = web.getInt("page",1);
		/** (6) 게시물 목록 조회 */
		int totalCount = 0;
		List<Orders> reservationList = null;

		try {
			
			totalCount = orderService.selectOrderCount(orders);
			
			pageHelper.pageProcess(page, totalCount, 12, 5);
			
			order.setLimitStart(pageHelper.getLimitStart());
			order.setListCount(pageHelper.getListCount());
			//orderService 는 위에 설정 된 변수이름으로 쓴다.
			reservationList = orderService.selectOrderList(order);
			
		} catch (Exception e) {
			// TODO: handle exception
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally {
			sqlSession.close();
		}
		
		for (int i = 0; i < reservationList.size(); i++) {
			System.out.println(reservationList.get(i).toString());
		}
		
		/** (7) 읽은 데이터를 view에게 전달한다. */
		request.setAttribute("reservationList",reservationList);

		request.setAttribute("pageHelper", pageHelper);

		return "mypage/ReservationList";
		
	}

}
