package project.jsp.bakery.controller.bbsQna;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import project.jsp.bakery.dao.MyBatisConnectionFactory;
import project.jsp.bakery.model.Comment;
import project.jsp.bakery.model.Document;
import project.jsp.bakery.service.CommentService;
import project.jsp.bakery.service.DocumentService;
import project.jsp.bakery.service.impl.CommentServiceImpl;
import project.jsp.bakery.service.impl.DocumentServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.WebHelper;

@WebServlet("/bbs/member_qna_read.do")
public class MemberQnaRead extends BaseController {

	/** 1) 사용하고자 하는 핼퍼 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	DocumentService documentService;
	CommentService CommentService;

	private static final long serialVersionUID = -8696470953148404039L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// ** 2 사용하고자 하는 핼퍼+서비스 객체 생성 *//*
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		documentService = new DocumentServiceImpl(sqlSession, logger);
		CommentService = new CommentServiceImpl(sqlSession, logger);

		/** 글 번호 파라미터 받기 */
		int documentId = web.getInt("document_id");
		int commentId = web.getInt("comment_id");
		int memberId = web.getInt("Member_id");
		logger.debug("document_id=" + documentId);

		if (documentId == 0) {
			web.redirect(null, "글 번호가 지정되지 않았습니다.");
			sqlSession.close();
			return null;
		}

		// 파라미터를 Beans 로 묶기
		Document document = new Document();
		document.setId(documentId);
		document.setCategory("qna");
		document.setMemberId(memberId);

		Comment comment = new Comment();
		comment.setDocumentId(documentId);
		comment.setId(commentId);
		comment.setMemberId(1);

		/** 게시물 일련번호를 사용한 데이터 조회 */
		Document readDocument = null;
		Document prevDocument = null;
		Document nextDocument = null;
		Comment readComment = null;
		try {
			readDocument = documentService.selectDocument(document);
			prevDocument = documentService.selectMyPrevDocument(document);
			nextDocument = documentService.selectMyNextDocument(document);
			readComment = CommentService.selectComment(comment);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		/** 읽은 데이터를 view에게 전달한다. */
		request.setAttribute("readDocument", readDocument);
		request.setAttribute("prevDocument", prevDocument);
		request.setAttribute("nextDocument", nextDocument);
		request.setAttribute("readComment", readComment);

		return "bbs/member_qna_read";

	}

}
