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
import project.jsp.bakery.model.cart;
import project.jsp.bakery.service.CartService;
import project.jsp.bakery.service.OrderService;
import project.jsp.bakery.service.impl.CartServiceImpl;
import project.jsp.bakery.service.impl.OrderServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.PageHelper;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

/**
 * Servlet implementation class ReservationPage
 */
@WebServlet("/mypage/ReservationPage.do")
public class ReservationPage extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4445530849943566134L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	
	OrderCommon order;
	CartService cartService;

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
		

		Member loginInfo = (Member) web.getSession("loginInfo");
		

		
		String orderCategory = web.getString("OrderCategory");
		String paytype = web.getString("paytype");
		int OrderNo = web.getInt("OrderNo");
		
	/*	*//** (3) 게시판 카테고리 값을 받아서 view에 전달 *//*
		String category = web.getString("orderCategory");
		request.setAttribute("orderCategory", category);
		
		*//** (4) 존재하는 게시판 인지 판별 - 이름 비교 *//*
		try {
			String orderName = order.getOrderName(category);
			request.setAttribute("orderName", orderName);
		} catch (Exception e) {
			// TODO: handle exception
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		*//** (5) 조회할 정보에 대한 beans 생성 *//*
		//url get으로 넘어오는 정보
		int reservationId = web.getInt("reservation_id");
		if (reservationId == 0) {
			sqlSession.close();
			web.redirect(null, "글 번호가 지정되지 않았습니다.");
			return null;
		}
		
		//beans로 묶기
		Orders orders = new Orders();
		orders.setId(reservationId);
		orders.setOrderCategory(category);
		
		//데이터 조회
		Orders readReservation = null;
		
		try {
			// professormapper.selectprofessorlist 기능을 호출한다.
			// 두번째 파라미터는 조회 조건시에 사용될 파라미터 --> Beans객체
			// 조회 결과가 단일행을 리턴하기 때문에 Beans 객체 형태로 리턴된다
			readReservation = sqlSession.selectOne("OrderMapper.selectOrder", orders);
		} catch (Exception e) {
			//뒤로가는 기능
			web.redirect(null,e.getLocalizedMessage());
			
			return null;
		} finally {
			// 데이터 베이스 접속 해제하기
			// 트라이 캣치의 파이널리는 캣치에서 리턴문보다 우선 실행된다.
			sqlSession.close();
		}
		
		request.setAttribute("readReservation", readReservation);
		*/
		logger.debug("OrderCategory=" + orderCategory);
		logger.debug("MemberId=" + loginInfo.getId());
		logger.debug("OrderNo=" + OrderNo);
		/** (5) 조회할 정보에 대한 beans 생성 */
		Orders orders = new Orders();
		orders.setOrderCategory(orderCategory);
		orders.setMemberId(loginInfo.getId());
		orders.setOrderNo(OrderNo);
		
		cart cart = new cart();
		cart.setMemberId(loginInfo.getId());
		cart.setOrderNo(OrderNo);
	
		System.out.println(cart);
		List<cart> cartlist = null;
		List<cart> cartlist2 = null;
		//데이터 조회
		Orders readOrder = null;
		
		logger.debug("cart.ProName=" + cart.getProName());
		logger.debug("cart.CuText=" + cart.getCuText());
		try {
			// professormapper.selectprofessorlist 기능을 호출한다.
			// 두번째 파라미터는 조회 조건시에 사용될 파라미터 --> Beans객체
			// 조회 결과가 단일행을 리턴하기 때문에 Beans 객체 형태로 리턴된다
			readOrder = sqlSession.selectOne("OrderMapper.selectOrder", orders);
			//if(cart.getProName() != null){
			cartlist = cartService.selectCartOrder1(cart);
			//}
			System.out.println("cartlist=" + cartlist);
			
			//if(cart.getCuText() != null){
			cartlist2 = cartService.selectCartOrder2(cart);
			//}
		} catch (Exception e) {
			//뒤로가는 기능
			web.redirect(null,e.getLocalizedMessage());
			 
			return null;
		} finally {
			// 데이터 베이스 접속 해제하기
			// 트라이 캣치의 파이널리는 캣치에서 리턴문보다 우선 실행된다.
			sqlSession.close();
		}
//		System.out.println("loginInfo=" + loginInfo);

	
//		System.out.println("cartlist=" + cartlist);
		
		/*for (int i = 0; i < cartlist.size(); i++) {
			System.out.println(cartlist.get(i));
		}

		for (int z = 0; z < cartlist2.size(); z++) {
			System.out.println(cartlist2.get(z));
		}*/
		
		String orType = readOrder.getOrType();
		
		String type = null;
		if(orType != null){
		if(orType.equals("M")){
			type = "신용카드";
		}
		if(orType.equals("F")){
			type = "무통장입금";
		}
		}
		
		String time = readOrder.getOrTime();
		String Time = null;
		if(time != null){
		if(time.equals("normal")){
			Time = "15분후";
		}
		if(time.equals("order")){
			Time = "30분후";
		}
		}
		logger.debug("Time=" + Time);
		logger.debug("type=" + type);
		
	//	String paytype = orders.get
		
		request.setAttribute("type", type);
		request.setAttribute("Time", Time);

		request.setAttribute("cartlist", cartlist);
		request.setAttribute("cartlist2", cartlist2);
		request.setAttribute("readOrder", readOrder);
		
		return "mypage/ReservationPage";
	}
	

}
