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

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Member;
import project.jsp.bakery.model.Orders;
import project.jsp.bakery.service.OrderService;
import project.jsp.bakery.service.impl.OrderServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.PageHelper;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

/**
 * Servlet implementation class OrderConfirmation
 */
@WebServlet("/mypage/OrderConfirmation.do")
public class OrderConfirmation extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7381080922281498701L;
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
		/** (3) 파일이 포함된 POST 파라미터 받기 */
		try {
			upload.multipartRequest(request);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, "multipart 데이터가 아닙니다.");
			return null;
		}
		
		/** (4) UploadHelper에서 텍스트 형식의 값을 추출 */
		Map<String, String> paramMap = upload.getParamMap();
		String writerName = paramMap.get("writer_name");
		String tel = paramMap.get("tel");
		String time = paramMap.get("time");
		String price = paramMap.get("price");
		String paytype = paramMap.get("paytype");
		
		// 작성자 아이피 주소 가져오기
		String ipAddress = web.getClientIP();
		/*// 회원 일련번호 --> 비 로그인인 경우 0
		int memberId = 0;
*/
		// 로그인 한 경우, 입력하지 않은 이름, 비밀번호, 이메일을 세션정보로 대체
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			writerName = loginInfo.getMem_name();
			tel = loginInfo.getPhone_no();
		}
		
		// 전달된 파라미터는 로그로 확인한다.
		logger.debug("writer_name=" + writerName);
		logger.debug("tel=" + tel);
		logger.debug("time=" + time);
		logger.debug("price=" + price);
		logger.debug("paytype=" + paytype);
		
		Orders order = new Orders();
		return "mypage/OrderConfirmation";
	}
	

}
