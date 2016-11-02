package project.jsp.bakery.controller.bbs;

import java.io.IOException;
import java.util.List;

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
import project.jsp.helper.PageHelper;
import project.jsp.helper.WebHelper;

@WebServlet("/bbs/document_list.do")
public class DocumentList extends BaseController {
	private static final long serialVersionUID = -1406637488388369047L;

	/** 1) 사용하고자 하는 핼퍼 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	DocumentService documentService;
	PageHelper pageHelper;
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			
		
		//** 2 사용하고자 하는 핼퍼+서비스 객체 생성 *//*
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		documentService = new DocumentServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		
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
		
		/** 조회할 정보에 대한 Beans 생성 */
		// 검색어
		String keyword = web.getString("keyword");
		
		Document document = new Document();
		document.setCategory(category);
		
		// 현재 페이지 수 --> 기본값은 1페이지로 설정함
		int page = web.getInt("page", 1);
		
		// 제목과 내용에 대한 검색으로 활용하기 위해서 입력값을 설정한다.
		document.setSubject(keyword);
		document.setContent(keyword);
		
		/** 게시글 목록 조회 */
		int totalCount = 0;
		List<Document> documentList = null;
		try {
			// 전체 게시물 수
			totalCount = documentService.selectDocumentCount(document);
			
			// 나머지 페이지 번호 계산하기
			// --> 현재 페이지, 전체 게시물 수, 한페이지의 목록 수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 12, 5);
			
			// 페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
			document.setLimitStart(pageHelper.getLimitStart());
			document.setListCount(pageHelper.getListCount());
			
			documentList = documentService.selectDocumentList(document);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		/** 조회 결과를 View에 전달 */
		request.setAttribute("documentList", documentList);
		// 사용자가 입력한 검색어를 View에 되돌려 준다.
		request.setAttribute("keyword", keyword);
		// 페이지 번호 계산 결과를 view에 전달
		request.setAttribute("pageHelper", pageHelper);
		
		return "bbs/document_list";	
		
	}
}
