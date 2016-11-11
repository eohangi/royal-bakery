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

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** 사용하고자 하는 핼퍼 + 서비스 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");

		customService = new CustomServiceImpl(sqlSession, logger);

		int customid = web.getInt("id");
		System.out.println("customid=" + customid);
		request.setAttribute("customid", customid);
		// 파라미터를 Beans로 묶기
		custom = new Custom();
		custom.setId(customid);
		String rt = "FAIL";
		logger.debug("[DEBUG] customid =" + customid);

		List<Custom> customlist = null;

		try {

			logger.debug("[DEBUG] : custom =" + custom.toString());

			customService.deleteCustomItem(custom);

			customlist = customService.getCustomList(custom);
			logger.debug("조회한 회원 목록>>>>>>>>>>>>>>>>>", customlist);

			System.out.println("customlist=" + customlist);
		} catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		System.out.println("customlist=" + customlist);
		for (int i = 0; i < customlist.size(); i++) {
			System.out.println(customlist.get(i));
		}

		// 상태유지를 위하여 게시글 일련번호를 View에 전달한다.
		request.setAttribute("customid", customid);

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", rt);
		data.put("item", customlist);

		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);

		return null;

	}

}
