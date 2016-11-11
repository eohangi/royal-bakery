package project.jsp.bakery.controller.product;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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
import project.jsp.helper.FileInfo;
import project.jsp.helper.RegexHelper;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

/**
 * Servlet implementation class ProductBread
 */
@WebServlet("/PRODUCTDELETE.do")
public class Productedelete extends BaseController {
	// ** 1. 사용할 것들 선언 *//*
	private static final long serialVersionUID = -3691943202696624764L;
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	UploadHelper upload;
	RegexHelper regex;
	ProductCommon proCommon;
	ProductService productService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// ** 2.객체 생성 *//*
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		proCommon = ProductCommon.getInstance();
		regex = RegexHelper.getInstance();
		productService = new ProductServiceImpl(logger, sqlSession);
		Product product = new Product();
		request.setCharacterEncoding("UTF-8");
		
		
		try {
			upload.multipartRequest(request);
		} catch (Exception e) {
			sqlSession.close();
			e.printStackTrace();
			web.redirect(null, "멀티파트 데이터가 아닙니다.");
			return null;
		}
		Map<String,String> paramMap = upload.getParamMap();
		String id = paramMap.get("id");
		logger.debug("아이디값 뭔데>>>>>>>>>>>>>>>>>>>>>>>>>" + id);
		int idd = Integer.parseInt(id);
		
		product.setId(idd);
		try{
			productService.Delete(product);
			logger.debug("저장될 값>>>>>>>>>>>>>>>>>>>>>>>>>>>" + product);
		} catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
		} finally{
			sqlSession.close();
		}
		
		web.redirect(web.getRootPath()+"/PRODUCTINDEX.do","해당제품이 성공적으로 삭제되었습니다.");
		return null;
	}
}