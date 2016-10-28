package project.jsp.bakery.controller.mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Orders;
import project.jsp.bakery.service.OrderService;
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

		pageHelper = PageHelper.getInstance();
		
		order = OrderCommon.getInstance();

		upload = UploadHelper.getInstance();
		
		/** (3) 게시판 카테고리 값을 받아서 view에 전달 */
		String category = web.getString("orderCategory");
		request.setAttribute("orderCategory", category);
		

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
		
		return "mypage/ReservationPage";
	}
	

}
