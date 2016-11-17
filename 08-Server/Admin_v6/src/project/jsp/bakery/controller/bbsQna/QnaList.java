package project.jsp.bakery.controller.bbsQna;

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

@WebServlet("/bbs/qna_list.do")
public class QnaList extends BaseController {
	private static final long serialVersionUID = 7343203084535912702L;

	/** 1) 사용하고자 하는 핼퍼 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	DocumentService documentService;
	PageHelper pageHelper;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			
		
		//** 2 사용하고자 하는 핼퍼+서비스 객체 생성 *//*
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		documentService = new DocumentServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		
		
		/** 조회할 정보에 대한 Beans 생성 */
		// 검색어
		String keyword = web.getString("keyword");
		
		Document document = new Document();
			
		
		// 현재 페이지 수 --> 기본값은 1페이지로 설정함
		int page = web.getInt("page", 1);
		
		// 제목과 내용에 대한 검색으로 활용하기 위해서 입력값을 설정한다.
		document.setSubject(keyword);
		document.setContent(keyword);
		document.setCategory("qna");
		
				
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
		
		request.setAttribute("category", document);
		/** 조회 결과를 View에 전달 */
		request.setAttribute("documentList", documentList);
		// 사용자가 입력한 검색어를 View에 되돌려 준다.
		request.setAttribute("keyword", keyword);
		// 페이지 번호 계산 결과를 view에 전달
		request.setAttribute("pageHelper", pageHelper);
		
		return "bbs/qna_list";	
		
	}
}
