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
import project.jsp.helper.RegexHelper;
import project.jsp.helper.UploadHelper;
import project.jsp.helper.WebHelper;

@WebServlet("/bbs/comment_edit_ok.do")
public class CommentEditOk extends BaseController {
	private static final long serialVersionUID = 2589337375710157054L;
	
	/** 사용하고자 하는 핼퍼 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	UploadHelper upload;
	RegexHelper regex;
	CommentService commentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		/** 사용하고자 하는 핼퍼+서비스 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		regex = RegexHelper.getInstance();
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		int documentId = web.getInt("documentId");
		int commentId = web.getInt("comment_id");
		String coContent = web.getString("content");

		// 파라미터 로그로 확인
		logger.debug("co_content=" + coContent);

		// ** 파라미터를 빈즈로 묶기*//*
		
		
		Comment comment = new Comment();
		comment.setDocumentId(documentId);
		comment.setCoContent(coContent);
		comment.setId(commentId);
		comment.setMemberId(1);
		

		/** 서비스를 통한 게시물 저장 */
		try {
			commentService.updateComment(comment);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}

		/** 저장후 읽기 페이지로 이동하기 */
		// 읽어들일 게시물을 식별하기 위한 게시물 일련번호 값을 전달해야 한다.
		String url = "%s/bbs/qna_list.do";
		url = String.format(url, web.getRootPath());
		web.redirect(url, "답변이 수정되었습니다.");
		
		return null;
	}

}