package project.jsp.bakery.controller.member;

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
import project.jsp.bakery.model.Member;
import project.jsp.bakery.service.AdminService;
import project.jsp.bakery.service.impl.AdminServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.PageHelper;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

/**
 * Servlet implementation class ProductBread
 */
@WebServlet("/SEARCHMEMBER.do")
public class SerchMember extends BaseController {
	private static final long serialVersionUID = -8425560016206479046L;
	// ** 1. 사용할 것들 선언 *//*

	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	AdminService adminService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = null;

		// ** 2.객체 생성 *//*
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		adminService = new AdminServiceImpl(logger, sqlSession);
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		
		/**파라미터 받기(검색어)*/
		String keyword =web.getString("keyword");
		logger.debug("키워드로 날라온값>>>>>>>>>>>>>>>>"+keyword);
		Member member = new Member();
		member.setMem_id(keyword);
		
		
		/**해당 회원 조회해서 받아오기(서비스호출,파라미터는 검색어)*/
		
		try {
		member = adminService.HandleMember(member);
		logger.debug("조회된 회원>>>>>>>>>>>>>>>>"+member);
			
		}catch (Exception e) {
			e.printStackTrace();
			web.redirect(null, "알수없는에러 do");
		}
		
		
		/**에이젝스로 쏴주기*/
		// ** 처리 결과를 JSON으로 출력하기 *//*
				Map<String, Object> data = new HashMap<String, Object>();
				data.put("resultmember", member);
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getWriter(), data);

				return null;
	}

}