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
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

@WebServlet("/bbs/document_delete_ok.do")
public class DocumentDeleteOk extends BaseController {
	private static final long serialVersionUID = -4791807590110054126L;

	/** 사용하고자 하는 핼퍼 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	UploadHelper upload;
	DocumentService documentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		/** 사용하고자하는 핼퍼+서비스 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		upload = UploadHelper.getInstance();
		documentService = new DocumentServiceImpl(sqlSession, logger);
		
		/** 게시판 카테고리 값을 받아서 뷰에 전달 */
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
		
		/** 게시글 번호와 비밀번호 받기 */
		int documentId = web.getInt("document_id");
		String writerPw = web.getString("writer_pw");
		
		logger.debug("documentId=" + documentId);
		logger.debug("writerPw=" + writerPw);
		
		if (documentId == 0) {
			sqlSession.close();
			web.redirect(null, "글 번호가 없습니다.");
			return null;
		}
		
		/** 파라미터를 Beans로 묶기 */
		Document document = new Document(); // 게시글 데이터 삭제용
		document.setId(documentId);
		document.setCategory(category);
		document.setWriterPw(writerPw);
		
		/** 데이터 삭제 처리 */
		// 로그인 중이라면 회원일련번호를 Beans에 추가한다.
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			document.setMemberId(loginInfo.getId());
		}
		
		try {
			// Beans에 추가된 자신의 회원번호를 사용하여 자신의 글임을 판별한다.
			// --> 자신의 글이 아니라면 비밀번호 검사
			if (documentService.selectDocumentCountByMemberId(document) < 1) {
				documentService.selectDocumentCountByPw(document);
			}
			documentService.deleteDocument(document);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		/** 페이지 이동 */
		String url = "%s/bbs/document_list.do?category=%s";
		url = String.format(url, web.getRootPath(), category);
		
		web.redirect(url, "삭제되었습니다.");
		
		return null;
	}
	
    

}
