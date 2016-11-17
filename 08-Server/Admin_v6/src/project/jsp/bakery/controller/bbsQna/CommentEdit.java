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
import project.jsp.bakery.service.CommentService;
import project.jsp.bakery.service.impl.CommentServiceImpl;
import project.jsp.helper.BaseController;
import project.jsp.helper.WebHelper;

@WebServlet("/bbs/comment_edit.do")
public class CommentEdit extends BaseController {
	private static final long serialVersionUID = 1121004661967392160L;

	/** 1) 사용하고자 하는 핼퍼 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	CommentService commentService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// ** 2 사용하고자 하는 핼퍼+서비스 객체 생성 *//*
		/** 사용하고자 하는 핼퍼 + 서비스 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		commentService = new CommentServiceImpl(sqlSession, logger);

		int commentId = web.getInt("comment_id");
		int documentId = web.getInt("document_id");

		logger.debug("comment_id=" + commentId);

		if (commentId == 0) {
			web.redirect(null, "답변 번호가 지정되지 않았습니다.");
			sqlSession.close();
			return null;
		}

		Comment comment = new Comment();
		comment.setId(commentId);
		comment.setDocumentId(documentId);
		comment.setMemberId(1);

		/** 답변 일련번호를 사용한 데이터 조회 */
		Comment readComment = null;

		try {
			readComment = commentService.selectComment(comment);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		/** 읽은 데이터를 View에 전달 */
		request.setAttribute("readComment", readComment);
		request.setAttribute("documentId", documentId);

		return "bbs/comment_edit";
	}

}
