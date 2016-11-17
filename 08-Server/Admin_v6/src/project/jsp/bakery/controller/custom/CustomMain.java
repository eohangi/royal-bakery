package project.jsp.bakery.controller.custom;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Custom;
import project.jsp.bakery.service.CustomService;
import project.jsp.bakery.service.impl.CustomServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.PageHelper;
import project.jsp.helper.RegexHelper;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

@WebServlet("/custom/3Admin_custom.do")
public class CustomMain extends BaseController {

	private static final long serialVersionUID = 4208114428968364694L;

	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	CustomService customService;
	RegexHelper regex;

	PageHelper pageHelper;
	// --> import study.jsp.helper.Upload;
	UploadHelper upload;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		web = WebHelper.getInstance(request, response);
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		regex = RegexHelper.getInstance();
		// --> import study.jsp.mysite.service.impl.BbsDocumentServiceImpl;
		customService = new CustomServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();

		upload = UploadHelper.getInstance();

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");

		return "custom/3Admin_custom";
	}

}
