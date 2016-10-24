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
import project.jsp.bakery.service.CustomService;
import project.jsp.bakery.service.impl.CustomServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.PageHelper;
import project.jsp.helper.RegexHelper;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

@WebServlet("/custom/CustomOrder.do")
public class CustomPage extends BaseController {

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

		// List<String> contain = new ArrayList<String>();
		// contain.add("크림");
		// contain.add("크기");
		//
		// for (int z = 0; z < contain.size(); z++) {
		// System.out.println(contain.get(z));
		// }

		Custom custom = new Custom();
		custom.setCuClassify("크림");

		List<Custom> list = null;

		////////////////////////

		Custom custom2 = new Custom();
		custom2.setCuClassify("크기");

		List<Custom> list2 = null;

		////////////////////////

		Custom custom3 = new Custom();
		custom3.setCuClassify("단수");

		List<Custom> list3 = null;

		////////////////////////

		Custom custom4 = new Custom();
		custom4.setCuClassify("시트");

		List<Custom> list4 = null;
		
		////////////////////////

		Custom custom5 = new Custom();
		custom5.setCuClassify("초");

		List<Custom> list5 = null;


		try {
			list = customService.selectCustomClassCount(custom);

			list2 = customService.selectCustomClassCount(custom2);

			list3 = customService.selectCustomClassCount(custom3);

			list4 = customService.selectCustomClassCount(custom4);
			
			list5 = customService.selectCustomClassCount(custom5);
		} catch (Exception e) {
			// TODO: handle exception
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}

		for (int z = 0; z < list2.size(); z++) {
			System.out.println(list2.get(z));
		}

		for (int f = 0; f < list3.size(); f++) {
			System.out.println(list3.get(f));
		}

		for (int a = 0; a < list4.size(); a++) {
			System.out.println(list4.get(a));
		}

		for (int q = 0; q < list5.size(); q++) {
			System.out.println(list5.get(q));
		}
		
		request.setAttribute("list", list);

		request.setAttribute("list2", list2);

		request.setAttribute("list3", list3);

		request.setAttribute("list4", list4);

		request.setAttribute("list5", list5);

		
		String view = "custom/CustomOrder";
		// "/WEB-INF/views/index.jsp"파일을 View로 사용한다.
		return view;
	}

}
