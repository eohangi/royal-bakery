package project.jsp.bakery.controller.bbs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Document;
import project.jsp.bakery.service.DocumentService;
import project.jsp.bakery.service.impl.DocumentServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.WebHelper;

@WebServlet("/bbs/document_edit.do")
public class DocumentEdit extends BaseController {
	private static final long serialVersionUID = 5432123621005890965L;
	
	/** 1) 사용하고자 하는 핼퍼 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	DocumentService documentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			
		
		//** 2 사용하고자 하는 핼퍼+서비스 객체 생성 *//*
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		documentService = new DocumentServiceImpl(sqlSession, logger);
		
		//** 3 게시판 카테고리 값을 받아서 view에 전달 *//*
		String category = web.getString("category");
		request.setAttribute("category", category);
		
		//** 4 존재하는 게시판인지 판별하기 *//*
		try {
			String bbsName = bbs.getBbsName(category);
			request.setAttribute("bbsName", bbsName);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** 글 번호 파라미터 받기 */
		int documentId = web.getInt("document_id");
		logger.debug("documentId=" + documentId);
		
		if (documentId == 0) {
			web.redirect(null, "글 번호가 지정되지 않았습니다.");
			sqlSession.close();
			return null;
		}
		
		// 파라미터를 Beans 로 묶기
		Document document = new Document();
		document.setId(documentId);
		document.setCategory(category);
		
		/** 게시물 일련번호를 사용한 데이터 조회 */
		Document readDocument = null;
				
		try {
			readDocument = documentService.selectDocument(document);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** 읽은 데이터를 view에게 전달한다. */
		request.setAttribute("readDocument", readDocument);
		
		
		return "bbs/document_edit";	
		
	}
}
