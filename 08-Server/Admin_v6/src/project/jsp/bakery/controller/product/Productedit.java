package project.jsp.bakery.controller.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

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
@WebServlet("/PRODUCTEDIT.do")
public class Productedit extends BaseController {
	// ** 1. 사용할 것들 선언 *//*
	private static final long serialVersionUID = -3691943202696624764L;
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	UploadHelper upload;
	PageHelper pageHelper;
	ProductCommon proCommon;
	ProductService productService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// ** 2.객체 생성 *//*
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		pageHelper = PageHelper.getInstance();
		proCommon = ProductCommon.getInstance();
		productService = new ProductServiceImpl(logger, sqlSession);
		Product product = new Product();
		request.setCharacterEncoding("UTF-8");

		String proname = request.getParameter("proName");
		String getstring = web.getString("proName");
		logger.debug("[DEBUG] 넘어온 제품명>>>>>>>>>>>>>>> =" + proname);
		logger.debug("[DEBUG] 넘어온 제품명겟스트링>>>>>>>>>>>>>>> =" + getstring);

		product.setProName(proname);
		// 이름으로 빵 조회
		try {
			product = productService.SelectProductNyname(product);
			
		} catch (Exception e) {
			web.redirect(null, "알수없는오류 from servlet");
		} finally {
			sqlSession.close();
		}

		// 조회결과가 존재할 경우 --> 이미지 경로를 썸네일로 교체
		if (product != null) {
			String imagePath = product.getProImg();
			if (imagePath != null) {
				String thumbPath = upload.createThumbnail(imagePath, 320, 320, true);
				// 글 목록 컬렉션 내의 Beans 객체가 갖는 이미지 경로를 썸네일로 변경한다.
				product.setProImg(thumbPath);
				logger.debug("thumbnail create >" + product.getProImg());
			}
		}
		logger.debug("조회한 정보>>>>>>>>>>>>>>>>>>>>>>>>" + product.toString());
		request.setAttribute("item", product);


		return "3Admin_product_edit";
	}

}