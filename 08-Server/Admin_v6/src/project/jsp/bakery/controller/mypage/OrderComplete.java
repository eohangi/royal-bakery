package project.jsp.bakery.controller.mypage;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.mysql.jdbc.CachedResultSetMetaData;

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
 * Servlet implementation class OrderComplete
 */
@WebServlet("/mypage/OrderComplete.do")
public class OrderComplete extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1460672513262818033L;

	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	
	CartService cartservice;
	
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

		cartservice = new CartServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		
		order = OrderCommon.getInstance();

		upload = UploadHelper.getInstance();
		
		//로그인한 회원 이름 전화본호 가져온다.
		Member loginInfo = (Member) web.getSession("loginInfo");
		
		//결제 하기 부분에 입력한 값을 map으로 가져온다
		//Map<String, String> paramMap = upload.getParamMap();
		
		
		String OrderName = loginInfo.getMem_name();
		String OrderTel = loginInfo.getPhone_no();
		
		request.setAttribute("OrderName", OrderName);
		request.setAttribute("OrderTel", OrderTel);
		
		
		
		//장바구니에서 정보가져온거 order의 beans로 묶어서 post로 보낼 준비한다.
		cart cart = new cart();
		cart.setMemberId(loginInfo.getId());
		/*	Orders order = new Orders();
		order.setId(loginInfo.getId());
		order.setOrName(loginInfo.getMem_name());
		order.setOrTel(loginInfo.getPhone_no());*/
		
		int totalPrice = 0;
		
		try {
			totalPrice= cartservice.selectCartTotalPrice(cart);
		} catch (Exception e) {
			// TODO: handle exception
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally {
			sqlSession.close();
		}
		request.setAttribute("totalPrice", totalPrice);
		
		Orders payInfo = null;
		
	
		
		
		
		
		
		
		
		
		
		
		return "mypage/OrderComplete";
	}
	

}
