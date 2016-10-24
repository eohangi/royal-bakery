package project.jsp.bakery.controller.custom;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Custom;
import project.jsp.bakery.model.cart;
import project.jsp.bakery.service.CartService;
import project.jsp.bakery.service.CustomService;
import project.jsp.bakery.service.impl.CartServiceImpl;
import project.jsp.bakery.service.impl.CustomServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.RegexHelper;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

@WebServlet("/custom/CustomPage_OK.do")
public class CustomPageOK extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7530391719515955896L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;

	// --> import study.jsp.helper.UploadHelper;
	UploadHelper upload;

	CartService cartService;

	CustomService customService;
	// --> import study.jsp.helper.RegexHelper;
	RegexHelper regex;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);

		upload = UploadHelper.getInstance();
		// --> import study.jsp.mysite.service.impl.BbsDocumentServiceImpl;
		customService = new CustomServiceImpl(sqlSession, logger);

		cartService = new CartServiceImpl(sqlSession, logger);
		// --> import study.jsp.mysite.service.impl.BbsFileServiceImpl;
		regex = RegexHelper.getInstance();

		Map<String, String> paramMap = upload.getParamMap();
		String list = web.getString("list");
		String list2 = web.getString("list2");
		String list3 = web.getString("list3");
		String list4 = web.getString("list4");
		String list5 = web.getString("list5");
		String comment = web.getString("comment");

		logger.debug("list=" + list);
		logger.debug("list2=" + list2);
		logger.debug("list3=" + list3);
		logger.debug("list4=" + list4);
		logger.debug("list5=" + list5);
		logger.debug("comment=" + comment);

		if (list == null) {
			web.redirect(null, "크림을 선택해주세요.");
			return null;
		}

		if (list2 == null) {
			web.redirect(null, "크기을 선택해주세요.");
			return null;
		}

		if (list3 == null) {
			web.redirect(null, "단수를 선택해주세요.");
			return null;
		}

		if (list4 == null) {
			web.redirect(null, "시트를 선택해주세요.");
			return null;
		}

		if (list5 == null) {
			web.redirect(null, "초를 선택해주세요.");
			return null;
		}

		if (comment == null) {
			web.redirect(null, "원하시는 문구를 입력해주세요.");
			return null;
		}

		/** 4) 조회를 위한 Beans 생성 */
		// --> import study.jsp.myschool.model.Department
		cart cart = new cart();
		cart.setCuText(list);
		// cart.setCuText(comment);

		/** 6 ) Service를 통한 SQL 수행 */

		try {
			cartService.insertCartItem(cart);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		/** (13) */
		sqlSession.close();

		web.redirect(web.getRootPath() + "/MainIndex1.do", "장바구니에 추가되었습니다.");

		return null;

	}

}
