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
import project.jsp.bakery.model.Member;
import project.jsp.bakery.service.DocumentService;
import project.jsp.bakery.service.impl.DocumentServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.WebHelper;


@WebServlet("/bbs/document_delete.do")
public class DocumentDelete extends BaseController {
	private static final long serialVersionUID = 1661776226423457729L;

	/** 사용하고자 하는 핼퍼 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	DocumentService documentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		/** 사용하고자 하는 핼퍼 + 서비스 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		documentService = new DocumentServiceImpl(sqlSession, logger);
				
		/** 게시판 카테고리 값을 받아서 뷰에 전달*/
		String category = web.getString("category");
		request.setAttribute("category", category);
		
		/** 존재하는 게시판인지 판별 */
		try {
			String bbsName = bbs.getBbsName(category);
			request.setAttribute("bbsName", bbsName);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** 게시글 번호 받기 */
		int documentId = web.getInt("document_id");
		if (documentId == 0) {
			sqlSession.close();
			web.redirect(null, "글 번호가 없습니다.");
			return null;
		}
		
		// 파라미터를 Beans로 묶기
		Document document = new Document();
		document.setId(documentId);
		document.setCategory(category);
		
		// 로그인 한 경우 현재 회원의 일련번호를 추가한다. (비로그인시 0 으로 설정됨)
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			document.setMemberId(loginInfo.getId());
		}
		
		/** 게시물 일련번호를 사용한 데이터 조회 */
		// 회원번호가 일치하는 게시물 수 조회하기
		int documentCount = 0;
		try {
			documentCount = documentService.selectDocumentCountByMemberId(document);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** 자신의 글에 대한 요청인지에 대한 여부를 뷰에 전달 */
		boolean myDocument = documentCount > 0;
		request.setAttribute("myDocument", myDocument);
		
		// 상태유지를 위하여 게시글 일련번호를 View에 전달한다.
		request.setAttribute("documentId", documentId);
		
		return "bbs/document_delete";
	}

}
