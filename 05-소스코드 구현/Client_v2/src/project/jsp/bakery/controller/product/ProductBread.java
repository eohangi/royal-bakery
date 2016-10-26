package project.jsp.bakery.controller.product;

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
import project.jsp.bakery.model.Product;
import project.jsp.bakery.model.ProductCommon;
import project.jsp.bakery.service.ProductService;
import project.jsp.bakery.service.impl.ProductServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.PageHelper;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

/**
 * Servlet implementation class ProductBread
 */
@WebServlet("/product/productBread.do")
public class ProductBread extends BaseController {
	private static final long serialVersionUID = -8425560016206479046L;
	//** 1. 사용할 것들 선언 *//*

	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	UploadHelper upload;
	PageHelper pageHelper;
	ProductCommon proCommon;
	ProductService productService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = null;

		//** 2.객체 생성 *//*
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		pageHelper = PageHelper.getInstance();
		proCommon = ProductCommon.getInstance();
		productService = new ProductServiceImpl(logger, sqlSession);
		Product product = new Product();

		//** 3. classify 값을 받아서 항목을 출력 *//*
		// a: bread , b: cake, c:cokie
		String classify = web.getString("classify");
		request.setAttribute("classify", classify);

		//** 4. 존재하는 목록인지 판별하기 *//*
		try {
			String proClassify = proCommon.getProductClassify(classify);
			request.setAttribute("proClassify", proClassify);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}

		//** 5. 품목 조회 *//*
		int totalCount = 0;
		List<Product> productList = null;

		// 현재 페이지 수 --> 기본 값은 1페이지로 설정함
		int page = web.getInt("page", 1);

		// 조회할 품종선택
		product.setProClassify(classify);
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
		
		//** 처리 결과를 JSON으로 출력하기 *//*
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("item", productList);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);

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

		//**6. 조회 결과를 View에 전달*//*
		request.setAttribute("productList", productList);
		
		//페이지 번호 계산 결과를 Veiw에 전달
		request.setAttribute("pageHelper", pageHelper);
		
		view = "menu/bread";

		return view;
	}

}