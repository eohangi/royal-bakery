package project.jsp.bakery.controller.custom;

import java.io.IOException;
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
import project.jsp.bakery.service.impl.DocumentServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.PageHelper;
import project.jsp.helper.RegexHelper;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

@WebServlet("/custom/Custom_delete.do")
public class CustomDelete extends BaseController {
	private static final long serialVersionUID = 5730641630115614854L;

	/** 사용하고자 하는 핼퍼 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	Custom custom;
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
		// --> import study.jsp.mysite.service.impl.BbsDocumentServiceImpl;
		pageHelper = PageHelper.getInstance();

		upload = UploadHelper.getInstance();

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");

		customService = new CustomServiceImpl(sqlSession, logger);

		int id = web.getInt("id");
		System.out.println("id=" + id);
		request.setAttribute("id", id);
		// 파라미터를 Beans로 묶기

		List<Custom> customList = null;
		Custom custom = new Custom();
		custom.setId(id);
		String rt = "FAIL";
		logger.debug("[DEBUG] id =" + id);
		int page = web.getInt("page", 1);
		try {

			logger.debug("[DEBUG] : custom =" + custom.toString());

			customService.deleteCustomItem(custom);

			customList = customService.getCustomList(custom);
			logger.debug("조회한 회원 목록>>>>>>>>>>>>>>>>>", customList);

			System.out.println("customlist=" + customList);
		} catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		sqlSession.close();
		System.out.println("customlist=" + customList);

		for (int i = 0; i < customList.size(); i++) {
			System.out.println(customList.get(i));
		}

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("custom", customList);

		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ멤버 리스트.do 끝ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		/* String view = "custom/3Admin_custom"; */
		// "/WEB-INF/views/index.jsp"파일을 View로 사용한다.
		return null;
	}

}
