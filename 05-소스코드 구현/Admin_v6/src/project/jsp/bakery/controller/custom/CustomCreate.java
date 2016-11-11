package project.jsp.bakery.controller.custom;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Custom;
import project.jsp.bakery.model.Member;
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
	/**
	 * 특정 카테고리에 대한 상위 n개의 게시물 가져오기
	 * 
	 * @param category
	 *            - 가져올 카테고리
	 * @param listCount
	 *            - 가져올 게시물 수
	 * @return
	 * @throws Exception
	 */

	/** (1) 사용하고자 하는 Helper + Service 객체 선언 */
	/** (1) 사용하고자 하는 Helper 객체 선언 */
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

		/** (3) 게시판 카테고리 값을 받아서 View에 전달 */
		/** (4) 존재하는 게시판인지 판별하기 */

		String view = "custom/3Admin_custom_create";
		// "/WEB-INF/views/index.jsp"파일을 View로 사용한다.
		return view;
	}

}
