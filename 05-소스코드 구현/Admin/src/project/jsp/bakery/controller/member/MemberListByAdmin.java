package project.jsp.bakery.controller.member;

import java.io.IOException;
import java.util.HashMap;
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
import project.jsp.bakery.model.Product;
import project.jsp.bakery.service.AdminService;
import project.jsp.bakery.service.impl.AdminServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.PageHelper;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

/**
 * Servlet implementation class ProductBread
 */
@WebServlet("/member/MEMBERLISTBYADMIN.do")
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
		

		Member member = new Member();
		
		member = AdminServiceImpl.
		// ** 5. 품목 조회 *//*
		int totalCount = 0;

		// 현재 페이지 수 --> 기본 값은 1페이지로 설정함
		int page = web.getInt("page", 1);

		// 조회할 품종선택
		
		try {
			// 전체 제품 수
			totalCount = productService.selectProductCount(product);

			// 나머지 페이지 번호 제한하기
			// --> 현재 페이지, 전체 게시물 수, 한 페이지의 목록수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 8, 5);

			// 페이지 번호 계산 결과에 Limit 절에 필요한 Beans를 추가
			product.setLimitStart(pageHelper.getLimitStart());
			product.setListCount(pageHelper.getListCount());

			productList = productService.selectProductList(product);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();

		}

		// 조회결과가 존재할 경우 --> 이미지 경로를 썸네일로 교체
		if (productList != null) {
			for (int i = 0; i < productList.size(); i++) {
				Product item = productList.get(i);
				String imagePath = item.getProImg();
				if (imagePath != null) {
					String thumbPath = upload.createThumbnail(imagePath, 320, 320, true);
					// 글 목록 컬렉션 내의 Beans 객체가 갖는 이미지 경로를 썸네일로 변경한다.
					item.setProImg(thumbPath);
					logger.debug("thumbnail create >" + item.getProImg());
				}
			}
		}

		// ** 처리 결과를 JSON으로 출력하기 *//*
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("item", productList);

		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);

		return null;
	}

}