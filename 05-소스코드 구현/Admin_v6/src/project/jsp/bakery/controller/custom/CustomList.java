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

@WebServlet("/custom/CustomList.do")
public class CustomList extends BaseController {

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

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");

		/** (3) 게시판 카테고리 값을 받아서 View에 전달 */
		/** (4) 존재하는 게시판인지 판별하기 */

		// List<String> contain = new ArrayList<String>();
		// contain.add("크림");
		// contain.add("크기");
		//
		// for (int z = 0; z < contain.size(); z++) {
		// System.out.println(contain.get(z));
		// }
		List<Custom> customList = null;
		Custom custom = new Custom();
		int page = web.getInt("page", 1);
		try {
			/*
			 * result = adminService.CountMember(null);
			 * logger.debug("전체 회원 수>>>>>>>>>>>>>>>>>>>>> = " + result); // 전체
			 * 게시물 수 // 나머지 페이지 번호 계산하기 // --> 현재 페이지, 전체 게시물 수, 한 페이지의 목록 수,
			 * 그룹갯수 pageHelper.pageProcess(page, result, 10, 5);
			 * 
			 * // 페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
			 * member.setLimitStart(pageHelper.getLimitStart());
			 * member.setListCount(pageHelper.getListCount());
			 * logger.debug("리밋절에 필요한 빈즈>>>>>>>>>>>" + pageHelper.toString());
			 */

			customList = customService.getCustomList(custom);
			logger.debug("조회한 회원 목록>>>>>>>>>>>>>>>>>", customList);

		} catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		sqlSession.close();

		for (int i = 0; i < customList.size(); i++) {
			System.out.println(customList.get(i));
		}

		// ** 처리 결과를 JSON으로 출력하기 *//*
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("custom", customList);
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ멤버 리스트.do 끝ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");

		/* String view = "custom/3Admin_custom"; */
		// "/WEB-INF/views/index.jsp"파일을 View로 사용한다.
		return null;
	}

}
