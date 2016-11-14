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
@WebServlet("/PRODUCTADD.do")
public class Productadd2 extends BaseController {
	// ** 1. 사용할 것들 선언 *//*
	private static final long serialVersionUID = -3691943202696624764L;
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	UploadHelper upload;
	ProductService productService;
	RegexHelper regex;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// ** 2.객체 생성 *//*
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		productService = new ProductServiceImpl(logger, sqlSession);
		Product product = new Product();
		regex = RegexHelper.getInstance();
		request.setCharacterEncoding("UTF-8");

		try {
			upload.multipartRequest(request);
		} catch (Exception e1) {
			sqlSession.close();
			web.redirect(null, "멀티파트 데이터가 아닙니다.");
			return null;
		}
		Map<String,String> paramMap = upload.getParamMap();
		String proImg = paramMap.get("proImg");
		String proClassify = paramMap.get("proClassify");
		String proName = paramMap.get("proName");
		String status = paramMap.get("status");
		String content = paramMap.get("content");
		
		String kcal = paramMap.get("kcal");
		String na = paramMap.get("na");
		String sugar = paramMap.get("sugar");
		String fat = paramMap.get("fat");
		String protein = paramMap.get("protein");
		String stock = paramMap.get("stock");
		String proprice = paramMap.get("proPrice");
		
		int kcall = Integer.parseInt(kcal);
		int naa = Integer.parseInt(na);
		int sugarr = Integer.parseInt(sugar);
		int fatt = Integer.parseInt(fat);
		int proteinn = Integer.parseInt(protein);
		int stockk = Integer.parseInt(stock);
		int propricee = Integer.parseInt(proprice);
		
		//유효성 검사
		// 이름 검사
		if (!regex.isValue(proName)) {
			sqlSession.close();
			web.redirect(null, "이름을 입력하세요.");
			return null;
		}
		

		if (!regex.isKor(proName)) {
			sqlSession.close();
			web.redirect(null, "이름은 한글만 입력 가능합니다.");
			return null;
		}
		
		if (stockk < 0 || stockk > 999) {
			sqlSession.close();
			web.redirect(null, "최대수량은 0~999사이여야 합니다.");
			return null;
		}

		// 이메일 검사
		if (!regex.isValue(status)) {
			sqlSession.close();
			web.redirect(null, "품절 유무를 입력해 주세요.");
			return null;
		}

		if (!regex.isValue(content)) {
			sqlSession.close();
			web.redirect(null, "제품소개내용을 입력해 주세요.");
			return null;
		}

		List<FileInfo> fileList = upload.getFileList();
		String profileImg = null;
		if(fileList.size() > 0 ){
			FileInfo info = fileList.get(0);
			profileImg = info.getFileDir() + "/" + info.getFileName();
		}
		logger.debug("업로드된 제품 이미지>>>>>>>>>>>>>>>>>>>>>>>" + profileImg);
		
		product.setContent(content);
		product.setFat(fatt);
		product.setKcal(kcall);
		product.setNa(naa);
		product.setProClassify(proClassify);
		product.setProImg(profileImg);
		product.setProName(proName);
		product.setProPrice(propricee);
		product.setProtein(proteinn);
		product.setStatus(status);
		product.setStock(stockk);
		product.setSugar(sugarr);
		logger.debug("아썅 다출력해>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + product);
		
		try{
			productService.insertProduct(product);
			logger.debug("저장될 값>>>>>>>>>>>>>>>>>>>>>>>>>>>" + product);
		} catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
		} finally{
			sqlSession.close();
		}
		
		web.redirect(web.getRootPath()+"/PRODUCTINDEX.do","제품등록이 성공적으로 이루어 졌습니다.");
		return null;
	}

}