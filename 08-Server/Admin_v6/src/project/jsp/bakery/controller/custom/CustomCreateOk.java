package project.jsp.bakery.controller.custom;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Custom;
import project.jsp.bakery.service.CustomService;
import project.jsp.bakery.service.impl.CustomServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.PageHelper;
import project.jsp.helper.RegexHelper;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

@WebServlet("/custom/CustomCreateOk.do")
public class CustomCreateOk extends BaseController {

	private static final long serialVersionUID = 4208114428968364694L;

	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	CustomService customService;
	RegexHelper regex;
	PageHelper pageHelper;
	UploadHelper upload;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		logger = LogManager.getFormatterLogger(request.getRequestURI());
		web = WebHelper.getInstance(request, response);
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		regex = RegexHelper.getInstance();
		customService = new CustomServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		upload = UploadHelper.getInstance();

	//	Map<String, String> paramMap = upload.getParamMap();
		String list = web.getString("list");

		String text1 = web.getString("cu_name");
		int text2 = web.getInt("cu_price");

		logger.debug("cu_name=" + text1);
		logger.debug("cu_price=" + text2);
		
		if (text1 == null) {
			web.redirect(null, "제품명을 정해주십시오.");
			return null;
		}

		if (text2 == 0) {
			web.redirect(null, "가격을 정해주십시오.");
			return null;
		}
		
		System.out.println("classify=" + list);

		Custom custom = new Custom();
		custom.setCuClassify(list);
		custom.setCuName(text1);
		custom.setCuPrice(text2);

		try {
			customService.insertCustomItem(custom);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
		} finally {
			sqlSession.close();
		}

		sqlSession.close();

		web.redirect(web.getRootPath() + "/custom/3Admin_custom.do", "제품이 추가되었습니다.");
		return null;
	}

}
