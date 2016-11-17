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
import project.jsp.bakery.service.CustomService;
import project.jsp.bakery.service.impl.CustomServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.PageHelper;
import project.jsp.helper.RegexHelper;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

@WebServlet("/custom/CustomCreate.do")
public class CustomCreate extends BaseController {

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

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		web = WebHelper.getInstance(request, response);
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		regex = RegexHelper.getInstance();
		customService = new CustomServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		upload = UploadHelper.getInstance();

		String view = "custom/3Admin_custom_create";
		return view;
	}

}
