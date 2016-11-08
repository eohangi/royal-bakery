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
@WebServlet("/MEMBERLISTBYADMIN.do")
public class MemberListByAdmin extends BaseController {
	private static final long serialVersionUID = -8425560016206479046L;
	// ** 1. 사용할 것들 선언 *//*

	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	UploadHelper upload;
	PageHelper pageHelper;
	AdminService adminService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = null;

		// ** 2.객체 생성 *//*
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		pageHelper = PageHelper.getInstance();
		adminService = new AdminServiceImpl(logger, sqlSession);
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		
		int result = 0;
		List<Member> memberList = null;
		Member member = new Member();
		int page = web.getInt("page", 1);
		try {
			result = adminService.CountMember(null);
			logger.debug("전체 회원 수>>>>>>>>>>>>>>>>>>>>> = " + result);
			// 전체 게시물 수
			// 나머지 페이지 번호 계산하기
			// --> 현재 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
			pageHelper.pageProcess(page, result, 10, 5);

			// 페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
			member.setLimitStart(pageHelper.getLimitStart());
			member.setListCount(pageHelper.getListCount());
			logger.debug("리밋절에 필요한 빈즈>>>>>>>>>>>" + pageHelper.toString());
			
			memberList = adminService.selectAllMember(member);
			logger.debug("조회한 회원 목록>>>>>>>>>>>>>>>>>", memberList);
			
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		sqlSession.close();
		
		for (int i = 0; i < memberList.size(); i++) {
			System.out.println(memberList.get(i));
		}

		// ** 처리 결과를 JSON으로 출력하기 *//*
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("member", memberList);
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ멤버 리스트.do 끝ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		return null;
	}

}